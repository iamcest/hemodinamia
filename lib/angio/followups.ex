defmodule Angio.Followups do
  @moduledoc """
  The Followups context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Followups.Asd_closures_fup

  @doc """
  Returns the list of asd_closures_fups.

  ## Examples

      iex> list_asd_closures_fups()
      [%Asd_closures_fup{}, ...]

  """
  def list_asd_closures_fups(conn) do
    #Repo.all(Asd_closures_fup)
    Repo.all(Ecto.assoc(conn.assigns[:patient], :asd_closures_fups))
  end

  @doc """
  Gets a single asd_closures_fup.

  Raises `Ecto.NoResultsError` if the Asd closures fup does not exist.

  ## Examples

      iex> get_asd_closures_fup!(123)
      %Asd_closures_fup{}

      iex> get_asd_closures_fup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_asd_closures_fup!(id), do: Repo.get!(Asd_closures_fup, id)

  @doc """
  Creates a asd_closures_fup.

  ## Examples

      iex> create_asd_closures_fup(%{field: value})
      {:ok, %Asd_closures_fup{}}

      iex> create_asd_closures_fup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_asd_closures_fup(attrs \\ %{}) do
    %Asd_closures_fup{}
    |> Asd_closures_fup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a asd_closures_fup.

  ## Examples

      iex> update_asd_closures_fup(asd_closures_fup, %{field: new_value})
      {:ok, %Asd_closures_fup{}}

      iex> update_asd_closures_fup(asd_closures_fup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_asd_closures_fup(%Asd_closures_fup{} = asd_closures_fup, attrs) do
    asd_closures_fup
    |> Asd_closures_fup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a asd_closures_fup.

  ## Examples

      iex> delete_asd_closures_fup(asd_closures_fup)
      {:ok, %Asd_closures_fup{}}

      iex> delete_asd_closures_fup(asd_closures_fup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_asd_closures_fup(%Asd_closures_fup{} = asd_closures_fup) do
    Repo.delete(asd_closures_fup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking asd_closures_fup changes.

  ## Examples

      iex> change_asd_closures_fup(asd_closures_fup)
      %Ecto.Changeset{source: %Asd_closures_fup{}}

  """
  def change_asd_closures_fup(%Asd_closures_fup{} = asd_closures_fup) do
    Asd_closures_fup.changeset(asd_closures_fup, %{})
  end


 def count_asd_closures_fups(patient_id) do
  Angio.Repo.one(
    from(
      asdclf in Asd_closures_fup,
      select: count(asdclf.id),
      where: asdclf.patient_id == ^patient_id
    )
  )
 end


  alias Angio.Followups.Pci_fup

  @doc """
  Returns the list of pci_fups.

  ## Examples

      iex> list_pci_fups()
      [%Pci_fup{}, ...]

  """

  @doc """
  Gets a single pci_fup.

  Raises `Ecto.NoResultsError` if the Pci fup does not exist.

  ## Examples

      iex> get_pci_fup!(123)
      %Pci_fup{}

      iex> get_pci_fup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pci_fup!(id), do: Repo.get!(Pci_fup, id)

  @doc """
  Creates a pci_fup.

  ## Examples

      iex> create_pci_fup(%{field: value})
      {:ok, %Pci_fup{}}

      iex> create_pci_fup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pci_fup(attrs \\ %{}) do
    %Pci_fup{}
    |> Pci_fup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pci_fup.

  ## Examples

      iex> update_pci_fup(pci_fup, %{field: new_value})
      {:ok, %Pci_fup{}}

      iex> update_pci_fup(pci_fup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pci_fup(%Pci_fup{} = pci_fup, attrs) do
    pci_fup
    |> Pci_fup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pci_fup.

  ## Examples

      iex> delete_pci_fup(pci_fup)
      {:ok, %Pci_fup{}}

      iex> delete_pci_fup(pci_fup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pci_fup(%Pci_fup{} = pci_fup) do
    Repo.delete(pci_fup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pci_fup changes.

  ## Examples

      iex> change_pci_fup(pci_fup)
      %Ecto.Changeset{source: %Pci_fup{}}

  """
  def change_pci_fup(%Pci_fup{} = pci_fup) do
    Pci_fup.changeset(pci_fup, %{})
  end

  def list_pci_fups(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:patient], :pci_fups))
  end



  def count_pci_fups(patient_id) do
    Angio.Repo.one(
      from(
        pfup in Asd_closures_fup,
        select: count(pfup.id),
        where: pfup.patient_id == ^patient_id
      )
    )
   end

  end
