defmodule AngioWeb.Chd_care_episodeController do
  use AngioWeb, :controller
  import AngioPlug

  alias Angio.Congenitals
  alias Angio.Congenitals.Chd_care_episode
  alias Angio.Canons.Country
  alias Angio.Repo

  # alias Angio.{Persons, Persons.Patient, Canons.Language}
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:load_countries when action in [:new, :create, :edit, :update])

  plug(:scrub_params, "chd_care_episode" when action in [:create, :update])

  def index(conn, _params) do
    chd_care_episodes = Congenitals.list_chd_care_episodes(conn)

    render(conn, "index.html", chd_care_episodes: chd_care_episodes)
  end

  def new(conn, _params) do
    changeset = Congenitals.change_chd_care_episode(%Chd_care_episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chd_care_episode" => chd_care_episode_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:chd_care_episodes)
      |> Chd_care_episode.changeset(chd_care_episode_params)

    case Repo.insert(changeset) do
      {:ok, _cath_lab} ->
        conn
        |> put_flash(:info, "Congenital Care Episode Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_episode_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ################# end #########################
    end
  end

  ###########################################
  def show(conn, %{"id" => id}) do
    chd_care_episode = Congenitals.get_chd_care_episode!(id)
    render(conn, "show.html", chd_care_episode: chd_care_episode)
  end

  def edit(conn, %{"id" => id}) do
    chd_care_episode = Congenitals.get_chd_care_episode!(id)
    changeset = Congenitals.change_chd_care_episode(chd_care_episode)
    render(conn, "edit.html", chd_care_episode: chd_care_episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chd_care_episode" => chd_care_episode_params}) do
    chd_care_episode = Congenitals.get_chd_care_episode!(id)

    case Congenitals.update_chd_care_episode(chd_care_episode, chd_care_episode_params) do
      {:ok, _chd_care_episode} ->
        conn
        |> put_flash(:info, "Chd care episode updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_episode_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.chd_care_episode_path(conn, :show, chd_care_episode))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chd_care_episode: chd_care_episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chd_care_episode = Congenitals.get_chd_care_episode!(id)
    {:ok, _chd_care_episode} = Congenitals.delete_chd_care_episode(chd_care_episode)

    conn
    |> put_flash(:info, "Chd care episode deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_chd_episode_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.chd_care_episode_path(conn, :index))
  end

  #####################################
  defp load_countries(conn, _) do
    query =
      Country
      |> Country.alphabetical()
      |> Country.names_and_codes()

    countries = Angio.Repo.all(query)
    assign(conn, :countries, countries)
  end

  ###############################
end
