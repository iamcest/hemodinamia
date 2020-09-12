defmodule AngioWeb.Proc_historyController do
  use AngioWeb, :controller

  alias Angio.Histories
  alias Angio.Histories.Proc_history
  alias Angio.Repo

  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "proc_history" when action in [:create, :update])

  def index(conn, _params) do
    proc_histories = Histories.list_proc_histories(conn)

    render(conn, "index.html", proc_histories: proc_histories)
  end

  def new(conn, _params) do
    changeset = Histories.change_proc_history(%Proc_history{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"proc_history" => proc_history_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:proc_histories)
      |> Proc_history.changeset(proc_history_params)

    case Repo.insert(changeset) do
      {:ok, _social_history} ->
        conn
        |> put_flash(:info, " Record For Procedure  History created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_proch_path(
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

    ###########################
  end

  def show(conn, %{"id" => id}) do
    proc_history = Histories.get_proc_history!(id)
    render(conn, "show.html", proc_history: proc_history)
  end

  def edit(conn, %{"id" => id}) do
    proc_history = Histories.get_proc_history!(id)
    changeset = Histories.change_proc_history(proc_history)
    render(conn, "edit.html", proc_history: proc_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "proc_history" => proc_history_params}) do
    proc_history = Histories.get_proc_history!(id)

    case Histories.update_proc_history(proc_history, proc_history_params) do
      {:ok, _proc_history} ->
        conn
        |> put_flash(:info, "Proc history updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_proch_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.proc_history_path(conn, :show, proc_history))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", proc_history: proc_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proc_history = Histories.get_proc_history!(id)
    {:ok, _proc_history} = Histories.delete_proc_history(proc_history)

    conn
    |> put_flash(:info, "Proc history deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_proch_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.proc_history_path(conn, :index))
  end
end
