defmodule AngioWeb.Opts_codeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    code: "some code",
    code_system: "some code_system",
    definition_id: 42,
    defs_option_id: 42,
    description: "some description",
    notes: "some notes"
  }
  @update_attrs %{
    code: "some updated code",
    code_system: "some updated code_system",
    definition_id: 43,
    defs_option_id: 43,
    description: "some updated description",
    notes: "some updated notes"
  }
  @invalid_attrs %{
    code: nil,
    code_system: nil,
    definition_id: nil,
    defs_option_id: nil,
    description: nil,
    notes: nil
  }

  def fixture(:opts_code) do
    {:ok, opts_code} = Canons.create_opts_code(@create_attrs)
    opts_code
  end

  describe "index" do
    test "lists all opts_codes", %{conn: conn} do
      conn = get(conn, Routes.opts_code_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Opts codes"
    end
  end

  describe "new opts_code" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.opts_code_path(conn, :new))
      assert html_response(conn, 200) =~ "New Opts code"
    end
  end

  describe "create opts_code" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.opts_code_path(conn, :create), opts_code: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.opts_code_path(conn, :show, id)

      conn = get(conn, Routes.opts_code_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Opts code"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.opts_code_path(conn, :create), opts_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Opts code"
    end
  end

  describe "edit opts_code" do
    setup [:create_opts_code]

    test "renders form for editing chosen opts_code", %{conn: conn, opts_code: opts_code} do
      conn = get(conn, Routes.opts_code_path(conn, :edit, opts_code))
      assert html_response(conn, 200) =~ "Edit Opts code"
    end
  end

  describe "update opts_code" do
    setup [:create_opts_code]

    test "redirects when data is valid", %{conn: conn, opts_code: opts_code} do
      conn = put(conn, Routes.opts_code_path(conn, :update, opts_code), opts_code: @update_attrs)
      assert redirected_to(conn) == Routes.opts_code_path(conn, :show, opts_code)

      conn = get(conn, Routes.opts_code_path(conn, :show, opts_code))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, opts_code: opts_code} do
      conn = put(conn, Routes.opts_code_path(conn, :update, opts_code), opts_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Opts code"
    end
  end

  describe "delete opts_code" do
    setup [:create_opts_code]

    test "deletes chosen opts_code", %{conn: conn, opts_code: opts_code} do
      conn = delete(conn, Routes.opts_code_path(conn, :delete, opts_code))
      assert redirected_to(conn) == Routes.opts_code_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.opts_code_path(conn, :show, opts_code))
      end)
    end
  end

  defp create_opts_code(_) do
    opts_code = fixture(:opts_code)
    {:ok, opts_code: opts_code}
  end
end
