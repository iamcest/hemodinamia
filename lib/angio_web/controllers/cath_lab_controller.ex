defmodule AngioWeb.Cath_labController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cath_lab
  alias Angio.Repo
  plug(:scrub_params, "cath_lab" when action in [:create, :update])

  def index(conn, _params) do
    cath_labs = Caths.list_cath_labs(conn)
    render(conn, "index.html", cath_labs: cath_labs)
  end

  def new(conn, _params) do
    changeset = Caths.change_cath_lab(%Cath_lab{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cath_lab" => cath_lab_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_labs)
      |> Cath_lab.changeset(cath_lab_params)

    case Repo.insert(changeset) do
      {:ok, _cath_lab} ->
        conn
        |> put_flash(:info, "Blood Lab  Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cath_lab_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ################################
    end

    ###################################
  end

  def show(conn, %{"id" => id}) do
    cath_lab = Caths.get_cath_lab!(id)
    render(conn, "show.html", cath_lab: cath_lab)
  end

  def edit(conn, %{"id" => id}) do
    cath_lab = Caths.get_cath_lab!(id)
    changeset = Caths.change_cath_lab(cath_lab)
    render(conn, "edit.html", cath_lab: cath_lab, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_lab" => cath_lab_params}) do
    cath_lab = Caths.get_cath_lab!(id)

    case Caths.update_cath_lab(cath_lab, cath_lab_params) do
      {:ok, _cath_lab} ->
        conn
        |> put_flash(:info, "Cath lab updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cath_lab_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.cath_lab_path(conn, :show, cath_lab))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_lab: cath_lab, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cath_lab = Caths.get_cath_lab!(id)
    {:ok, _cath_lab} = Caths.delete_cath_lab(cath_lab)

    conn
    |> put_flash(:info, "Cath lab deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_cath_lab_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.cath_lab_path(conn, :index))
  end
end
