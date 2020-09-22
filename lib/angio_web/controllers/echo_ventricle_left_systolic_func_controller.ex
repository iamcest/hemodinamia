defmodule AngioWeb.Echo_ventricle_left_systolic_funcController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Echo_ventricle_left_systolic_func
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:assign_cardiac_echo)

  plug(:scrub_params, "echo_ventricle_left_systolic_func" when action in [:create, :update])

  def index(conn, _params) do
    echo_ventricle_left_systolic_funcs =
      Ivestigations.list_echo_ventricle_left_systolic_funcs(conn)

    render(conn, "index.html",
      echo_ventricle_left_systolic_funcs: echo_ventricle_left_systolic_funcs
    )

    # echo_ventricle_left_systolic_funcs = Ivestigations.list_echo_ventricle_left_systolic_funcs()
    # render(conn, "index.html", echo_ventricle_left_systolic_funcs: echo_ventricle_left_systolic_funcs)
  end

  def new(conn, _params) do
    changeset =
      Ivestigations.change_echo_ventricle_left_systolic_func(%Echo_ventricle_left_systolic_func{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{
        "echo_ventricle_left_systolic_func" => echo_ventricle_left_systolic_func_params
      }) do
    changeset =
      conn.assigns[:cardiac_echo]
      |> Ecto.build_assoc(:echo_ventricle_left_systolic_funcs)
      |> Echo_ventricle_left_systolic_func.changeset(echo_ventricle_left_systolic_func_params)

    case Repo.insert(changeset) do
      {:ok, _echo_ventricle_left} ->
        conn
        |> put_flash(:info, "Echo For LV Sys Function  Record created successfully.")
        |> redirect(
          to:
            Routes.pt_echo_elvsf_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:cardiac_echo]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ####################### 3
    ########################
  end

  def show(conn, %{"id" => id}) do
    echo_ventricle_left_systolic_func = Ivestigations.get_echo_ventricle_left_systolic_func!(id)

    render(conn, "show.html", echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func)
  end

  def edit(conn, %{"id" => id}) do
    echo_ventricle_left_systolic_func = Ivestigations.get_echo_ventricle_left_systolic_func!(id)

    changeset =
      Ivestigations.change_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)

    render(conn, "edit.html",
      echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func,
      changeset: changeset
    )
  end

  def update(conn, %{
        "id" => id,
        "echo_ventricle_left_systolic_func" => echo_ventricle_left_systolic_func_params
      }) do
    echo_ventricle_left_systolic_func = Ivestigations.get_echo_ventricle_left_systolic_func!(id)

    case Ivestigations.update_echo_ventricle_left_systolic_func(
           echo_ventricle_left_systolic_func,
           echo_ventricle_left_systolic_func_params
         ) do
      {:ok, echo_ventricle_left_systolic_func} ->
        conn
        |> put_flash(:info, "Echo ventricle left systolic func updated successfully.")
        |> redirect(
          to:
            Routes.pt_echo_elvsf_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:cardiac_echo]
            )
        )

      # |> redirect(to: Routes.echo_ventricle_left_systolic_func_path(conn, :show, echo_ventricle_left_systolic_func))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html",
          echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func,
          changeset: changeset
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    echo_ventricle_left_systolic_func = Ivestigations.get_echo_ventricle_left_systolic_func!(id)

    {:ok, _echo_ventricle_left_systolic_func} =
      Ivestigations.delete_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)

    conn
    |> put_flash(:info, "Echo ventricle left systolic func deleted successfully.")
    |> redirect(
      to:
        Routes.pt_echo_elvsf_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:cardiac_echo]
        )
    )

    # |> redirect(to: Routes.echo_ventricle_left_systolic_func_path(conn, :index))
  end
end
