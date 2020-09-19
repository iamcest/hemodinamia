defmodule AngioWeb.Treadmill_exerciseController do
  use AngioWeb, :controller

  alias Angio.Ivestigations
  alias Angio.Ivestigations.Treadmill_exercise
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:scrub_params, "treadmill_exercise" when action in [:create, :update])

  def index(conn, _params) do
    treadmill_exercises = Ivestigations.list_treadmill_exercises(conn)
    render(conn, "index.html", treadmill_exercises: treadmill_exercises)
  end

  def new(conn, _params) do
    changeset = Ivestigations.change_treadmill_exercise(%Treadmill_exercise{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"treadmill_exercise" => treadmill_exercise_params}) do
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:treadmill_exercises)
      |> Treadmill_exercise.changeset(treadmill_exercise_params)

    case Repo.insert(changeset) do
      {:ok, _treadmill_exercise} ->
        conn
        |> put_flash(:info, "Treadmill Exercise Record created successfully.")
        |> redirect(
          to:
            Routes.pt_ext_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ######################### 3
  end

  def show(conn, %{"id" => id}) do
    treadmill_exercise = Ivestigations.get_treadmill_exercise!(id)
    render(conn, "show.html", treadmill_exercise: treadmill_exercise)
  end

  def edit(conn, %{"id" => id}) do
    treadmill_exercise = Ivestigations.get_treadmill_exercise!(id)
    changeset = Ivestigations.change_treadmill_exercise(treadmill_exercise)
    render(conn, "edit.html", treadmill_exercise: treadmill_exercise, changeset: changeset)
  end

  def update(conn, %{"id" => id, "treadmill_exercise" => treadmill_exercise_params}) do
    treadmill_exercise = Ivestigations.get_treadmill_exercise!(id)

    case Ivestigations.update_treadmill_exercise(treadmill_exercise, treadmill_exercise_params) do
      {:ok, _treadmill_exercise} ->
        conn
        |> put_flash(:info, "Treadmill exercise updated successfully.")
        |> redirect(
          to:
            Routes.pt_ext_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      # |> redirect(to: Routes.treadmill_exercise_path(conn, :show, treadmill_exercise))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", treadmill_exercise: treadmill_exercise, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    treadmill_exercise = Ivestigations.get_treadmill_exercise!(id)
    {:ok, _treadmill_exercise} = Ivestigations.delete_treadmill_exercise(treadmill_exercise)

    conn
    |> put_flash(:info, "Treadmill exercise deleted successfully.")
    |> redirect(
      to:
        Routes.pt_ext_path(
          conn,
          :index,
          conn.assigns[:patient]
        )
    )

    # |> redirect(to: Routes.treadmill_exercise_path(conn, :index))
  end
end
