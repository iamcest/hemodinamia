defmodule Angio.Clinicals do
  @moduledoc """
  The Clinicals context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Clinicals.Cath_clinical

  @doc """
  Returns the list of cath_clinicals.

  ## Examples

      iex> list_cath_clinicals()
      [%Cath_clinical{}, ...]

  """
  def list_cath_clinicals(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_clinicals))
    # Repo.all(Cath_clinical)
  end

  @doc """
  Gets a single cath_clinical.

  Raises `Ecto.NoResultsError` if the Cath clinical does not exist.

  ## Examples

      iex> get_cath_clinical!(123)
      %Cath_clinical{}

      iex> get_cath_clinical!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_clinical!(id), do: Repo.get!(Cath_clinical, id)

  @doc """
  Creates a cath_clinical.

  ## Examples

      iex> create_cath_clinical(%{field: value})
      {:ok, %Cath_clinical{}}

      iex> create_cath_clinical(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_clinical(attrs \\ %{}) do
    %Cath_clinical{}
    |> Cath_clinical.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_clinical.

  ## Examples

      iex> update_cath_clinical(cath_clinical, %{field: new_value})
      {:ok, %Cath_clinical{}}

      iex> update_cath_clinical(cath_clinical, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_clinical(%Cath_clinical{} = cath_clinical, attrs) do
    cath_clinical
    |> Cath_clinical.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_clinical.

  ## Examples

      iex> delete_cath_clinical(cath_clinical)
      {:ok, %Cath_clinical{}}

      iex> delete_cath_clinical(cath_clinical)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_clinical(%Cath_clinical{} = cath_clinical) do
    Repo.delete(cath_clinical)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_clinical changes.

  ## Examples

      iex> change_cath_clinical(cath_clinical)
      %Ecto.Changeset{source: %Cath_clinical{}}

  """
  def change_cath_clinical(%Cath_clinical{} = cath_clinical) do
    Cath_clinical.changeset(cath_clinical, %{})
  end

  def count_clinicals(id) do
    Angio.Repo.one(
      from(
        clinical in Cath_clinical,
        select: count(clinical.id),
        where: clinical.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Clinicals.Chest_pains

  @doc """
  Returns the list of chest_pain.

  ## Examples

      iex> list_chest_pain()
      [%Chest_pains{}, ...]

  """
  def list_chest_pain(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :chest_pain))
    # Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_clinicals))
    # Repo.all(Chest_pains)
  end

  @doc """
  Gets a single chest_pains.

  Raises `Ecto.NoResultsError` if the Chest pains does not exist.

  ## Examples

      iex> get_chest_pains!(123)
      %Chest_pains{}

      iex> get_chest_pains!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chest_pains!(id), do: Repo.get!(Chest_pains, id)

  @doc """
  Creates a chest_pains.

  ## Examples

      iex> create_chest_pains(%{field: value})
      {:ok, %Chest_pains{}}

      iex> create_chest_pains(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chest_pains(attrs \\ %{}) do
    %Chest_pains{}
    |> Chest_pains.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chest_pains.

  ## Examples

      iex> update_chest_pains(chest_pains, %{field: new_value})
      {:ok, %Chest_pains{}}

      iex> update_chest_pains(chest_pains, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chest_pains(%Chest_pains{} = chest_pains, attrs) do
    chest_pains
    |> Chest_pains.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chest_pains.

  ## Examples

      iex> delete_chest_pains(chest_pains)
      {:ok, %Chest_pains{}}

      iex> delete_chest_pains(chest_pains)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chest_pains(%Chest_pains{} = chest_pains) do
    Repo.delete(chest_pains)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chest_pains changes.

  ## Examples

      iex> change_chest_pains(chest_pains)
      %Ecto.Changeset{source: %Chest_pains{}}

  """
  def change_chest_pains(%Chest_pains{} = chest_pains) do
    Chest_pains.changeset(chest_pains, %{})
  end

  def count_chest_pains(id) do
    Angio.Repo.one(
      from(
        pains in Chest_pains,
        select: count(pains.id),
        where: pains.info_coronary_id == ^id
      )
    )
  end
end
