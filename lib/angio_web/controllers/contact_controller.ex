defmodule AngioWeb.ContactController do
  use AngioWeb, :controller

  alias Angio.Persons
  alias Angio.Persons.Contact
  alias Angio.Repo
  import AngioPlug
  plug(:assign_patient)
  plug(:scrub_params, "contact" when action in [:create, :update])

  def index(conn, _params) do
    contacts = Persons.list_contacts(conn)
    render(conn, "index.html", contacts: contacts)
  end

  def new(conn, _params) do
    changeset = Persons.change_contact(%Contact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"contact" => contact_params}) do
    ######################
    changeset =
      conn.assigns[:patient]
      |> Ecto.build_assoc(:contacts)
      |> Contact.changeset(contact_params)

    case Repo.insert(changeset) do
      {:ok, _contact} ->
        conn
        |> put_flash(:info, "Contacts Record created successfully.")
        |> redirect(
          to:
            Routes.pt_contacts_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #############################

  def show(conn, %{"id" => id}) do
    contact = Persons.get_contact!(id)
    render(conn, "show.html", contact: contact)
  end

  def edit(conn, %{"id" => id}) do
    contact = Persons.get_contact!(id)
    changeset = Persons.change_contact(contact)
    render(conn, "edit.html", contact: contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Persons.get_contact!(id)

    case Persons.update_contact(contact, contact_params) do
      {:ok, _contact} ->
        conn
        |> put_flash(:info, "Contact updated successfully.")
        |> redirect(
          to:
            Routes.pt_contacts_path(
              conn,
              :index,
              conn.assigns[:patient]
            )
        )

      # |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", contact: contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Persons.get_contact!(id)
    {:ok, _contact} = Persons.delete_contact(contact)

    conn
    |> put_flash(:info, "Contact deleted successfully.")
    |> redirect(
      to:
        Routes.pt_contacts_path(
          conn,
          :index,
          conn.assigns[:patient]
        )
    )

    # |> redirect(to: Routes.contact_path(conn, :index))
  end
end
