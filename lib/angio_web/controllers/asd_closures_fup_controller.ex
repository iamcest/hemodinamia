defmodule AngioWeb.Asd_closures_fupController do
  use AngioWeb, :controller

  alias Angio.Followups
  alias Angio.Followups.Asd_closures_fup
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)

  plug(:scrub_params, "asd_closures_fup" when action in [:create, :update])

  def index(conn, _params) do
    asd_closures_fups = Followups.list_asd_closures_fups(conn)
    render(conn, "index.html", asd_closures_fups: asd_closures_fups)
  end

  def new(conn, _params) do
    changeset = Followups.change_asd_closures_fup(%Asd_closures_fup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"asd_closures_fup" => asd_closures_fup_params}) do
    changeset =
    conn.assigns[:patient]
    |> Ecto.build_assoc(:asd_closures_fups)
    |> Asd_closures_fup.changeset(asd_closures_fup_params)

  case Repo.insert(changeset) do
    {:ok, _asd_closures_fup} ->
      conn
      |> put_flash(:info, "Followup  Record for ASD Closure created successfully.")
      |> redirect(
        to:
          Routes.pt_asdclf_path(
            conn,
            :index,
            conn.assigns[:patient]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)

    end

  end

  def show(conn, %{"id" => id}) do
    asd_closures_fup = Followups.get_asd_closures_fup!(id)
    render(conn, "show.html", asd_closures_fup: asd_closures_fup)
  end

  def edit(conn, %{"id" => id}) do
    asd_closures_fup = Followups.get_asd_closures_fup!(id)
    changeset = Followups.change_asd_closures_fup(asd_closures_fup)
    render(conn, "edit.html", asd_closures_fup: asd_closures_fup, changeset: changeset)
  end

  def update(conn, %{"id" => id, "asd_closures_fup" => asd_closures_fup_params}) do
    asd_closures_fup = Followups.get_asd_closures_fup!(id)

    case Followups.update_asd_closures_fup(asd_closures_fup, asd_closures_fup_params) do
      {:ok, _asd_closures_fup} ->
        conn
        |> put_flash(:info, "Asd closures fup updated successfully.")
        |> redirect(
        to:
          Routes.pt_asdclf_path(
            conn,
            :index,
            conn.assigns[:patient]
          )
      )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", asd_closures_fup: asd_closures_fup, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asd_closures_fup = Followups.get_asd_closures_fup!(id)
    {:ok, _asd_closures_fup} = Followups.delete_asd_closures_fup(asd_closures_fup)

    conn
    |> put_flash(:info, "Asd closures fup deleted successfully.")
    |> redirect(
      to:
        Routes.pt_asdclf_path(
          conn,
          :index,
          conn.assigns[:patient]
        )
    )

    #|> redirect(to: Routes.asd_closures_fup_path(conn, :index))
  end
end
