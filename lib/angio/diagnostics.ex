defmodule Angio.Diagnostics do
  @moduledoc """
  The Diagnostics context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Diagnostics.Electrocardiogram

  @doc """
  Returns the list of electrocardiograms.

  ## Examples

      iex> list_electrocardiograms()
      [%Electrocardiogram{}, ...]

  """
  def list_electrocardiograms do
    Repo.all(Electrocardiogram)
  end

  @doc """
  Gets a single electrocardiogram.

  Raises `Ecto.NoResultsError` if the Electrocardiogram does not exist.

  ## Examples

      iex> get_electrocardiogram!(123)
      %Electrocardiogram{}

      iex> get_electrocardiogram!(456)
      ** (Ecto.NoResultsError)

  """
  def get_electrocardiogram!(id), do: Repo.get!(Electrocardiogram, id)

  @doc """
  Creates a electrocardiogram.

  ## Examples

      iex> create_electrocardiogram(%{field: value})
      {:ok, %Electrocardiogram{}}

      iex> create_electrocardiogram(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_electrocardiogram(attrs \\ %{}) do
    %Electrocardiogram{}
    |> Electrocardiogram.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a electrocardiogram.

  ## Examples

      iex> update_electrocardiogram(electrocardiogram, %{field: new_value})
      {:ok, %Electrocardiogram{}}

      iex> update_electrocardiogram(electrocardiogram, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_electrocardiogram(%Electrocardiogram{} = electrocardiogram, attrs) do
    electrocardiogram
    |> Electrocardiogram.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Electrocardiogram.

  ## Examples

      iex> delete_electrocardiogram(electrocardiogram)
      {:ok, %Electrocardiogram{}}

      iex> delete_electrocardiogram(electrocardiogram)
      {:error, %Ecto.Changeset{}}

  """
  def delete_electrocardiogram(%Electrocardiogram{} = electrocardiogram) do
    Repo.delete(electrocardiogram)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking electrocardiogram changes.

  ## Examples

      iex> change_electrocardiogram(electrocardiogram)
      %Ecto.Changeset{source: %Electrocardiogram{}}

  """
  def change_electrocardiogram(%Electrocardiogram{} = electrocardiogram) do
    Electrocardiogram.changeset(electrocardiogram, %{})
  end

  def list_electrocardiograms(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :electrocardiograms))
  end

  def count_electrocardiograms(id) do
    Angio.Repo.one(
      from(
        ecg in Electrocardiogram,
        select: count(ecg.id),
        where: ecg.info_coronary_id == ^id
      )
    )
  end
end
