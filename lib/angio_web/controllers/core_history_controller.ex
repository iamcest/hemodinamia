defmodule AngioWeb.Core_historyController do
  use AngioWeb, :controller

  alias Angio.Histories
  alias Angio.Histories.Core_history
  alias Angio.Repo

  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "core_history" when action in [:create, :update])

  def index(conn, _params) do
    core_histories = Histories.list_core_histories(conn)
    render(conn, "index.html", core_histories: core_histories)
  end

  def new(conn, _params) do
    changeset = Histories.change_core_history(%Core_history{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"core_history" => core_history_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:core_histories)
      |> Core_history.changeset(core_history_params)

    case Repo.insert(changeset) do
      {:ok, _core_history} ->
        conn
        |> put_flash(:info, "Essential Past History Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_coreh_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    #######################
  end

  def show(conn, %{"id" => id}) do
    core_history = Histories.get_core_history!(id)
    render(conn, "show.html", core_history: core_history)
  end

  def edit(conn, %{"id" => id}) do
    core_history = Histories.get_core_history!(id)
    changeset = Histories.change_core_history(core_history)
    render(conn, "edit.html", core_history: core_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "core_history" => core_history_params}) do
    core_history = Histories.get_core_history!(id)

    case Histories.update_core_history(core_history, core_history_params) do
      {:ok, _core_history} ->
        conn
        |> put_flash(:info, "Core history updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_coreh_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.core_history_path(conn, :show, core_history))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", core_history: core_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    core_history = Histories.get_core_history!(id)
    {:ok, _core_history} = Histories.delete_core_history(core_history)

    conn
    |> put_flash(:info, "Essential Past History deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_coreh_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.core_history_path(conn, :index))
  end
end
