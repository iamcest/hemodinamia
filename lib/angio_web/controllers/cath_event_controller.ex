defmodule AngioWeb.Cath_eventController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cath_event
  alias Angio.Repo

  plug(:scrub_params, "cath_event" when action in [:create, :update])

  def index(conn, _params) do
    cath_events = Caths.list_cath_events(conn)
    render(conn, "index.html", cath_events: cath_events)
  end

  def new(conn, _params) do
    changeset = Caths.change_cath_event(%Cath_event{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cath_event" => cath_event_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_events)
      |> Cath_event.changeset(cath_event_params)

    case Repo.insert(changeset) do
      {:ok, _cath_event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_event_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ################## 3
  end

  def show(conn, %{"id" => id}) do
    cath_event = Caths.get_cath_event!(id)
    render(conn, "show.html", cath_event: cath_event)
  end

  def edit(conn, %{"id" => id}) do
    cath_event = Caths.get_cath_event!(id)
    changeset = Caths.change_cath_event(cath_event)
    render(conn, "edit.html", cath_event: cath_event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_event" => cath_event_params}) do
    cath_event = Caths.get_cath_event!(id)

    case Caths.update_cath_event(cath_event, cath_event_params) do
      {:ok, _cath_event} ->
        conn
        |> put_flash(:info, " Event updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_event_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_even: cath_event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cath_event = Caths.get_cath_event!(id)
    {:ok, _cath_event} = Caths.delete_cath_event(cath_event)

    conn
    |> put_flash(:info, "Cath event deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_event_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end

  ##################
  #### end module ######
end
