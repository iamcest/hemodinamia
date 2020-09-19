defmodule AngioWeb.Tree_nativesController do
  use AngioWeb, :controller

  alias Angio.Graphics
  alias Angio.Graphics.Tree_natives
  # alias Angio.Repo
  import Ecto.Query
  plug(:scrub_params, "tree_natives" when action in [:create, :update])

  @spec index(Plug.Conn.t(), keyword | map) :: Plug.Conn.t()
  def index(conn, _params) do
    page = Graphics.list_tree_natives(_params)
    render(conn, "index.html", tree_native: page.entries, page: page)

    # tree_native = Graphics.list_tree_native()
    # render(conn, "index.html", tree_native: tree_native)
  end

  def new(conn, _params) do
    changeset = Graphics.change_tree_natives(%Tree_natives{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"tree_natives" => tree_natives_params}) do
    case Graphics.create_tree_natives(tree_natives_params) do
      {:ok, tree_natives} ->
        conn
        |> put_flash(:info, "Data For Coronary Tree  created successfully.")
        |> redirect(to: Routes.tree_natives_path(conn, :show, tree_natives))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tree_natives = Graphics.get_tree_natives!(id)
    render(conn, "show.html", tree_natives: tree_natives)
  end

  def edit(conn, %{"id" => id}) do
    tree_natives = Graphics.get_tree_natives!(id)
    changeset = Graphics.change_tree_natives(tree_natives)
    render(conn, "edit.html", tree_natives: tree_natives, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tree_natives" => tree_natives_params}) do
    tree_natives = Graphics.get_tree_natives!(id)

    case Graphics.update_tree_natives(tree_natives, tree_natives_params) do
      {:ok, tree_natives} ->
        conn
        |> put_flash(:info, "Tree natives updated successfully.")
        |> redirect(to: Routes.tree_natives_path(conn, :show, tree_natives))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tree_natives: tree_natives, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tree_natives = Graphics.get_tree_natives!(id)
    {:ok, _tree_natives} = Graphics.delete_tree_natives(tree_natives)

    conn
    |> put_flash(:info, "Tree natives deleted successfully.")
    |> redirect(to: Routes.tree_natives_path(conn, :index))
  end
end
