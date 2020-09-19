defmodule AngioWeb.Cor_treeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:cor_tree) do
    {:ok, cor_tree} = Caths.create_cor_tree(@create_attrs)
    cor_tree
  end

  describe "index" do
    test "lists all cor_trees", %{conn: conn} do
      conn = get(conn, Routes.cor_tree_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cor trees"
    end
  end

  describe "new cor_tree" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cor_tree_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cor tree"
    end
  end

  describe "create cor_tree" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cor_tree_path(conn, :create), cor_tree: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cor_tree_path(conn, :show, id)

      conn = get(conn, Routes.cor_tree_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cor tree"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cor_tree_path(conn, :create), cor_tree: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cor tree"
    end
  end

  describe "edit cor_tree" do
    setup [:create_cor_tree]

    test "renders form for editing chosen cor_tree", %{conn: conn, cor_tree: cor_tree} do
      conn = get(conn, Routes.cor_tree_path(conn, :edit, cor_tree))
      assert html_response(conn, 200) =~ "Edit Cor tree"
    end
  end

  describe "update cor_tree" do
    setup [:create_cor_tree]

    test "redirects when data is valid", %{conn: conn, cor_tree: cor_tree} do
      conn = put(conn, Routes.cor_tree_path(conn, :update, cor_tree), cor_tree: @update_attrs)
      assert redirected_to(conn) == Routes.cor_tree_path(conn, :show, cor_tree)

      conn = get(conn, Routes.cor_tree_path(conn, :show, cor_tree))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cor_tree: cor_tree} do
      conn = put(conn, Routes.cor_tree_path(conn, :update, cor_tree), cor_tree: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cor tree"
    end
  end

  describe "delete cor_tree" do
    setup [:create_cor_tree]

    test "deletes chosen cor_tree", %{conn: conn, cor_tree: cor_tree} do
      conn = delete(conn, Routes.cor_tree_path(conn, :delete, cor_tree))
      assert redirected_to(conn) == Routes.cor_tree_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cor_tree_path(conn, :show, cor_tree))
      end)
    end
  end

  defp create_cor_tree(_) do
    cor_tree = fixture(:cor_tree)
    {:ok, cor_tree: cor_tree}
  end
end
