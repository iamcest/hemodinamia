defmodule AngioWeb.Pci_lesionController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Pci_lesion
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:assign_pci_procedure)
  plug(:scrub_params, "pci_lesion" when action in [:create, :update])
  def index(conn, _params) do
    pci_lesions = Interventions.list_pci_lesions(conn)
    render(conn, "index.html", pci_lesions: pci_lesions)
  end

  def new(conn, _params) do
    changeset = Interventions.change_pci_lesion(%Pci_lesion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pci_lesion" => pci_lesion_params}) do
    changeset =
    conn.assigns[:pci_procedure ]
    |> Ecto.build_assoc(:pci_lesions)
    |> Pci_lesion.changeset(pci_lesion_params)

  case Repo.insert(changeset) do
    {:ok, _pci_lesion} ->
      conn
      |> put_flash(:info, "AV Inflations Record created successfully.")
      |> redirect(
        to:
          Routes.pt_angio_pci_proc_lesion_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:info_coronary],
            conn.assigns[:pci_procedure]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)

    end
    ###################3

  end

  def show(conn, %{"id" => id}) do
    pci_lesion = Interventions.get_pci_lesion!(id)
    render(conn, "show.html", pci_lesion: pci_lesion)
  end

  def edit(conn, %{"id" => id}) do
    pci_lesion = Interventions.get_pci_lesion!(id)
    changeset = Interventions.change_pci_lesion(pci_lesion)
    render(conn, "edit.html", pci_lesion: pci_lesion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pci_lesion" => pci_lesion_params}) do
    pci_lesion = Interventions.get_pci_lesion!(id)

    case Interventions.update_pci_lesion(pci_lesion, pci_lesion_params) do
      {:ok, pci_lesion} ->
        conn
        |> put_flash(:info, "Pci lesion updated successfully.")
        #|> redirect(to: Routes.pci_lesion_path(conn, :show, pci_lesion))
        |> redirect(
          to:
            Routes.pt_angio_pci_proc_lesion_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary],
              conn.assigns[:pci_procedure]
            )
        )
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pci_lesion: pci_lesion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pci_lesion = Interventions.get_pci_lesion!(id)
    {:ok, _pci_lesion} = Interventions.delete_pci_lesion(pci_lesion)

    conn
    |> put_flash(:info, "Pci lesion deleted successfully.")
    |> redirect(
        to:
          Routes.pt_angio_pci_proc_lesion_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:info_coronary],
            conn.assigns[:pci_procedure]
          )
      )
    #|> redirect(to: Routes.pci_lesion_path(conn, :index))
  end
end
