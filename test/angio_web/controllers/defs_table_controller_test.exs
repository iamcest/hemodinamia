defmodule AngioWeb.Defs_tableControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    cda_xml: "some cda_xml",
    code: "some code",
    code_system: "some code_system",
    code_system_name: "some code_system_name",
    definition_id: 42,
    defs_table_id: 42,
    display_name: "some display_name",
    name: "some name",
    note: "some note",
    table_id: "some table_id",
    template_id: "some template_id"
  }
  @update_attrs %{
    cda_xml: "some updated cda_xml",
    code: "some updated code",
    code_system: "some updated code_system",
    code_system_name: "some updated code_system_name",
    definition_id: 43,
    defs_table_id: 43,
    display_name: "some updated display_name",
    name: "some updated name",
    note: "some updated note",
    table_id: "some updated table_id",
    template_id: "some updated template_id"
  }
  @invalid_attrs %{
    cda_xml: nil,
    code: nil,
    code_system: nil,
    code_system_name: nil,
    definition_id: nil,
    defs_table_id: nil,
    display_name: nil,
    name: nil,
    note: nil,
    table_id: nil,
    template_id: nil
  }

  def fixture(:defs_table) do
    {:ok, defs_table} = Canons.create_defs_table(@create_attrs)
    defs_table
  end

  describe "index" do
    test "lists all defs_tables", %{conn: conn} do
      conn = get(conn, Routes.defs_table_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Defs tables"
    end
  end

  describe "new defs_table" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.defs_table_path(conn, :new))
      assert html_response(conn, 200) =~ "New Defs table"
    end
  end

  describe "create defs_table" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.defs_table_path(conn, :create), defs_table: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.defs_table_path(conn, :show, id)

      conn = get(conn, Routes.defs_table_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Defs table"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.defs_table_path(conn, :create), defs_table: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Defs table"
    end
  end

  describe "edit defs_table" do
    setup [:create_defs_table]

    test "renders form for editing chosen defs_table", %{conn: conn, defs_table: defs_table} do
      conn = get(conn, Routes.defs_table_path(conn, :edit, defs_table))
      assert html_response(conn, 200) =~ "Edit Defs table"
    end
  end

  describe "update defs_table" do
    setup [:create_defs_table]

    test "redirects when data is valid", %{conn: conn, defs_table: defs_table} do
      conn =
        put(conn, Routes.defs_table_path(conn, :update, defs_table), defs_table: @update_attrs)

      assert redirected_to(conn) == Routes.defs_table_path(conn, :show, defs_table)

      conn = get(conn, Routes.defs_table_path(conn, :show, defs_table))
      assert html_response(conn, 200) =~ "some updated cda_xml"
    end

    test "renders errors when data is invalid", %{conn: conn, defs_table: defs_table} do
      conn =
        put(conn, Routes.defs_table_path(conn, :update, defs_table), defs_table: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Defs table"
    end
  end

  describe "delete defs_table" do
    setup [:create_defs_table]

    test "deletes chosen defs_table", %{conn: conn, defs_table: defs_table} do
      conn = delete(conn, Routes.defs_table_path(conn, :delete, defs_table))
      assert redirected_to(conn) == Routes.defs_table_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.defs_table_path(conn, :show, defs_table))
      end)
    end
  end

  defp create_defs_table(_) do
    defs_table = fixture(:defs_table)
    {:ok, defs_table: defs_table}
  end
end
