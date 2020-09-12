defmodule AngioWeb.Cor_collateralController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cor_collateral
  # import Ecto.Query
  alias Angio.Repo

  def index(conn, _params) do
    cor_collaterals = Caths.list_cor_collaterals(conn)
    render(conn, "index.html", cor_collaterals: cor_collaterals)
  end

  def new(conn, _params) do
    changeset = Caths.change_cor_collateral(%Cor_collateral{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cor_collateral" => cor_collateral_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cor_collaterals)
      |> Cor_collateral.changeset(cor_collateral_params)

    case Repo.insert(changeset) do
      {:ok, _cor_collateral} ->
        conn
        |> put_flash(:info, "Collateral created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_collateral_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cor_collateral = Caths.get_cor_collateral!(id)
    render(conn, "show.html", cor_collateral: cor_collateral)
  end

  def edit(conn, %{"id" => id}) do
    cor_collateral = Caths.get_cor_collateral!(id)
    changeset = Caths.change_cor_collateral(cor_collateral)
    render(conn, "edit.html", cor_collateral: cor_collateral, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cor_collateral" => cor_collateral_params}) do
    cor_collateral = Angio.Caths.get_cor_collateral!(id)

    case Caths.update_cor_collateral(cor_collateral, cor_collateral_params) do
      {:ok, _cor_collateral} ->
        conn
        |> put_flash(:info, " Collateral updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_collateral_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cor_collateral: cor_collateral, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cor_collateral = Caths.get_cor_collateral!(id)
    {:ok, _cor_collateral} = Caths.delete_cor_collateral(cor_collateral)

    conn
    |> put_flash(:info, "Cor collateral deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_collateral_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
