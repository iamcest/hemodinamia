defmodule AngioWeb.Echo_left_atriumController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Echo_left_atrium
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:assign_cardiac_echo)

  plug(:scrub_params, "echo_left_atrium" when action in [:create, :update])

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    echo_left_atriums = Ivestigations.list_echo_left_atriums(conn)
    render(conn, "index.html", echo_left_atriums: echo_left_atriums)
  end

  def new(conn, _params) do
    changeset = Ivestigations.change_echo_left_atrium(%Echo_left_atrium{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"echo_left_atrium" => echo_left_atrium_params}) do

    changeset =
    conn.assigns[:cardiac_echo]
    |> Ecto.build_assoc(:echo_left_atriums)
    |> Echo_left_atrium.changeset(echo_left_atrium_params)

  case Repo.insert(changeset) do
    {:ok, _echo_left_atrium} ->
      conn
      |> put_flash(:info, "Echo For LA Record created successfully.")
      |> redirect(
        to:
          Routes.pt_echo_ela_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:cardiac_echo]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end


    ###########################33

  end

  def show(conn, %{"id" => id}) do
    echo_left_atrium = Ivestigations.get_echo_left_atrium!(id)
    render(conn, "show.html", echo_left_atrium: echo_left_atrium)
  end

  def edit(conn, %{"id" => id}) do
    echo_left_atrium = Ivestigations.get_echo_left_atrium!(id)
    changeset = Ivestigations.change_echo_left_atrium(echo_left_atrium)
    render(conn, "edit.html", echo_left_atrium: echo_left_atrium, changeset: changeset)
  end

  def update(conn, %{"id" => id, "echo_left_atrium" => echo_left_atrium_params}) do
    echo_left_atrium = Ivestigations.get_echo_left_atrium!(id)

    case Ivestigations.update_echo_left_atrium(echo_left_atrium, echo_left_atrium_params) do
      {:ok, _echo_left_atrium} ->
        conn
        |> put_flash(:info, "Echo left atrium updated successfully.")
        |> redirect(
        to:
          Routes.pt_echo_ela_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:cardiac_echo]
          )
      )

        #|> redirect(to: Routes.echo_left_atrium_path(conn, :show, echo_left_atrium))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", echo_left_atrium: echo_left_atrium, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    echo_left_atrium = Ivestigations.get_echo_left_atrium!(id)
    {:ok, _echo_left_atrium} = Ivestigations.delete_echo_left_atrium(echo_left_atrium)

    conn
    |> put_flash(:info, "Echo left atrium deleted successfully.")
    |> redirect(
      to:
        Routes.pt_echo_ela_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:cardiac_echo]
        )
    )

    # |> redirect(to: Routes.echo_left_atrium_path(conn, :index))
  end
end
