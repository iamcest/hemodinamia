defmodule AngioWeb.Cardiac_echoController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Cardiac_echo
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:scrub_params, "cardiac_echo" when action in [:create, :update])

  def index(conn, _params) do
    cardiac_echoes = Ivestigations.list_cardiac_echoes(conn)
    render(conn, "index.html", cardiac_echoes: cardiac_echoes)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Ivestigations.change_cardiac_echo(%Cardiac_echo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cardiac_echo" => cardiac_echo_params}) do
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:cardiac_echoes)
      |> Cardiac_echo.changeset(cardiac_echo_params)

    case Repo.insert(changeset) do
      {:ok, _cardiac_echo} ->
        conn
        |> put_flash(:info, "Cardiac Echo Encounter Record created successfully.")
        |> redirect(
          to:
            Routes.pt_echo_path(
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
    cardiac_echo = Ivestigations.get_cardiac_echo!(id)
    render(conn, "show.html", cardiac_echo: cardiac_echo)
  end

  def edit(conn, %{"id" => id}) do
    cardiac_echo = Ivestigations.get_cardiac_echo!(id)
    changeset = Ivestigations.change_cardiac_echo(cardiac_echo)
    render(conn, "edit.html", cardiac_echo: cardiac_echo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cardiac_echo" => cardiac_echo_params}) do
    cardiac_echo = Ivestigations.get_cardiac_echo!(id)

    case Ivestigations.update_cardiac_echo(cardiac_echo, cardiac_echo_params) do
      {:ok, _cardiac_echo} ->
        conn
        |> put_flash(:info, "Cardiac echo updated successfully.")
        # |> redirect(to: Routes.cardiac_echo_path(conn, :show, cardiac_echo))
        |> redirect(
          to:
            Routes.pt_echo_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cardiac_echo: cardiac_echo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cardiac_echo = Ivestigations.get_cardiac_echo!(id)
    {:ok, _cardiac_echo} = Ivestigations.delete_cardiac_echo(cardiac_echo)

    conn
    |> put_flash(:info, "Cardiac echo deleted successfully.")
    |> redirect(
      to:
        Routes.pt_echo_path(
          conn,
          :index,
          conn.assigns[:patient]
        )
    )

    # |> redirect(to: Routes.cardiac_echo_path(conn, :index))
  end
end
