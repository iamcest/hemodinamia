defmodule AngioWeb.Pci_fupController do
  use AngioWeb, :controller

  alias Angio.Followups
  alias Angio.Followups.Pci_fup
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)

  plug(:scrub_params, "pci_fup" when action in [:create, :update])

  def index(conn, _params) do
    pci_fups = Followups.list_pci_fups(conn)
    render(conn, "index.html", pci_fups: pci_fups)
  end

  def new(conn, _params) do
    changeset = Followups.change_pci_fup(%Pci_fup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pci_fup" => pci_fup_params}) do
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:pci_fups)
      |> Pci_fup.changeset(pci_fup_params)

    case Repo.insert(changeset) do
      {:ok, _asd_closures_fup} ->
        conn
        |> put_flash(:info, "PCI Follow Up Record created successfully.")
        |> redirect(
          to:
            Routes.pt_pcif_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ######################## 3
  end

  def show(conn, %{"id" => id}) do
    pci_fup = Followups.get_pci_fup!(id)
    render(conn, "show.html", pci_fup: pci_fup)
  end

  def edit(conn, %{"id" => id}) do
    pci_fup = Followups.get_pci_fup!(id)
    changeset = Followups.change_pci_fup(pci_fup)
    render(conn, "edit.html", pci_fup: pci_fup, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pci_fup" => pci_fup_params}) do
    pci_fup = Followups.get_pci_fup!(id)

    case Followups.update_pci_fup(pci_fup, pci_fup_params) do
      {:ok, _pci_fup} ->
        conn
        |> put_flash(:info, "Pci fup updated successfully.")
        |> redirect(
          to:
            Routes.pt_pcif_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pci_fup: pci_fup, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pci_fup = Followups.get_pci_fup!(id)
    {:ok, _pci_fup} = Followups.delete_pci_fup(pci_fup)

    conn
    |> put_flash(:info, "Pci fup deleted successfully.")
    |> redirect(
      to:
        Routes.pt_pcif_path(
          conn,
          :index,
          conn.assigns[:patient]
        )
    )
  end
end
