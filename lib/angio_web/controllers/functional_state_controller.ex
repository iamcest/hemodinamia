defmodule AngioWeb.Functional_stateController do
  use AngioWeb, :controller

  alias Angio.Assements
  alias Angio.Assements.Functional_state
  alias Angio.Repo
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "functional_state" when action in [:create, :update])

  def index(conn, _params) do
    functional_states = Assements.list_functional_states(conn)
    render(conn, "index.html", functional_states: functional_states)
  end

  def new(conn, _params) do
    changeset = Assements.change_functional_state(%Functional_state{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"functional_state" => functional_state_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:functional_states)
      |> Functional_state.changeset(functional_state_params)

    case Repo.insert(changeset) do
      {:ok, _vital_sign} ->
        conn
        |> put_flash(:info, " Record For Functional States created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_funs_path(
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
    functional_state = Assements.get_functional_state!(id)
    render(conn, "show.html", functional_state: functional_state)
  end

  def edit(conn, %{"id" => id}) do
    functional_state = Assements.get_functional_state!(id)
    changeset = Assements.change_functional_state(functional_state)
    render(conn, "edit.html", functional_state: functional_state, changeset: changeset)
  end

  def update(conn, %{"id" => id, "functional_state" => functional_state_params}) do
    functional_state = Assements.get_functional_state!(id)

    case Assements.update_functional_state(functional_state, functional_state_params) do
      {:ok, functional_state} ->
        conn
        |> put_flash(:info, "Functional state updated successfully.")
        # |> redirect(to: Routes.functional_state_path(conn, :show, functional_state))
        |> redirect(
          to:
            Routes.pt_angio_funs_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", functional_state: functional_state, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    functional_state = Assements.get_functional_state!(id)
    {:ok, _functional_state} = Assements.delete_functional_state(functional_state)

    conn
    |> put_flash(:info, "Record For Functional states deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_funs_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.functional_state_path(conn, :index))
  end
end
