defmodule AngioWeb.Cath_radiationController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cath_radiation
  alias Angio.Repo

  plug(:scrub_params, "cath_radiation" when action in [:create, :update])

  def index(conn, _params) do
    cath_radiations = Caths.list_cath_radiations(conn)
    render(conn, "index.html", cath_radiations: cath_radiations)
  end

  def new(conn, _params) do
    changeset = Caths.change_cath_radiation(%Cath_radiation{})
    render(conn, "new.html", changeset: changeset)
  end

  ################
  def create(conn, %{"cath_radiation" => cath_radiation_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_radiations)
      |> Cath_radiation.changeset(cath_radiation_params)

    case Repo.insert(changeset) do
      {:ok, _cath_radiation} ->
        conn
        |> put_flash(:info, "Radiation Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_radiation_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ####################
    end
  end

  #########################
  def show(conn, %{"id" => id}) do
    cath_radiation = Caths.get_cath_radiation!(id)
    render(conn, "show.html", cath_radiation: cath_radiation)
  end

  def edit(conn, %{"id" => id}) do
    cath_radiation = Caths.get_cath_radiation!(id)
    changeset = Caths.change_cath_radiation(cath_radiation)
    render(conn, "edit.html", cath_radiation: cath_radiation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_radiation" => cath_radiation_params}) do
    cath_radiation = Caths.get_cath_radiation!(id)

    case Caths.update_cath_radiation(cath_radiation, cath_radiation_params) do
      {:ok, _cath_radiation} ->
        conn
        |> put_flash(:info, "Cath radiation updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_radiation_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      #   |> redirect(to: Routes.cath_radiation_path(conn, :show, cath_radiation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_radiation: cath_radiation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cath_radiation = Caths.get_cath_radiation!(id)
    {:ok, _cath_radiation} = Caths.delete_cath_radiation(cath_radiation)

    conn
    |> put_flash(:info, "Cath radiation deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_radiation_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.cath_radiation_path(conn, :index))
  end
end
