defmodule AngioWeb.Info_coronaryController do
  use AngioWeb, :controller
  # import PhoenixGon.Controller

  alias Angio.Caths
  alias Angio.Caths.Info_coronary
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)

  def index(conn, _params) do
    # conn = put_gon(conn, controller: put_gon)

    info_coronaries = Angio.Repo.all(Ecto.assoc(conn.assigns[:patient], :info_coronaries))
    render(conn, "index.html", info_coronaries: info_coronaries)
  end

  def new(conn, _params) do
    changeset = Caths.change_info_coronary(%Info_coronary{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"info_coronary" => info_coronary_params, "patient_id" => patient_id}) do
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:info_coronaries)
      |> Angio.Caths.Info_coronary.changeset(info_coronary_params)

    case Repo.insert(changeset) do
      {:ok, _info_coronary} ->
        conn
        |> put_flash(:info, "Info coronary created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create_1(conn, %{"info_coronary" => info_coronary_params}) do
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:info_coronaries)
      |> Info_coronary.changeset(info_coronary_params)

    case Angio.Repo.insert(changeset) do
      {:ok, _info_coronary} ->
        conn
        |> put_flash(:info, "General Information For Angio created successfully.")
        |> redirect(to: Routes.pt_angio_path(conn, :index, conn.assigns[:patient]))

      {:error, changeset} ->
        conn
        |> put_flash(:alert, "Unable to create General Info For Angio")

        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    info_coronary = Caths.get_info_coronary!(id)
    render(conn, "show.html", info_coronary: info_coronary)
  end

  def edit(conn, %{"id" => id}) do
    info_coronary =
      Repo.get!(
        Ecto.assoc(
          conn.assigns[:patient],
          :info_coronaries
        ),
        id
      )

    changeset = Caths.change_info_coronary(info_coronary)
    render(conn, "edit.html", info_coronary: info_coronary, changeset: changeset)
  end

  def update(conn, %{"id" => id, "info_coronary" => info_coronary_params}) do
    info_coronary = Caths.get_info_coronary!(id)

    case Caths.update_info_coronary(info_coronary, info_coronary_params) do
      {:ok, _info_coronary} ->
        conn
        |> put_flash(:info, "Info coronary updated successfully.")
        # |> redirect(to: Routes.pt_angio_path(conn, :show, conn.assigns[:patient], id))
        |> redirect(to: Routes.pt_angio_path(conn, :index, conn.assigns[:patient]))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", info_coronary: info_coronary, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    info_coronary = Caths.get_info_coronary!(id)
    {:ok, _info_coronary} = Caths.delete_info_coronary(info_coronary)

    conn
    |> put_flash(:info, "Record For Info coronary deleted successfully")
    # |> redirect(to: Routes.pt_angio_path(conn, :index))
    |> redirect(to: Routes.pt_angio_path(conn, :index, conn.assigns[:patient]))
  end

  ###############

  defp assign_patient_old(conn, _opts) do
    case conn.params do
      %{"patient_id" => patient_id} ->
        case Angio.Repo.get(Angio.Persons.Patient, patient_id) do
          patient ->
            assign(conn, :patient, patient)
        end

      _ ->
        conn
    end
  end

  ##############
end
