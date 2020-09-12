defmodule AngioWeb.Care_episodeController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Care_episode
  alias Angio.Repo
  plug(:scrub_params, "care_episode" when action in [:create, :update])

  def index(conn, _params) do
    care_episodes = Caths.list_care_episodes(conn)
    render(conn, "index.html", care_episodes: care_episodes)
  end

  def new(conn, _params) do
    changeset = Caths.change_care_episode(%Care_episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"care_episode" => care_episode_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:care_episodes)
      |> Care_episode.changeset(care_episode_params)

    case Repo.insert(changeset) do
      {:ok, _care_episode} ->
        conn
        |> put_flash(:info, "Care Episode  created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_episode_path(
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
    care_episode = Caths.get_care_episode!(id)
    render(conn, "show.html", care_episode: care_episode)
  end

  def edit(conn, %{"id" => id}) do
    care_episode = Caths.get_care_episode!(id)
    changeset = Caths.change_care_episode(care_episode)
    render(conn, "edit.html", care_episode: care_episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "care_episode" => care_episode_params}) do
    care_episode = Caths.get_care_episode!(id)

    case Caths.update_care_episode(care_episode, care_episode_params) do
      {:ok, _care_episode} ->
        conn
        |> put_flash(:info, "Care episode updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_episode_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", care_episode: care_episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    care_episode = Caths.get_care_episode!(id)
    {:ok, _care_episode} = Caths.delete_care_episode(care_episode)

    conn
    |> put_flash(:info, "Care episode deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_episode_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.care_episode_path(conn, :index))
  end
end
