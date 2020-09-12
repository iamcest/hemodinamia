defmodule AngioWeb.Defs_codeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    code: "some code",
    code_system: "some code_system",
    definition_id: 42,
    description: "some description",
    note: "some note"
  }
  @update_attrs %{
    code: "some updated code",
    code_system: "some updated code_system",
    definition_id: 43,
    description: "some updated description",
    note: "some updated note"
  }
  @invalid_attrs %{code: nil, code_system: nil, definition_id: nil, description: nil, note: nil}

  def fixture(:defs_code) do
    {:ok, defs_code} = Canons.create_defs_code(@create_attrs)
    defs_code
  end

  describe "index" do
    test "lists all defs_codes", %{conn: conn} do
      conn = get(conn, Routes.defs_code_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Defs codes"
    end
  end

  describe "new defs_code" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.defs_code_path(conn, :new))
      assert html_response(conn, 200) =~ "New Defs code"
    end
  end

  describe "create defs_code" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.defs_code_path(conn, :create), defs_code: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.defs_code_path(conn, :show, id)

      conn = get(conn, Routes.defs_code_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Defs code"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.defs_code_path(conn, :create), defs_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Defs code"
    end
  end

  describe "edit defs_code" do
    setup [:create_defs_code]

    test "renders form for editing chosen defs_code", %{conn: conn, defs_code: defs_code} do
      conn = get(conn, Routes.defs_code_path(conn, :edit, defs_code))
      assert html_response(conn, 200) =~ "Edit Defs code"
    end
  end

  describe "update defs_code" do
    setup [:create_defs_code]

    test "redirects when data is valid", %{conn: conn, defs_code: defs_code} do
      conn = put(conn, Routes.defs_code_path(conn, :update, defs_code), defs_code: @update_attrs)
      assert redirected_to(conn) == Routes.defs_code_path(conn, :show, defs_code)

      conn = get(conn, Routes.defs_code_path(conn, :show, defs_code))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, defs_code: defs_code} do
      conn = put(conn, Routes.defs_code_path(conn, :update, defs_code), defs_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Defs code"
    end
  end

  describe "delete defs_code" do
    setup [:create_defs_code]

    test "deletes chosen defs_code", %{conn: conn, defs_code: defs_code} do
      conn = delete(conn, Routes.defs_code_path(conn, :delete, defs_code))
      assert redirected_to(conn) == Routes.defs_code_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.defs_code_path(conn, :show, defs_code))
      end)
    end
  end

  defp create_defs_code(_) do
    defs_code = fixture(:defs_code)
    {:ok, defs_code: defs_code}
  end
end
