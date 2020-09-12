defmodule AngioWeb.Cath_medController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cath_med
  alias Angio.Repo

  plug(:scrub_params, "cath_med" when action in [:create, :update])

  def index(conn, _params) do
    cath_meds = Caths.list_cath_meds(conn)
    render(conn, "index.html", cath_meds: cath_meds)
  end

  def new(conn, _params) do
    changeset = Caths.change_cath_med(%Cath_med{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cath_med" => cath_med_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_meds)
      |> Cath_med.changeset(cath_med_params)

    case Repo.insert(changeset) do
      {:ok, _cath_med} ->
        conn
        |> put_flash(:info, "Medications  Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cathmed_path(
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
    cath_med = Caths.get_cath_med!(id)
    render(conn, "show.html", cath_med: cath_med)
  end

  def edit(conn, %{"id" => id}) do
    cath_med = Caths.get_cath_med!(id)
    changeset = Caths.change_cath_med(cath_med)
    render(conn, "edit.html", cath_med: cath_med, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_med" => cath_med_params}) do
    cath_med = Caths.get_cath_med!(id)

    case Caths.update_cath_med(cath_med, cath_med_params) do
      {:ok, _cath_med} ->
        conn
        |> put_flash(:info, "Cath med updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cathmed_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_med: cath_med, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cath_med = Caths.get_cath_med!(id)
    {:ok, _cath_med} = Caths.delete_cath_med(cath_med)

    conn
    |> put_flash(:info, "Cath med deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_cathmed_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.cath_med_path(conn, :index))
  end
end
