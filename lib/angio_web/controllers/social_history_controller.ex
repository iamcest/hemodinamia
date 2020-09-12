defmodule AngioWeb.Social_historyController do
  use AngioWeb, :controller

  alias Angio.Histories
  alias Angio.Histories.Social_history
  alias Angio.Repo

  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "social_history" when action in [:create, :update])

  def index(conn, _params) do
    social_histories = Histories.list_social_histories(conn)
    render(conn, "index.html", social_histories: social_histories)
  end

  def new(conn, _params) do
    changeset = Histories.change_social_history(%Social_history{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"social_history" => social_history_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:social_histories)
      |> Social_history.changeset(social_history_params)

    case Repo.insert(changeset) do
      {:ok, _social_history} ->
        conn
        |> put_flash(:info, " Record For Social History created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_socialh_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
        #######################
    end

    ########################
  end

  def show(conn, %{"id" => id}) do
    social_history = Histories.get_social_history!(id)
    render(conn, "show.html", social_history: social_history)
  end

  def edit(conn, %{"id" => id}) do
    social_history = Histories.get_social_history!(id)
    changeset = Histories.change_social_history(social_history)
    render(conn, "edit.html", social_history: social_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "social_history" => social_history_params}) do
    social_history = Histories.get_social_history!(id)

    case Histories.update_social_history(social_history, social_history_params) do
      {:ok, _social_history} ->
        conn
        |> put_flash(:info, "Social history updated successfully.")
        # |> redirect(to: Routes.social_history_path(conn, :show, social_history))
        |> redirect(
          to:
            Routes.pt_angio_socialh_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", social_history: social_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    social_history = Histories.get_social_history!(id)
    {:ok, _social_history} = Histories.delete_social_history(social_history)

    conn
    |> put_flash(:info, "Social history deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_socialh_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.social_history_path(conn, :index))
  end
end
