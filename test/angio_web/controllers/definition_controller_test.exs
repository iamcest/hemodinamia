defmodule AngioWeb.DefinitionControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    coding_instructions: "some coding_instructions",
    data_source: "some data_source",
    default_value: "some default_value",
    definition_id: 42,
    defs_table_id: 42,
    name: "some name",
    notes: "some notes",
    ref: "some ref",
    short_name: "some short_name",
    support_definition: "some support_definition",
    table_name: "some table_name",
    target_value: "some target_value",
    title_name: "some title_name",
    usual_range: "some usual_range",
    valid_range: "some valid_range",
    vocabulary_en: "some vocabulary_en"
  }
  @update_attrs %{
    coding_instructions: "some updated coding_instructions",
    data_source: "some updated data_source",
    default_value: "some updated default_value",
    definition_id: 43,
    defs_table_id: 43,
    name: "some updated name",
    notes: "some updated notes",
    ref: "some updated ref",
    short_name: "some updated short_name",
    support_definition: "some updated support_definition",
    table_name: "some updated table_name",
    target_value: "some updated target_value",
    title_name: "some updated title_name",
    usual_range: "some updated usual_range",
    valid_range: "some updated valid_range",
    vocabulary_en: "some updated vocabulary_en"
  }
  @invalid_attrs %{
    coding_instructions: nil,
    data_source: nil,
    default_value: nil,
    definition_id: nil,
    defs_table_id: nil,
    name: nil,
    notes: nil,
    ref: nil,
    short_name: nil,
    support_definition: nil,
    table_name: nil,
    target_value: nil,
    title_name: nil,
    usual_range: nil,
    valid_range: nil,
    vocabulary_en: nil
  }

  def fixture(:definition) do
    {:ok, definition} = Canons.create_definition(@create_attrs)
    definition
  end

  describe "index" do
    test "lists all definitions", %{conn: conn} do
      conn = get(conn, Routes.definition_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Definitions"
    end
  end

  describe "new definition" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.definition_path(conn, :new))
      assert html_response(conn, 200) =~ "New Definition"
    end
  end

  describe "create definition" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.definition_path(conn, :create), definition: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.definition_path(conn, :show, id)

      conn = get(conn, Routes.definition_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Definition"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.definition_path(conn, :create), definition: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Definition"
    end
  end

  describe "edit definition" do
    setup [:create_definition]

    test "renders form for editing chosen definition", %{conn: conn, definition: definition} do
      conn = get(conn, Routes.definition_path(conn, :edit, definition))
      assert html_response(conn, 200) =~ "Edit Definition"
    end
  end

  describe "update definition" do
    setup [:create_definition]

    test "redirects when data is valid", %{conn: conn, definition: definition} do
      conn =
        put(conn, Routes.definition_path(conn, :update, definition), definition: @update_attrs)

      assert redirected_to(conn) == Routes.definition_path(conn, :show, definition)

      conn = get(conn, Routes.definition_path(conn, :show, definition))
      assert html_response(conn, 200) =~ "some updated coding_instructions"
    end

    test "renders errors when data is invalid", %{conn: conn, definition: definition} do
      conn =
        put(conn, Routes.definition_path(conn, :update, definition), definition: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Definition"
    end
  end

  describe "delete definition" do
    setup [:create_definition]

    test "deletes chosen definition", %{conn: conn, definition: definition} do
      conn = delete(conn, Routes.definition_path(conn, :delete, definition))
      assert redirected_to(conn) == Routes.definition_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.definition_path(conn, :show, definition))
      end)
    end
  end

  defp create_definition(_) do
    definition = fixture(:definition)
    {:ok, definition: definition}
  end
end
