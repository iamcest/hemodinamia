defmodule AngioWeb.Proc_episodeController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Proc_episode
  alias Angio.Repo
  plug(:scrub_params, "proc_episode" when action in [:create, :update])

  def index(conn, _params) do
    proc_episodes = Caths.list_proc_episodes(conn)
    render(conn, "index.html", proc_episodes: proc_episodes)
  end

  def new(conn, _params) do
    changeset = Caths.change_proc_episode(%Proc_episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"proc_episode" => proc_episode_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:proc_episodes)
      |> Proc_episode.changeset(proc_episode_params)

    case Repo.insert(changeset) do
      {:ok, _proc_episode} ->
        conn
        |> put_flash(:info, "Procedure's Episode  created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_proc_episode_path(
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
    proc_episode = Caths.get_proc_episode!(id)
    render(conn, "show.html", proc_episode: proc_episode)
  end

  def edit(conn, %{"id" => id}) do
    proc_episode = Caths.get_proc_episode!(id)
    changeset = Caths.change_proc_episode(proc_episode)
    render(conn, "edit.html", proc_episode: proc_episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "proc_episode" => proc_episode_params}) do
    proc_episode = Caths.get_proc_episode!(id)

    case Caths.update_proc_episode(proc_episode, proc_episode_params) do
      {:ok, _proc_episode} ->
        conn
        |> put_flash(:info, "Procedure's Episode Updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_proc_episode_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", proc_episode: proc_episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proc_episode = Caths.get_proc_episode!(id)
    {:ok, _proc_episode} = Caths.delete_proc_episode(proc_episode)

    conn
    |> put_flash(:info, "Procedure Details deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_proc_episode_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.proc_episode_path(conn, :index))
  end
end
