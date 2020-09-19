defmodule AngioWeb.Pci_procedureController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Pci_procedure
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  plug(:scrub_params, "pci_procedure" when action in [:create, :update])

  def index(conn, _params) do
    pci_procedures = Interventions.list_pci_procedures(conn)
    render(conn, "index.html", pci_procedures: pci_procedures)
  end

  def new(conn, _params) do
    changeset = Interventions.change_pci_procedure(%Pci_procedure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pci_procedure" => pci_procedure_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:pci_procedures)
      |> Pci_procedure.changeset(pci_procedure_params)

    case Repo.insert(changeset) do
      {:ok, _asd_closure} ->
        conn
        |> put_flash(:info, "ASD PCI Procedure Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_pci_proc_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ##############################
    end
  end

  def show(conn, %{"id" => id}) do
    pci_procedure = Interventions.get_pci_procedure!(id)
    render(conn, "show.html", pci_procedure: pci_procedure)
  end

  def edit(conn, %{"id" => id}) do
    pci_procedure = Interventions.get_pci_procedure!(id)
    changeset = Interventions.change_pci_procedure(pci_procedure)
    render(conn, "edit.html", pci_procedure: pci_procedure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pci_procedure" => pci_procedure_params}) do
    pci_procedure = Interventions.get_pci_procedure!(id)

    case Interventions.update_pci_procedure(pci_procedure, pci_procedure_params) do
      {:ok, _pci_procedure} ->
        conn
        |> put_flash(:info, "Pci procedure updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_pci_proc_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.pci_procedure_path(conn, :show, pci_procedure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pci_procedure: pci_procedure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pci_procedure = Interventions.get_pci_procedure!(id)
    {:ok, _pci_procedure} = Interventions.delete_pci_procedure(pci_procedure)

    conn
    |> put_flash(:info, "Pci procedure deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_pci_proc_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.pci_procedure_path(conn, :index))
  end
end
