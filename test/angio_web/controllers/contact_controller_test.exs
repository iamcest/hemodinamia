defmodule AngioWeb.ContactControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Persons

  @create_attrs %{pacntcts_address: "some pacntcts_address", pacntcts_fname: "some pacntcts_fname", pacntcts_lname: "some pacntcts_lname", pacntcts_mname: "some pacntcts_mname", pacntcts_notes: "some pacntcts_notes", pacntcts_organization: "some pacntcts_organization", pacntcts_period: "some pacntcts_period", pacntcts_period_end: ~D[2010-04-17], pacntcts_period_start: ~D[2010-04-17], pacntcts_relationship: "some pacntcts_relationship", pacntcts_ssn: "some pacntcts_ssn", pacntcts_telecom: "some pacntcts_telecom"}
  @update_attrs %{pacntcts_address: "some updated pacntcts_address", pacntcts_fname: "some updated pacntcts_fname", pacntcts_lname: "some updated pacntcts_lname", pacntcts_mname: "some updated pacntcts_mname", pacntcts_notes: "some updated pacntcts_notes", pacntcts_organization: "some updated pacntcts_organization", pacntcts_period: "some updated pacntcts_period", pacntcts_period_end: ~D[2011-05-18], pacntcts_period_start: ~D[2011-05-18], pacntcts_relationship: "some updated pacntcts_relationship", pacntcts_ssn: "some updated pacntcts_ssn", pacntcts_telecom: "some updated pacntcts_telecom"}
  @invalid_attrs %{pacntcts_address: nil, pacntcts_fname: nil, pacntcts_lname: nil, pacntcts_mname: nil, pacntcts_notes: nil, pacntcts_organization: nil, pacntcts_period: nil, pacntcts_period_end: nil, pacntcts_period_start: nil, pacntcts_relationship: nil, pacntcts_ssn: nil, pacntcts_telecom: nil}

  def fixture(:contact) do
    {:ok, contact} = Persons.create_contact(@create_attrs)
    contact
  end

  describe "index" do
    test "lists all contacts", %{conn: conn} do
      conn = get(conn, Routes.contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contacts"
    end
  end

  describe "new contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Contact"
    end
  end

  describe "create contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.contact_path(conn, :show, id)

      conn = get(conn, Routes.contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Contact"
    end
  end

  describe "edit contact" do
    setup [:create_contact]

    test "renders form for editing chosen contact", %{conn: conn, contact: contact} do
      conn = get(conn, Routes.contact_path(conn, :edit, contact))
      assert html_response(conn, 200) =~ "Edit Contact"
    end
  end

  describe "update contact" do
    setup [:create_contact]

    test "redirects when data is valid", %{conn: conn, contact: contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @update_attrs)
      assert redirected_to(conn) == Routes.contact_path(conn, :show, contact)

      conn = get(conn, Routes.contact_path(conn, :show, contact))
      assert html_response(conn, 200) =~ "some updated pacntcts_address"
    end

    test "renders errors when data is invalid", %{conn: conn, contact: contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Contact"
    end
  end

  describe "delete contact" do
    setup [:create_contact]

    test "deletes chosen contact", %{conn: conn, contact: contact} do
      conn = delete(conn, Routes.contact_path(conn, :delete, contact))
      assert redirected_to(conn) == Routes.contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.contact_path(conn, :show, contact))
      end
    end
  end

  defp create_contact(_) do
    contact = fixture(:contact)
    {:ok, contact: contact}
  end
end
