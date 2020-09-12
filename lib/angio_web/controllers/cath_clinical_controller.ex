defmodule AngioWeb.Cath_clinicalController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Clinicals
  alias Angio.Clinicals.Cath_clinical
  alias Angio.Repo

  plug(:scrub_params, "cath_clinical" when action in [:create, :update])

  def index(conn, _params) do
    cath_clinicals = Clinicals.list_cath_clinicals(conn)
    render(conn, "index.html", cath_clinicals: cath_clinicals)
  end

  def new(conn, _params) do
    changeset = Clinicals.change_cath_clinical(%Cath_clinical{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cath_clinical" => cath_clinical_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_clinicals)
      |> Cath_clinical.changeset(cath_clinical_params)

    case Repo.insert(changeset) do
      {:ok, _cath_clinical} ->
        conn
        |> put_flash(:info, "Cath  Clinical Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_clinical_path(
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

  def show(conn, %{"id" => id}) do
    cath_clinical = Clinicals.get_cath_clinical!(id)
    render(conn, "show.html", cath_clinical: cath_clinical)
  end

  def edit(conn, %{"id" => id}) do
    cath_clinical = Clinicals.get_cath_clinical!(id)
    changeset = Clinicals.change_cath_clinical(cath_clinical)
    render(conn, "edit.html", cath_clinical: cath_clinical, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_clinical" => cath_clinical_params}) do
    cath_clinical = Clinicals.get_cath_clinical!(id)

    case Clinicals.update_cath_clinical(cath_clinical, cath_clinical_params) do
      {:ok, _cath_clinical} ->
        conn
        |> put_flash(:info, "Cath clinical updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_clinical_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.cath_clinical_path(conn, :show, cath_clinical))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_clinical: cath_clinical, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cath_clinical = Clinicals.get_cath_clinical!(id)
    {:ok, _cath_clinical} = Clinicals.delete_cath_clinical(cath_clinical)

    conn
    |> put_flash(:info, "Cath clinical deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_clinical_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.cath_clinical_path(conn, :index))
  end
end
