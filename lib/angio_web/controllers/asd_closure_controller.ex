defmodule AngioWeb.Asd_closureController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Asd_closure
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  plug(:scrub_params, "asd_closure" when action in [:create, :update])

  def index(conn, _params) do
    asd_closures = Interventions.list_asd_closures(conn)
    render(conn, "index.html", asd_closures: asd_closures)
  end

  def new(conn, _params) do
    changeset = Interventions.change_asd_closure(%Asd_closure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"asd_closure" => asd_closure_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:asd_closures)
      |> Asd_closure.changeset(asd_closure_params)

    case Repo.insert(changeset) do
      {:ok, _asd_closure} ->
        conn
        |> put_flash(:info, "ASD Closure Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_asdcl_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ##############################
    end
  end

  def show(conn, %{"id" => id}) do
    asd_closure = Interventions.get_asd_closure!(id)
    render(conn, "show.html", asd_closure: asd_closure)
  end

  def edit(conn, %{"id" => id}) do
    asd_closure = Interventions.get_asd_closure!(id)
    changeset = Interventions.change_asd_closure(asd_closure)
    render(conn, "edit.html", asd_closure: asd_closure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "asd_closure" => asd_closure_params}) do
    asd_closure = Interventions.get_asd_closure!(id)

    case Interventions.update_asd_closure(asd_closure, asd_closure_params) do
      {:ok, _asd_closure} ->
        conn
        |> put_flash(:info, "Asd closure updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_asdcl_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.asd_closure_path(conn, :show, asd_closure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", asd_closure: asd_closure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asd_closure = Interventions.get_asd_closure!(id)
    {:ok, _asd_closure} = Interventions.delete_asd_closure(asd_closure)

    conn
    |> put_flash(:info, "Asd closure deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_asdcl_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

  end
end
