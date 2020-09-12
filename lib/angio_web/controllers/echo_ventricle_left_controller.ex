defmodule AngioWeb.Echo_ventricle_leftController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Echo_ventricle_left
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:assign_cardiac_echo)

  plug(:scrub_params, "echo_ventricle_left" when action in [:create, :update])

  def index(conn, _params) do
    echo_ventricle_lefts = Ivestigations.list_echo_ventricle_lefts(conn)
    render(conn, "index.html", echo_ventricle_lefts: echo_ventricle_lefts)
  end

  def new(conn, _params) do
    changeset = Ivestigations.change_echo_ventricle_left(%Echo_ventricle_left{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"echo_ventricle_left" => echo_ventricle_left_params}) do
    changeset =
    conn.assigns[:cardiac_echo]
    |> Ecto.build_assoc(:echo_ventricle_lefts)
    |> Echo_ventricle_left.changeset(echo_ventricle_left_params)

  case Repo.insert(changeset) do
    {:ok, _echo_ventricle_left } ->
      conn
      |> put_flash(:info, "Echo For LV Structure  Record created successfully.")
      |> redirect(
        to:
          Routes.pt_echo_elv_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:cardiac_echo]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end


 #####################
  end

  def show(conn, %{"id" => id}) do
    echo_ventricle_left = Ivestigations.get_echo_ventricle_left!(id)
    render(conn, "show.html", echo_ventricle_left: echo_ventricle_left)
  end

  def edit(conn, %{"id" => id}) do
    echo_ventricle_left = Ivestigations.get_echo_ventricle_left!(id)
    changeset = Ivestigations.change_echo_ventricle_left(echo_ventricle_left)
    render(conn, "edit.html", echo_ventricle_left: echo_ventricle_left, changeset: changeset)
  end

  def update(conn, %{"id" => id, "echo_ventricle_left" => echo_ventricle_left_params}) do
    echo_ventricle_left = Ivestigations.get_echo_ventricle_left!(id)

    case Ivestigations.update_echo_ventricle_left(echo_ventricle_left, echo_ventricle_left_params) do
      {:ok, _echo_ventricle_left} ->
        conn
        |> put_flash(:info, "Echo ventricle left updated successfully.")
        |> redirect(
          to:
            Routes.pt_echo_elv_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:cardiac_echo]
            )
        )
        #|> redirect(to: Routes.echo_ventricle_left_path(conn, :show, echo_ventricle_left))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", echo_ventricle_left: echo_ventricle_left, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    echo_ventricle_left = Ivestigations.get_echo_ventricle_left!(id)
    {:ok, _echo_ventricle_left} = Ivestigations.delete_echo_ventricle_left(echo_ventricle_left)

    conn
    |> put_flash(:info, "Echo ventricle left deleted successfully.")
    |> redirect(
      to:
        Routes.pt_echo_elv_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:cardiac_echo]
        )
    )
    #|> redirect(to: Routes.echo_ventricle_left_path(conn, :index))
  end
end
