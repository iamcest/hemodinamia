defmodule AngioWeb.Sats_pressureController do
  use AngioWeb, :controller

  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Sats_pressure
  alias Angio.Repo
  plug(:scrub_params, "sats_pressure" when action in [:create, :update])

  def index(conn, _params) do
    sats_pressures = Caths.list_sats_pressures(conn)
    render(conn, "index.html", sats_pressures: sats_pressures)
  end

  def new(conn, _params) do
    changeset = Caths.change_sats_pressure(%Sats_pressure{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"sats_pressure" => sats_pressure_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:sats_pressures)
      |> Sats_pressure.changeset(sats_pressure_params)

    case Repo.insert(changeset) do
      {:ok, _sat_pressure} ->
        conn
        |> put_flash(:info, " Sats Pressure Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_satpres_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ########################
  end

  def show(conn, %{"id" => id}) do
    sats_pressure = Caths.get_sats_pressure!(id)
    render(conn, "show.html", sats_pressure: sats_pressure)
  end

  def edit(conn, %{"id" => id}) do
    sats_pressure = Caths.get_sats_pressure!(id)
    changeset = Caths.change_sats_pressure(sats_pressure)
    render(conn, "edit.html", sats_pressure: sats_pressure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sats_pressure" => sats_pressure_params}) do
    sats_pressure = Caths.get_sats_pressure!(id)

    case Caths.update_sats_pressure(sats_pressure, sats_pressure_params) do
      {:ok, _sats_pressure} ->
        conn
        |> put_flash(:info, "Sats pressure updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_satpres_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.sats_pressure_path(conn, :show, sats_pressure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sats_pressure: sats_pressure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sats_pressure = Caths.get_sats_pressure!(id)
    {:ok, _sats_pressure} = Caths.delete_sats_pressure(sats_pressure)

    conn
    |> put_flash(:info, "Sats pressure deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_satpres_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    #  |> redirect(to: Routes.sats_pressure_path(conn, :index))
  end
end
