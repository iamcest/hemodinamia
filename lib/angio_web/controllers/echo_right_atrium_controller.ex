defmodule AngioWeb.Echo_right_atriumController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Echo_right_atrium
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:assign_cardiac_echo)

  plug(:scrub_params, "echo_right_atrium" when action in [:create, :update])
  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    echo_right_atriums = Ivestigations.list_echo_right_atriums(conn)
    render(conn, "index.html", echo_right_atriums: echo_right_atriums)
  end

  def new(conn, _params) do
    changeset = Ivestigations.change_echo_right_atrium(%Echo_right_atrium{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"echo_right_atrium" => echo_right_atrium_params}) do


    changeset =
    conn.assigns[:cardiac_echo]
    |> Ecto.build_assoc(:echo_right_atriums)
    |> Echo_right_atrium.changeset(echo_right_atrium_params)

  case Repo.insert(changeset) do
    {:ok, _echo_right_atrium} ->
      conn
      |> put_flash(:info, "Echo For LA Record created successfully.")
      |> redirect(
        to:
          Routes.pt_echo_era_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:cardiac_echo]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end

  end

  def show(conn, %{"id" => id}) do
    echo_right_atrium = Ivestigations.get_echo_right_atrium!(id)
    render(conn, "show.html", echo_right_atrium: echo_right_atrium)
  end

  def edit(conn, %{"id" => id}) do
    echo_right_atrium = Ivestigations.get_echo_right_atrium!(id)
    changeset = Ivestigations.change_echo_right_atrium(echo_right_atrium)
    render(conn, "edit.html", echo_right_atrium: echo_right_atrium, changeset: changeset)
  end

  def update(conn, %{"id" => id, "echo_right_atrium" => echo_right_atrium_params}) do
    echo_right_atrium = Ivestigations.get_echo_right_atrium!(id)

    case Ivestigations.update_echo_right_atrium(echo_right_atrium, echo_right_atrium_params) do
      {:ok, _echo_right_atrium} ->
        conn
        |> put_flash(:info, "Echo right atrium updated successfully.")
        |> redirect(
        to:
          Routes.pt_echo_era_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:cardiac_echo]
          )
      )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", echo_right_atrium: echo_right_atrium, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    echo_right_atrium = Ivestigations.get_echo_right_atrium!(id)
    {:ok, _echo_right_atrium} = Ivestigations.delete_echo_right_atrium(echo_right_atrium)

    conn
    |> put_flash(:info, "Echo right atrium deleted successfully.")
    |> redirect(
      to:
        Routes.pt_echo_era_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:cardiac_echo]
        )
    )
    #|> redirect(to: Routes.echo_right_atrium_path(conn, :index))
  end
end
