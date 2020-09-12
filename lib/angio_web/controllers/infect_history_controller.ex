defmodule AngioWeb.Infect_historyController do
  use AngioWeb, :controller

  alias Angio.Histories
  alias Angio.Histories.Infect_history
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  def index(conn, _params) do
    infect_histories = Histories.list_infect_histories(conn)
    render(conn, "index.html", infect_histories: infect_histories)
  end

  def new(conn, _params) do
    changeset = Histories.change_infect_history(%Infect_history{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"infect_history" => infect_history_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:infect_histories)
      |> Infect_history.changeset(infect_history_params)

    case Repo.insert(changeset) do
      {:ok, _infect_history} ->
        conn
        |> put_flash(:info, " Record For Infections History created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_infh_path(
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

  ########################
  def show(conn, %{"id" => id}) do
    infect_history = Histories.get_infect_history!(id)
    render(conn, "show.html", infect_history: infect_history)
  end

  def edit(conn, %{"id" => id}) do
    infect_history = Histories.get_infect_history!(id)
    changeset = Histories.change_infect_history(infect_history)
    render(conn, "edit.html", infect_history: infect_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "infect_history" => infect_history_params}) do
    infect_history = Histories.get_infect_history!(id)

    case Histories.update_infect_history(infect_history, infect_history_params) do
      {:ok, _infect_history} ->
        conn
        |> put_flash(:info, "Infect history updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_infh_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.infect_history_path(conn, :show, infect_history))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", infect_history: infect_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    infect_history = Histories.get_infect_history!(id)
    {:ok, _infect_history} = Histories.delete_infect_history(infect_history)

    conn
    |> put_flash(:info, "Infect history deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_infh_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.infect_history_path(conn, :index))
  end
end
