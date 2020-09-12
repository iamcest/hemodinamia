defmodule AngioWeb.Defs_optionControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    code: "some code",
    definition_id: 42,
    name: "some name",
    selection_definition: "some selection_definition",
    selection_notes: "some selection_notes",
    selection_text: "some selection_text"
  }
  @update_attrs %{
    code: "some updated code",
    definition_id: 43,
    name: "some updated name",
    selection_definition: "some updated selection_definition",
    selection_notes: "some updated selection_notes",
    selection_text: "some updated selection_text"
  }
  @invalid_attrs %{
    code: nil,
    definition_id: nil,
    name: nil,
    selection_definition: nil,
    selection_notes: nil,
    selection_text: nil
  }

  def fixture(:defs_option) do
    {:ok, defs_option} = Canons.create_defs_option(@create_attrs)
    defs_option
  end

  describe "index" do
    test "lists all defs_options", %{conn: conn} do
      conn = get(conn, Routes.defs_option_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Defs options"
    end
  end

  describe "new defs_option" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.defs_option_path(conn, :new))
      assert html_response(conn, 200) =~ "New Defs option"
    end
  end

  describe "create defs_option" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.defs_option_path(conn, :create), defs_option: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.defs_option_path(conn, :show, id)

      conn = get(conn, Routes.defs_option_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Defs option"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.defs_option_path(conn, :create), defs_option: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Defs option"
    end
  end

  describe "edit defs_option" do
    setup [:create_defs_option]

    test "renders form for editing chosen defs_option", %{conn: conn, defs_option: defs_option} do
      conn = get(conn, Routes.defs_option_path(conn, :edit, defs_option))
      assert html_response(conn, 200) =~ "Edit Defs option"
    end
  end

  describe "update defs_option" do
    setup [:create_defs_option]

    test "redirects when data is valid", %{conn: conn, defs_option: defs_option} do
      conn =
        put(conn, Routes.defs_option_path(conn, :update, defs_option), defs_option: @update_attrs)

      assert redirected_to(conn) == Routes.defs_option_path(conn, :show, defs_option)

      conn = get(conn, Routes.defs_option_path(conn, :show, defs_option))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, defs_option: defs_option} do
      conn =
        put(conn, Routes.defs_option_path(conn, :update, defs_option), defs_option: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Defs option"
    end
  end

  describe "delete defs_option" do
    setup [:create_defs_option]

    test "deletes chosen defs_option", %{conn: conn, defs_option: defs_option} do
      conn = delete(conn, Routes.defs_option_path(conn, :delete, defs_option))
      assert redirected_to(conn) == Routes.defs_option_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.defs_option_path(conn, :show, defs_option))
      end)
    end
  end

  defp create_defs_option(_) do
    defs_option = fixture(:defs_option)
    {:ok, defs_option: defs_option}
  end
end
