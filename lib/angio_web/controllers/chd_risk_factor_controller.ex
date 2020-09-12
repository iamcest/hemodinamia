defmodule AngioWeb.Chd_risk_factorController do
  use AngioWeb, :controller
  import AngioPlug

  alias Angio.Congenitals
  alias Angio.Congenitals.Chd_risk_factor
  alias Angio.Repo
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "chd_risk_factor" when action in [:create, :update])

  def index(conn, _params) do
    chd_risk_factors = Congenitals.list_chd_risk_factors(conn)
    render(conn, "index.html", chd_risk_factors: chd_risk_factors)
  end

  def new(conn, _params) do
    changeset = Congenitals.change_chd_risk_factor(%Chd_risk_factor{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"chd_risk_factor" => chd_risk_factor_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:chd_risk_factors)
      |> Chd_risk_factor.changeset(chd_risk_factor_params)

    case Repo.insert(changeset) do
      {:ok, _chd_risk_factor} ->
        conn
        |> put_flash(:info, "Congenital Risk Factor Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_risk_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    #######################
  end

  def show(conn, %{"id" => id}) do
    chd_risk_factor = Congenitals.get_chd_risk_factor!(id)
    render(conn, "show.html", chd_risk_factor: chd_risk_factor)
  end

  def edit(conn, %{"id" => id}) do
    chd_risk_factor = Congenitals.get_chd_risk_factor!(id)
    changeset = Congenitals.change_chd_risk_factor(chd_risk_factor)
    render(conn, "edit.html", chd_risk_factor: chd_risk_factor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chd_risk_factor" => chd_risk_factor_params}) do
    chd_risk_factor = Congenitals.get_chd_risk_factor!(id)

    case Congenitals.update_chd_risk_factor(chd_risk_factor, chd_risk_factor_params) do
      {:ok, _chd_risk_factor} ->
        conn
        |> put_flash(:info, "Chd risk factor updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_risk_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chd_risk_factor: chd_risk_factor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chd_risk_factor = Congenitals.get_chd_risk_factor!(id)
    {:ok, _chd_risk_factor} = Congenitals.delete_chd_risk_factor(chd_risk_factor)

    conn
    |> put_flash(:info, "Congenital Risk Factors deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_chd_risk_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end


end
