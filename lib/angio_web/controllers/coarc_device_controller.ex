defmodule AngioWeb.Coarc_deviceController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Coarc_device
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:assign_coarc_procedure)

  plug(:scrub_params, "coarc_device" when action in [:create, :update])

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    coarc_devices = Interventions.list_coarc_devices(conn)
    render(conn, "index.html", coarc_devices: coarc_devices)
  end

  def new(conn, _params) do
    changeset = Interventions.change_coarc_device(%Coarc_device{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"coarc_device" => coarc_device_params}) do
    ###################
    changeset =
      conn.assigns[:coarc_procedure]
      |> Ecto.build_assoc(:coarc_devices)
      |> Coarc_device.changeset(coarc_device_params)

    case Repo.insert(changeset) do
      {:ok, _coarc_device} ->
        conn
        |> put_flash(:info, "Coarc Device created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_coarc_device_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary],
              conn.assigns[:coarc_procedure]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ##
  end

  def show(conn, %{"id" => id}) do
    coarc_device = Interventions.get_coarc_device!(id)
    render(conn, "show.html", coarc_device: coarc_device)
  end

  def edit(conn, %{"id" => id}) do
    coarc_device = Interventions.get_coarc_device!(id)
    changeset = Interventions.change_coarc_device(coarc_device)
    render(conn, "edit.html", coarc_device: coarc_device, changeset: changeset)
  end

  def update(conn, %{"id" => id, "coarc_device" => coarc_device_params}) do
    coarc_device = Interventions.get_coarc_device!(id)

    case Interventions.update_coarc_device(coarc_device, coarc_device_params) do
      {:ok, _coarc_device} ->
        conn
        |> put_flash(:info, "Coarc device updated successfully.")
        # |> redirect(to: Routes.coarc_device_path(conn, :show, coarc_device))
        |> redirect(
          to:
            Routes.pt_angio_coarc_device_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary],
              conn.assigns[:coarc_procedure]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", coarc_device: coarc_device, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    coarc_device = Interventions.get_coarc_device!(id)
    {:ok, _coarc_device} = Interventions.delete_coarc_device(coarc_device)

    conn
    |> put_flash(:info, "Coarc device deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_coarc_device_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary],
          conn.assigns[:coarc_procedure]
        )
    )

    # |> redirect(to: Routes.coarc_device_path(conn, :index))
  end
end
