defmodule AngioWeb.ElectrocardiogramController do
  use AngioWeb, :controller

  alias Angio.Diagnostics
  alias Angio.Diagnostics.Electrocardiogram
  alias Angio.Repo

  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:scrub_params, "electrocardiogram" when action in [:create, :update])

  def index(conn, _params) do
    electrocardiograms = Diagnostics.list_electrocardiograms(conn)
    render(conn, "index.html", electrocardiograms: electrocardiograms)
  end

  def new(conn, _params) do
    changeset = Diagnostics.change_electrocardiogram(%Electrocardiogram{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"electrocardiogram" => electrocardiogram_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:electrocardiograms)
      |> Electrocardiogram.changeset(electrocardiogram_params)

    case Repo.insert(changeset) do
      {:ok, _ecg} ->
        conn
        |> put_flash(:info, " Record For ECG created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_ecg_path(
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
  end

  def show(conn, %{"id" => id}) do
    electrocardiogram = Diagnostics.get_electrocardiogram!(id)
    render(conn, "show.html", electrocardiogram: electrocardiogram)
  end

  def edit(conn, %{"id" => id}) do
    electrocardiogram = Diagnostics.get_electrocardiogram!(id)
    changeset = Diagnostics.change_electrocardiogram(electrocardiogram)
    render(conn, "edit.html", electrocardiogram: electrocardiogram, changeset: changeset)
  end

  def update(conn, %{"id" => id, "electrocardiogram" => electrocardiogram_params}) do
    electrocardiogram = Diagnostics.get_electrocardiogram!(id)

    case Diagnostics.update_electrocardiogram(electrocardiogram, electrocardiogram_params) do
      {:ok, electrocardiogram} ->
        conn
        |> put_flash(:info, "Electrocardiogram updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_ecg_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.electrocardiogram_path(conn, :show, electrocardiogram))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", electrocardiogram: electrocardiogram, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    electrocardiogram = Diagnostics.get_electrocardiogram!(id)
    {:ok, _electrocardiogram} = Diagnostics.delete_electrocardiogram(electrocardiogram)

    conn
    |> put_flash(:info, "Electrocardiogram deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_ecg_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.electrocardiogram_path(conn, :index))
  end
end
