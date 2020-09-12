defmodule Angio.Interventions do
  @moduledoc """
  The Interventions context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Interventions.Asd_closure

  @doc """
  Returns the list of asd_closures.

  ## Examples

      iex> list_asd_closures()
      [%Asd_closure{}, ...]

  """
  def list_asd_closures do
    Repo.all(Asd_closure)
  end

  @doc """
  Gets a single asd_closure.

  Raises `Ecto.NoResultsError` if the Asd closure does not exist.

  ## Examples

      iex> get_asd_closure!(123)
      %Asd_closure{}

      iex> get_asd_closure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_asd_closure!(id), do: Repo.get!(Asd_closure, id)

  @doc """
  Creates a asd_closure.

  ## Examples

      iex> create_asd_closure(%{field: value})
      {:ok, %Asd_closure{}}

      iex> create_asd_closure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_asd_closure(attrs \\ %{}) do
    %Asd_closure{}
    |> Asd_closure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a asd_closure.

  ## Examples

      iex> update_asd_closure(asd_closure, %{field: new_value})
      {:ok, %Asd_closure{}}

      iex> update_asd_closure(asd_closure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_asd_closure(%Asd_closure{} = asd_closure, attrs) do
    asd_closure
    |> Asd_closure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Asd_closure.

  ## Examples

      iex> delete_asd_closure(asd_closure)
      {:ok, %Asd_closure{}}

      iex> delete_asd_closure(asd_closure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_asd_closure(%Asd_closure{} = asd_closure) do
    Repo.delete(asd_closure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking asd_closure changes.

  ## Examples

      iex> change_asd_closure(asd_closure)
      %Ecto.Changeset{source: %Asd_closure{}}

  """
  def change_asd_closure(%Asd_closure{} = asd_closure) do
    Asd_closure.changeset(asd_closure, %{})
  end

  def list_asd_closures(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :asd_closures))
  end

  def count_asd_closures(id) do
    Angio.Repo.one(
      from(
        closures in Asd_closure,
        select: count(closures.id),
        where: closures.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Interventions.Coarc_procedure

  @doc """
  Returns the list of coarc_procedures.

  ## Examples

      iex> list_coarc_procedures()
      [%Coarc_procedure{}, ...]

  """
  def list_coarc_procedures(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :coarc_procedures))
    #Repo.all(Coarc_procedure)
  end


  @doc """
  Gets a single coarc_procedure.

  Raises `Ecto.NoResultsError` if the Coarc procedure does not exist.

  ## Examples

      iex> get_coarc_procedure!(123)
      %Coarc_procedure{}

      iex> get_coarc_procedure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coarc_procedure!(id), do: Repo.get!(Coarc_procedure, id)

  @doc """
  Creates a coarc_procedure.

  ## Examples

      iex> create_coarc_procedure(%{field: value})
      {:ok, %Coarc_procedure{}}

      iex> create_coarc_procedure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coarc_procedure(attrs \\ %{}) do
    %Coarc_procedure{}
    |> Coarc_procedure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coarc_procedure.

  ## Examples

      iex> update_coarc_procedure(coarc_procedure, %{field: new_value})
      {:ok, %Coarc_procedure{}}

      iex> update_coarc_procedure(coarc_procedure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coarc_procedure(%Coarc_procedure{} = coarc_procedure, attrs) do
    coarc_procedure
    |> Coarc_procedure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Coarc_procedure.

  ## Examples

      iex> delete_coarc_procedure(coarc_procedure)
      {:ok, %Coarc_procedure{}}

      iex> delete_coarc_procedure(coarc_procedure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coarc_procedure(%Coarc_procedure{} = coarc_procedure) do
    Repo.delete(coarc_procedure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coarc_procedure changes.

  ## Examples

      iex> change_coarc_procedure(coarc_procedure)
      %Ecto.Changeset{source: %Coarc_procedure{}}

  """
  def change_coarc_procedure(%Coarc_procedure{} = coarc_procedure) do
    Coarc_procedure.changeset(coarc_procedure, %{})
  end

  def count_coarc_procedures(id) do
    Angio.Repo.one(
      from(
        coarcs in Coarc_procedure,
        select: count(coarcs.id),
        where: coarcs.info_coronary_id == ^id
      )
    )
  end



  alias Angio.Interventions.Coarc_device

  @doc """
  Returns the list of coarc_devices.

  ## Examples

      iex> list_coarc_devices()
      [%Coarc_device{}, ...]

  """

  def count_coarc_devices(id) do
    Angio.Repo.one(
      from(
        devices in Coarc_device,
        select: count(devices.id),
        where: devices.info_coronary_id == ^id
      )
    )
  end

  @doc """
  Gets a single coarc_device.

  Raises `Ecto.NoResultsError` if the Coarc device does not exist.

  ## Examples

      iex> get_coarc_device!(123)
      %Coarc_device{}

      iex> get_coarc_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coarc_device!(id), do: Repo.get!(Coarc_device, id)

  @doc """
  Creates a coarc_device.

  ## Examples

      iex> create_coarc_device(%{field: value})
      {:ok, %Coarc_device{}}

      iex> create_coarc_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coarc_device(attrs \\ %{}) do
    %Coarc_device{}
    |> Coarc_device.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coarc_device.

  ## Examples

      iex> update_coarc_device(coarc_device, %{field: new_value})
      {:ok, %Coarc_device{}}

      iex> update_coarc_device(coarc_device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coarc_device(%Coarc_device{} = coarc_device, attrs) do
    coarc_device
    |> Coarc_device.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Coarc_device.

  ## Examples

      iex> delete_coarc_device(coarc_device)
      {:ok, %Coarc_device{}}

      iex> delete_coarc_device(coarc_device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coarc_device(%Coarc_device{} = coarc_device) do
    Repo.delete(coarc_device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coarc_device changes.

  ## Examples

      iex> change_coarc_device(coarc_device)
      %Ecto.Changeset{source: %Coarc_device{}}

  """
  def change_coarc_device(%Coarc_device{} = coarc_device) do
    Coarc_device.changeset(coarc_device, %{})
  end

def list_coarc_devices(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:coarc_procedure], :coarc_devices))
    #Repo.all(Coarc_device)
  end



  alias Angio.Interventions.Av_plasty

  @doc """
  Returns the list of av_plasties.

  ## Examples

      iex> list_av_plasties()
      [%Av_plasty{}, ...]

  """
  def list_av_plasties do
    Repo.all(Av_plasty)
  end

  @doc """
  Gets a single av_plasty.

  Raises `Ecto.NoResultsError` if the Av plasty does not exist.

  ## Examples

      iex> get_av_plasty!(123)
      %Av_plasty{}

      iex> get_av_plasty!(456)
      ** (Ecto.NoResultsError)

  """
  def get_av_plasty!(id), do: Repo.get!(Av_plasty, id)

  @doc """
  Creates a av_plasty.

  ## Examples

      iex> create_av_plasty(%{field: value})
      {:ok, %Av_plasty{}}

      iex> create_av_plasty(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_av_plasty(attrs \\ %{}) do
    %Av_plasty{}
    |> Av_plasty.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a av_plasty.

  ## Examples

      iex> update_av_plasty(av_plasty, %{field: new_value})
      {:ok, %Av_plasty{}}

      iex> update_av_plasty(av_plasty, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_av_plasty(%Av_plasty{} = av_plasty, attrs) do
    av_plasty
    |> Av_plasty.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Av_plasty.

  ## Examples

      iex> delete_av_plasty(av_plasty)
      {:ok, %Av_plasty{}}

      iex> delete_av_plasty(av_plasty)
      {:error, %Ecto.Changeset{}}

  """
  def delete_av_plasty(%Av_plasty{} = av_plasty) do
    Repo.delete(av_plasty)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking av_plasty changes.

  ## Examples

      iex> change_av_plasty(av_plasty)
      %Ecto.Changeset{source: %Av_plasty{}}

  """
  def change_av_plasty(%Av_plasty{} = av_plasty) do
    Av_plasty.changeset(av_plasty, %{})
  end


  def list_av_plasties(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :av_plasties))
  end


  @spec count_av_plasties(any) :: any
  def count_av_plasties(id) do
    Angio.Repo.one(
      from(
        plasties in Av_plasty,
        select: count(plasties.id),
        where: plasties.info_coronary_id == ^id
      )
    )
  end



  alias Angio.Interventions.Av_plasties_inflation

  @doc """
  Returns the list of av_plasties_inflations.

  ## Examples

      iex> list_av_plasties_inflations()
      [%Av_plasties_inflation{}, ...]

  """
  def list_av_plasties_inflations(conn) do
   # Repo.all(Av_plasties_inflation)
   Repo.all(Ecto.assoc(conn.assigns[:av_plasty], :av_plasties_inflations))
  end

  @spec count_av_plasties_inflations(any) :: any
  def count_av_plasties_inflations(id) do
    Angio.Repo.one(
      from(
        inflations in Av_plasties_inflation,
        select: count(inflations.id),
        where: inflations.av_plasty_id == ^id
      )
    )
  end



  @doc """
  Gets a single av_plasties_inflation.

  Raises `Ecto.NoResultsError` if the Av plasties inflation does not exist.

  ## Examples

      iex> get_av_plasties_inflation!(123)
      %Av_plasties_inflation{}

      iex> get_av_plasties_inflation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_av_plasties_inflation!(id), do: Repo.get!(Av_plasties_inflation, id)

  @doc """
  Creates a av_plasties_inflation.

  ## Examples

      iex> create_av_plasties_inflation(%{field: value})
      {:ok, %Av_plasties_inflation{}}

      iex> create_av_plasties_inflation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_av_plasties_inflation(attrs \\ %{}) do
    %Av_plasties_inflation{}
    |> Av_plasties_inflation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a av_plasties_inflation.

  ## Examples

      iex> update_av_plasties_inflation(av_plasties_inflation, %{field: new_value})
      {:ok, %Av_plasties_inflation{}}

      iex> update_av_plasties_inflation(av_plasties_inflation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_av_plasties_inflation(%Av_plasties_inflation{} = av_plasties_inflation, attrs) do
    av_plasties_inflation
    |> Av_plasties_inflation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Av_plasties_inflation.

  ## Examples

      iex> delete_av_plasties_inflation(av_plasties_inflation)
      {:ok, %Av_plasties_inflation{}}

      iex> delete_av_plasties_inflation(av_plasties_inflation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_av_plasties_inflation(%Av_plasties_inflation{} = av_plasties_inflation) do
    Repo.delete(av_plasties_inflation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking av_plasties_inflation changes.

  ## Examples

      iex> change_av_plasties_inflation(av_plasties_inflation)
      %Ecto.Changeset{source: %Av_plasties_inflation{}}

  """
  def change_av_plasties_inflation(%Av_plasties_inflation{} = av_plasties_inflation) do
    Av_plasties_inflation.changeset(av_plasties_inflation, %{})
  end






  alias Angio.Interventions.Pci_procedure

  @doc """
  Returns the list of pci_procedures.

  ## Examples

      iex> list_pci_procedures()
      [%Pci_procedure{}, ...]

  """
  def list_pci_procedures do
    Repo.all(Pci_procedure)
  end

  @doc """
  Gets a single pci_procedure.

  Raises `Ecto.NoResultsError` if the Pci procedure does not exist.

  ## Examples

      iex> get_pci_procedure!(123)
      %Pci_procedure{}

      iex> get_pci_procedure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pci_procedure!(id), do: Repo.get!(Pci_procedure, id)

  @doc """
  Creates a pci_procedure.

  ## Examples

      iex> create_pci_procedure(%{field: value})
      {:ok, %Pci_procedure{}}

      iex> create_pci_procedure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pci_procedure(attrs \\ %{}) do
    %Pci_procedure{}
    |> Pci_procedure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pci_procedure.

  ## Examples

      iex> update_pci_procedure(pci_procedure, %{field: new_value})
      {:ok, %Pci_procedure{}}

      iex> update_pci_procedure(pci_procedure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pci_procedure(%Pci_procedure{} = pci_procedure, attrs) do
    pci_procedure
    |> Pci_procedure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pci_procedure.

  ## Examples

      iex> delete_pci_procedure(pci_procedure)
      {:ok, %Pci_procedure{}}

      iex> delete_pci_procedure(pci_procedure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pci_procedure(%Pci_procedure{} = pci_procedure) do
    Repo.delete(pci_procedure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pci_procedure changes.

  ## Examples

      iex> change_pci_procedure(pci_procedure)
      %Ecto.Changeset{source: %Pci_procedure{}}

  """
  def change_pci_procedure(%Pci_procedure{} = pci_procedure) do
    Pci_procedure.changeset(pci_procedure, %{})
  end

  def list_pci_procedures(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :pci_procedures))
  end


  @spec count_av_plasties(any) :: any
  def count_pci_procedures(id) do
    Angio.Repo.one(
      from(
        pcis in Pci_procedure,
        select: count(pcis.id),
        where: pcis.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Interventions.Pci_lesion

  @doc """
  Returns the list of pci_lesions.

  ## Examples

      iex> list_pci_lesions()
      [%Pci_lesion{}, ...]

  """
  def list_pci_lesions(conn) do
    #Repo.all(Pci_lesion)
    Repo.all(Ecto.assoc(conn.assigns[:pci_procedure], :pci_lesions))
  end
  @doc """
  Gets a single pci_lesion.

  Raises `Ecto.NoResultsError` if the Pci lesion does not exist.

  ## Examples

      iex> get_pci_lesion!(123)
      %Pci_lesion{}

      iex> get_pci_lesion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pci_lesion!(id), do: Repo.get!(Pci_lesion, id)

  @doc """
  Creates a pci_lesion.

  ## Examples

      iex> create_pci_lesion(%{field: value})
      {:ok, %Pci_lesion{}}

      iex> create_pci_lesion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pci_lesion(attrs \\ %{}) do
    %Pci_lesion{}
    |> Pci_lesion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pci_lesion.

  ## Examples

      iex> update_pci_lesion(pci_lesion, %{field: new_value})
      {:ok, %Pci_lesion{}}

      iex> update_pci_lesion(pci_lesion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pci_lesion(%Pci_lesion{} = pci_lesion, attrs) do
    pci_lesion
    |> Pci_lesion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pci_lesion.

  ## Examples

      iex> delete_pci_lesion(pci_lesion)
      {:ok, %Pci_lesion{}}

      iex> delete_pci_lesion(pci_lesion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pci_lesion(%Pci_lesion{} = pci_lesion) do
    Repo.delete(pci_lesion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pci_lesion changes.

  ## Examples

      iex> change_pci_lesion(pci_lesion)
      %Ecto.Changeset{source: %Pci_lesion{}}

  """
  def change_pci_lesion(%Pci_lesion{} = pci_lesion) do
    Pci_lesion.changeset(pci_lesion, %{})
  end

  def count_pci_lesions(id) do
    Angio.Repo.one(
      from(
        les in Pci_lesion,
        select: count(les.id),
        where: les.info_coronary_id == ^id
      )
    )
  end



end
