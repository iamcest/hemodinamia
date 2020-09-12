defmodule Angio.Graphics do
  @moduledoc """
  The Graphics context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Graphics.Tree_natives

  @doc """
  Returns the list of tree_native.

  ## Examples

      iex> list_tree_native()
      [%Tree_natives{}, ...]

  """
  def list_tree_natives(params) do
 _page =
 Tree_natives
 |> Tree_natives.order_by_vessel_id()
 |> Repo.paginate(params)

  #Repo.all(Tree_natives)

  end

  @doc """
  Gets a single tree_natives.

  Raises `Ecto.NoResultsError` if the Tree natives does not exist.

  ## Examples

      iex> get_tree_natives!(123)
      %Tree_natives{}

      iex> get_tree_natives!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tree_natives!(id), do: Repo.get!(Tree_natives, id)

  @doc """
  Creates a tree_natives.

  ## Examples

      iex> create_tree_natives(%{field: value})
      {:ok, %Tree_natives{}}

      iex> create_tree_natives(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tree_natives(attrs \\ %{}) do
    %Tree_natives{}
    |> Tree_natives.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tree_natives.

  ## Examples

      iex> update_tree_natives(tree_natives, %{field: new_value})
      {:ok, %Tree_natives{}}

      iex> update_tree_natives(tree_natives, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tree_natives(%Tree_natives{} = tree_natives, attrs) do
    tree_natives
    |> Tree_natives.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tree_natives.

  ## Examples

      iex> delete_tree_natives(tree_natives)
      {:ok, %Tree_natives{}}

      iex> delete_tree_natives(tree_natives)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tree_natives(%Tree_natives{} = tree_natives) do
    Repo.delete(tree_natives)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tree_natives changes.

  ## Examples

      iex> change_tree_natives(tree_natives)
      %Ecto.Changeset{source: %Tree_natives{}}

  """
  def change_tree_natives(%Tree_natives{} = tree_natives) do
    Tree_natives.changeset(tree_natives, %{})
  end
end
