defmodule Angio.Caths do
  @moduledoc """
  The Caths context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Caths.Info_coronary

  @doc """
  Returns the list of info_coronaries.

  ## Examples

      iex> list_info_coronaries()
      [%Info_coronary{}, ...]

  """
  def list_info_coronaries do
    Repo.all(Info_coronary)
  end

  @doc """
  Gets a single info_coronary.

  Raises `Ecto.NoResultsError` if the Info coronary does not exist.

  ## Examples

      iex> get_info_coronary!(123)
      %Info_coronary{}

      iex> get_info_coronary!(456)
      ** (Ecto.NoResultsError)

  """
  def get_info_coronary!(id), do: Repo.get!(Info_coronary, id)

  @doc """
  Creates a info_coronary.

  ## Examples

      iex> create_info_coronary(%{field: value})
      {:ok, %Info_coronary{}}

      iex> create_info_coronary(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_info_coronary(attrs \\ %{}) do
    %Info_coronary{}
    |> Info_coronary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a info_coronary.

  ## Examples

      iex> update_info_coronary(info_coronary, %{field: new_value})
      {:ok, %Info_coronary{}}

      iex> update_info_coronary(info_coronary, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_info_coronary(%Info_coronary{} = info_coronary, attrs) do
    info_coronary
    |> Info_coronary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Info_coronary.

  ## Examples

      iex> delete_info_coronary(info_coronary)
      {:ok, %Info_coronary{}}

      iex> delete_info_coronary(info_coronary)
      {:error, %Ecto.Changeset{}}

  """
  def delete_info_coronary(%Info_coronary{} = info_coronary) do
    Repo.delete(info_coronary)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking info_coronary changes.

  ## Examples

      iex> change_info_coronary(info_coronary)
      %Ecto.Changeset{source: %Info_coronary{}}

  """
  def change_info_coronary(%Info_coronary{} = info_coronary) do
    Info_coronary.changeset(info_coronary, %{})
  end

  alias Angio.Caths.Cor_lesion

  @doc """
  Returns the list of cor_lesions.

  ## Examples

  iex> list_cor_lesions()
  [%Cor_lesion{}, ...]

  """
  def list_cor_lesions(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cor_lesions))
  end

  # def list_cor_lesions do
  #  Repo.all(Cor_lesion)
  # end

  @doc """
  Gets a single cor_lesion.

  Raises `Ecto.NoResultsError` if the Cor lesion does not exist.

  ## Examples

      iex> get_cor_lesion!(123)
      %Cor_lesion{}

      iex> get_cor_lesion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cor_lesion!(id), do: Repo.get!(Cor_lesion, id)

  @doc """
  Creates a cor_lesion.

  ## Examples

      iex> create_cor_lesion(%{field: value})
      {:ok, %Cor_lesion{}}

      iex> create_cor_lesion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cor_lesion(attrs \\ %{}) do
    %Cor_lesion{}
    |> Cor_lesion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cor_lesion.

  ## Examples

      iex> update_cor_lesion(cor_lesion, %{field: new_value})
      {:ok, %Cor_lesion{}}

      iex> update_cor_lesion(cor_lesion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cor_lesion(%Cor_lesion{} = cor_lesion, attrs) do
    cor_lesion
    |> Cor_lesion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cor_lesion.

  ## Examples

      iex> delete_cor_lesion(cor_lesion)
      {:ok, %Cor_lesion{}}

      iex> delete_cor_lesion(cor_lesion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cor_lesion(%Cor_lesion{} = cor_lesion) do
    Repo.delete(cor_lesion)
  end

  def lesion_counter(info_coronary_id) do
    res_count =
      Angio.Repo.one(
        from(
          les in Cor_lesion,
          select: count("*"),
          # select: les.cor_les_counter,
          where: les.info_coronary_id == ^info_coronary_id
        )
      )

    cond do
      res_count == nil ->
        res_count = 1

      res_count == 0 ->
        res_count = 1

      true ->
        res_count + 1
    end
  end

  ###############

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cor_lesion changes.

  ## Examples

      iex> change_cor_lesion(cor_lesion)
      %Ecto.Changeset{source: %Cor_lesion{}}

  """
  def change_cor_lesion(%Cor_lesion{} = cor_lesion) do
    Cor_lesion.changeset(cor_lesion, %{})
  end

  def count_lesions(id) do
    Angio.Repo.one(
      from(
        lesion in Cor_lesion,
        select: count(lesion.id),
        where: lesion.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Caths.Cath_graft

  @doc """
  Returns the list of cath_graft.

  ## Examples

      iex> list_cath_graft()
      [%Cath_graft{}, ...]

  """
  def list_cath_grafts(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_grafts))

    # Repo.all(Cath_graft)
  end

  @doc """
  Gets a single cath_graft.

  Raises `Ecto.NoResultsError` if the Cath graft does not exist.

  ## Examples

      iex> get_cath_graft!(123)
      %Cath_graft{}

      iex> get_cath_graft!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_graft!(id), do: Repo.get!(Cath_graft, id)

  @doc """
  Creates a cath_graft.

  ## Examples

      iex> create_cath_graft(%{field: value})
      {:ok, %Cath_graft{}}

      iex> create_cath_graft(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_graft(attrs \\ %{}) do
    %Cath_graft{}
    |> Cath_graft.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_graft.

  ## Examples

      iex> update_cath_graft(cath_graft, %{field: new_value})
      {:ok, %Cath_graft{}}

      iex> update_cath_graft(cath_graft, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_graft(%Cath_graft{} = cath_graft, attrs) do
    cath_graft
    |> Cath_graft.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_graft.

  ## Examples

      iex> delete_cath_graft(cath_graft)
      {:ok, %Cath_graft{}}

      iex> delete_cath_graft(cath_graft)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_graft(%Cath_graft{} = cath_graft) do
    Repo.delete(cath_graft)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_graft changes.

  ## Examples

      iex> change_cath_graft(cath_graft)
      %Ecto.Changeset{source: %Cath_graft{}}

  """
  def change_cath_graft(%Cath_graft{} = cath_graft) do
    Cath_graft.changeset(cath_graft, %{})
  end

  ###########################
  def count_grafts(id) do
    Angio.Repo.one(
      from(
        graft in Cath_graft,
        select: count(graft.id),
        where: graft.info_coronary_id == ^id
      )
    )
  end

  #####################################
  alias Angio.Caths.Cor_collateral

  @doc """
  Returns the list of cor_collaterals.

  ## Examples

      iex> list_cor_collaterals()
      [%Cor_collateral{}, ...]

  """
  def list_cor_collaterals(conn) do
    Repo.all(
      Ecto.assoc(
        conn.assigns[:info_coronary],
        :cor_collaterals
      )
    )

    # Repo.all(Cor_collateral)
  end

  @doc """
  Gets a single cor_collateral.

  Raises `Ecto.NoResultsError` if the Cor collateral does not exist.

  ## Examples

      iex> get_cor_collateral!(123)
      %Cor_collateral{}

      iex> get_cor_collateral!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cor_collateral!(id), do: Repo.get!(Cor_collateral, id)

  @doc """
  Creates a cor_collateral.

  ## Examples

      iex> create_cor_collateral(%{field: value})
      {:ok, %Cor_collateral{}}

      iex> create_cor_collateral(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cor_collateral(attrs \\ %{}) do
    %Cor_collateral{}
    |> Cor_collateral.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cor_collateral.

  ## Examples

      iex> update_cor_collateral(cor_collateral, %{field: new_value})
      {:ok, %Cor_collateral{}}

      iex> update_cor_collateral(cor_collateral, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cor_collateral(%Cor_collateral{} = cor_collateral, attrs) do
    cor_collateral
    |> Cor_collateral.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cor_collateral.

  ## Examples

      iex> delete_cor_collateral(cor_collateral)
      {:ok, %Cor_collateral{}}

      iex> delete_cor_collateral(cor_collateral)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cor_collateral(%Cor_collateral{} = cor_collateral) do
    Repo.delete(cor_collateral)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cor_collateral changes.

  ## Examples

      iex> change_cor_collateral(cor_collateral)
      %Ecto.Changeset{source: %Cor_collateral{}}

  """
  def change_cor_collateral(%Cor_collateral{} = cor_collateral) do
    Cor_collateral.changeset(cor_collateral, %{})
  end

  ##########################
  def count_collaterals(id) do
    Angio.Repo.one(
      from(
        collateral in Cor_collateral,
        select: count(collateral.id),
        where: collateral.info_coronary_id == ^id
      )
    )
  end

  #################
  alias Angio.Caths.Care_episode

  @doc """
  Returns the list of care_episodes.

  ## Examples

      iex> list_care_episodes()
      [%Care_episode{}, ...]

  """
  def list_care_episodes(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :care_episodes))
  end

  @doc """
  Gets a single care_episode.

  Raises `Ecto.NoResultsError` if the Care episode does not exist.

  ## Examples

      iex> get_care_episode!(123)
      %Care_episode{}

      iex> get_care_episode!(456)
      ** (Ecto.NoResultsError)

  """
  def get_care_episode!(id), do: Repo.get!(Care_episode, id)

  @doc """
  Creates a care_episode.

  ## Examples

      iex> create_care_episode(%{field: value})
      {:ok, %Care_episode{}}

      iex> create_care_episode(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_care_episode(attrs \\ %{}) do
    %Care_episode{}
    |> Care_episode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a care_episode.

  ## Examples

      iex> update_care_episode(care_episode, %{field: new_value})
      {:ok, %Care_episode{}}

      iex> update_care_episode(care_episode, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_care_episode(%Care_episode{} = care_episode, attrs) do
    care_episode
    |> Care_episode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Care_episode.

  ## Examples

      iex> delete_care_episode(care_episode)
      {:ok, %Care_episode{}}

      iex> delete_care_episode(care_episode)
      {:error, %Ecto.Changeset{}}

  """
  def delete_care_episode(%Care_episode{} = care_episode) do
    Repo.delete(care_episode)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking care_episode changes.

  ## Examples

      iex> change_care_episode(care_episode)
      %Ecto.Changeset{source: %Care_episode{}}

  """
  def change_care_episode(%Care_episode{} = care_episode) do
    Care_episode.changeset(care_episode, %{})
  end

  alias Angio.Caths.Cath_event

  @doc """
  Returns the list of cath_events.

  ## Examples

      iex> list_cath_events()
      [%Cath_event{}, ...]

  """
  def list_cath_events(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_events))
  end

  @doc """
  Gets a single cath_event.

  Raises `Ecto.NoResultsError` if the Cath event does not exist.

  ## Examples

      iex> get_cath_event!(123)
      %Cath_event{}

      iex> get_cath_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_event!(id), do: Repo.get!(Cath_event, id)

  @doc """
  Creates a cath_event.

  ## Examples

      iex> create_cath_event(%{field: value})
      {:ok, %Cath_event{}}

      iex> create_cath_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_event(attrs \\ %{}) do
    %Cath_event{}
    |> Cath_event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_event.

  ## Examples

      iex> update_cath_event(cath_event, %{field: new_value})
      {:ok, %Cath_event{}}

      iex> update_cath_event(cath_event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_event(%Cath_event{} = cath_event, attrs) do
    cath_event
    |> Cath_event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_event.

  ## Examples

      iex> delete_cath_event(cath_event)
      {:ok, %Cath_event{}}

      iex> delete_cath_event(cath_event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_event(%Cath_event{} = cath_event) do
    Repo.delete(cath_event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_event changes.

  ## Examples

      iex> change_cath_event(cath_event)
      %Ecto.Changeset{source: %Cath_event{}}

  """
  def change_cath_event(%Cath_event{} = cath_event) do
    Cath_event.changeset(cath_event, %{})
  end

  ################################
  ################################
  def count_events(id) do
    Angio.Repo.one(
      from(
        info in Cath_event,
        select: count(info.id),
        where: info.info_coronary_id == ^id
      )
    )
  end

  ###########

  def count_info_coronary(id) do
    Angio.Repo.one(
      from(
        info in Info_coronary,
        select: count(info.id),
        where: info.patient_id == ^id
      )
    )
  end

  ###########

  alias Angio.Caths.Cath_radiation

  @doc """
  Returns the list of cath_radiations.

  ## Examples

      iex> list_cath_radiations()
      [%Cath_radiation{}, ...]

  """
  def list_cath_radiations(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_radiations))

    # Repo.all(Cath_radiation)
  end

  @doc """
  Gets a single cath_radiation.

  Raises `Ecto.NoResultsError` if the Cath radiation does not exist.

  ## Examples

      iex> get_cath_radiation!(123)
      %Cath_radiation{}

      iex> get_cath_radiation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_radiation!(id), do: Repo.get!(Cath_radiation, id)

  @doc """
  Creates a cath_radiation.

  ## Examples

      iex> create_cath_radiation(%{field: value})
      {:ok, %Cath_radiation{}}

      iex> create_cath_radiation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_radiation(attrs \\ %{}) do
    %Cath_radiation{}
    |> Cath_radiation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_radiation.

  ## Examples

      iex> update_cath_radiation(cath_radiation, %{field: new_value})
      {:ok, %Cath_radiation{}}

      iex> update_cath_radiation(cath_radiation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_radiation(%Cath_radiation{} = cath_radiation, attrs) do
    cath_radiation
    |> Cath_radiation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_radiation.

  ## Examples

      iex> delete_cath_radiation(cath_radiation)
      {:ok, %Cath_radiation{}}

      iex> delete_cath_radiation(cath_radiation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_radiation(%Cath_radiation{} = cath_radiation) do
    Repo.delete(cath_radiation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_radiation changes.

  ## Examples

      iex> change_cath_radiation(cath_radiation)
      %Ecto.Changeset{source: %Cath_radiation{}}

  """
  def change_cath_radiation(%Cath_radiation{} = cath_radiation) do
    Cath_radiation.changeset(cath_radiation, %{})
  end

  ###########

  def count_radiations(id) do
    Angio.Repo.one(
      from(
        radiation in Cath_radiation,
        select: count(radiation.id),
        where: radiation.info_coronary_id == ^id
      )
    )
  end

  ###########
  alias Angio.Caths.Lventricle

  @doc """
  Returns the list of lventricles.

  ## Examples

      iex> list_lventricles()
      [%Lventricle{}, ...]

  """
  def list_lventricles(conn) do
    Repo.all(
      Ecto.assoc(
        conn.assigns[:info_coronary],
        :lventricles
      )
    )

    # Repo.all(Lventricle)
  end

  @doc """
  Gets a single lventricle.

  Raises `Ecto.NoResultsError` if the Lventricle does not exist.

  ## Examples

      iex> get_lventricle!(123)
      %Lventricle{}

      iex> get_lventricle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lventricle!(id), do: Repo.get!(Lventricle, id)

  @doc """
  Creates a lventricle.

  ## Examples

      iex> create_lventricle(%{field: value})
      {:ok, %Lventricle{}}

      iex> create_lventricle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lventricle(attrs \\ %{}) do
    %Lventricle{}
    |> Lventricle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lventricle.

  ## Examples

      iex> update_lventricle(lventricle, %{field: new_value})
      {:ok, %Lventricle{}}

      iex> update_lventricle(lventricle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lventricle(%Lventricle{} = lventricle, attrs) do
    lventricle
    |> Lventricle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lventricle.

  ## Examples

      iex> delete_lventricle(lventricle)
      {:ok, %Lventricle{}}

      iex> delete_lventricle(lventricle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lventricle(%Lventricle{} = lventricle) do
    Repo.delete(lventricle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lventricle changes.

  ## Examples

      iex> change_lventricle(lventricle)
      %Ecto.Changeset{source: %Lventricle{}}

  """
  def change_lventricle(%Lventricle{} = lventricle) do
    Lventricle.changeset(lventricle, %{})
  end

  ##########################
  def count_lvs(id) do
    Angio.Repo.one(
      from(
        lv in Lventricle,
        select: count(lv.id),
        where: lv.info_coronary_id == ^id
      )
    )
  end

  ##############################
  alias Angio.Caths.Cath_med

  @doc """
  Returns the list of cath_meds.

  ## Examples

      iex> list_cath_meds()
      [%Cath_med{}, ...]

  """
  def list_cath_meds(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_meds))

    # Repo.all(Cath_med)
  end

  @doc """
  Gets a single cath_med.

  Raises `Ecto.NoResultsError` if the Cath med does not exist.

  ## Examples

      iex> get_cath_med!(123)
      %Cath_med{}

      iex> get_cath_med!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_med!(id), do: Repo.get!(Cath_med, id)

  @doc """
  Creates a cath_med.

  ## Examples

      iex> create_cath_med(%{field: value})
      {:ok, %Cath_med{}}

      iex> create_cath_med(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_med(attrs \\ %{}) do
    %Cath_med{}
    |> Cath_med.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_med.

  ## Examples

      iex> update_cath_med(cath_med, %{field: new_value})
      {:ok, %Cath_med{}}

      iex> update_cath_med(cath_med, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_med(%Cath_med{} = cath_med, attrs) do
    cath_med
    |> Cath_med.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_med.

  ## Examples

      iex> delete_cath_med(cath_med)
      {:ok, %Cath_med{}}

      iex> delete_cath_med(cath_med)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_med(%Cath_med{} = cath_med) do
    Repo.delete(cath_med)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_med changes.

  ## Examples

      iex> change_cath_med(cath_med)
      %Ecto.Changeset{source: %Cath_med{}}

  """
  def change_cath_med(%Cath_med{} = cath_med) do
    Cath_med.changeset(cath_med, %{})
  end

  ##########################
  def count_meds(id) do
    Angio.Repo.one(
      from(
        med in Cath_med,
        select: count(med.id),
        where: med.info_coronary_id == ^id
      )
    )
  end

  ##############################
  alias Angio.Caths.Proc_episode

  @doc """
  Returns the list of proc_episodes.

  ## Examples

      iex> list_proc_episodes()
      [%Proc_episode{}, ...]

  """
  def list_proc_episodes(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :proc_episodes))

    # Repo.all(Proc_episode)
  end

  @doc """
  Gets a single proc_episode.

  Raises `Ecto.NoResultsError` if the Proc episode does not exist.

  ## Examples

      iex> get_proc_episode!(123)
      %Proc_episode{}

      iex> get_proc_episode!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proc_episode!(id), do: Repo.get!(Proc_episode, id)

  @doc """
  Creates a proc_episode.

  ## Examples

      iex> create_proc_episode(%{field: value})
      {:ok, %Proc_episode{}}

      iex> create_proc_episode(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proc_episode(attrs \\ %{}) do
    %Proc_episode{}
    |> Proc_episode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proc_episode.

  ## Examples

      iex> update_proc_episode(proc_episode, %{field: new_value})
      {:ok, %Proc_episode{}}

      iex> update_proc_episode(proc_episode, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proc_episode(%Proc_episode{} = proc_episode, attrs) do
    proc_episode
    |> Proc_episode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Proc_episode.

  ## Examples

      iex> delete_proc_episode(proc_episode)
      {:ok, %Proc_episode{}}

      iex> delete_proc_episode(proc_episode)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proc_episode(%Proc_episode{} = proc_episode) do
    Repo.delete(proc_episode)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proc_episode changes.

  ## Examples

      iex> change_proc_episode(proc_episode)
      %Ecto.Changeset{source: %Proc_episode{}}

  """
  def change_proc_episode(%Proc_episode{} = proc_episode) do
    Proc_episode.changeset(proc_episode, %{})
  end

  ################
  def count_episodes(id) do
    Angio.Repo.one(
      from(
        graft in Proc_episode,
        select: count(graft.id),
        where: graft.info_coronary_id == ^id
      )
    )
  end

  ###############################
  alias Angio.Caths.Cor_anatomy

  @doc """
  Returns the list of cor_anatomies.

  ## Examples

      iex> list_cor_anatomies()
      [%Cor_anatomy{}, ...]

  """
  def list_cor_anatomies(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cor_anatomies))

    # Repo.all(Cor_anatomy)
  end

  @doc """
  Gets a single cor_anatomy.

  Raises `Ecto.NoResultsError` if the Cor anatomy does not exist.

  ## Examples

      iex> get_cor_anatomy!(123)
      %Cor_anatomy{}

      iex> get_cor_anatomy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cor_anatomy!(id), do: Repo.get!(Cor_anatomy, id)

  @doc """
  Creates a cor_anatomy.

  ## Examples

      iex> create_cor_anatomy(%{field: value})
      {:ok, %Cor_anatomy{}}

      iex> create_cor_anatomy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cor_anatomy(attrs \\ %{}) do
    %Cor_anatomy{}
    |> Cor_anatomy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cor_anatomy.

  ## Examples

      iex> update_cor_anatomy(cor_anatomy, %{field: new_value})
      {:ok, %Cor_anatomy{}}

      iex> update_cor_anatomy(cor_anatomy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cor_anatomy(%Cor_anatomy{} = cor_anatomy, attrs) do
    cor_anatomy
    |> Cor_anatomy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cor_anatomy.

  ## Examples

      iex> delete_cor_anatomy(cor_anatomy)
      {:ok, %Cor_anatomy{}}

      iex> delete_cor_anatomy(cor_anatomy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cor_anatomy(%Cor_anatomy{} = cor_anatomy) do
    Repo.delete(cor_anatomy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cor_anatomy changes.

  ## Examples

      iex> change_cor_anatomy(cor_anatomy)
      %Ecto.Changeset{source: %Cor_anatomy{}}

  """
  def change_cor_anatomy(%Cor_anatomy{} = cor_anatomy) do
    Cor_anatomy.changeset(cor_anatomy, %{})
  end

  ##########################
  def count_anatomies(id) do
    Angio.Repo.one(
      from(
        anatomy in Cor_anatomy,
        select: count(anatomy.id),
        where: anatomy.info_coronary_id == ^id
      )
    )
  end

  #################
  alias Angio.Caths.Sats_pressure

  @doc """
  Returns the list of sats_pressures.

  ## Examples

      iex> list_sats_pressures()
      [%Sats_pressure{}, ...]

  """
  def list_sats_pressures(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :sats_pressures))
    # Repo.all(Sats_pressure)
  end

  @doc """
  Gets a single sats_pressure.

  Raises `Ecto.NoResultsError` if the Sats pressure does not exist.

  ## Examples

      iex> get_sats_pressure!(123)
      %Sats_pressure{}

      iex> get_sats_pressure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sats_pressure!(id), do: Repo.get!(Sats_pressure, id)

  @doc """
  Creates a sats_pressure.

  ## Examples

      iex> create_sats_pressure(%{field: value})
      {:ok, %Sats_pressure{}}

      iex> create_sats_pressure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sats_pressure(attrs \\ %{}) do
    %Sats_pressure{}
    |> Sats_pressure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sats_pressure.

  ## Examples

      iex> update_sats_pressure(sats_pressure, %{field: new_value})
      {:ok, %Sats_pressure{}}

      iex> update_sats_pressure(sats_pressure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sats_pressure(%Sats_pressure{} = sats_pressure, attrs) do
    sats_pressure
    |> Sats_pressure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sats_pressure.

  ## Examples

      iex> delete_sats_pressure(sats_pressure)
      {:ok, %Sats_pressure{}}

      iex> delete_sats_pressure(sats_pressure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sats_pressure(%Sats_pressure{} = sats_pressure) do
    Repo.delete(sats_pressure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sats_pressure changes.

  ## Examples

      iex> change_sats_pressure(sats_pressure)
      %Ecto.Changeset{source: %Sats_pressure{}}

  """
  def change_sats_pressure(%Sats_pressure{} = sats_pressure) do
    Sats_pressure.changeset(sats_pressure, %{})
  end

  ##########################
  def count_sats(id) do
    Angio.Repo.one(
      from(
        sat in Sats_pressure,
        select: count(sat.id),
        where: sat.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Caths.Cath_lab

  @doc """
  Returns the list of cath_labs.

  ## Examples

      iex> list_cath_labs()
      [%Cath_lab{}, ...]

  """
  def list_cath_labs(conn) do
    # Repo.all(Cath_lab)
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cath_labs))
  end

  @doc """
  Gets a single cath_lab.

  Raises `Ecto.NoResultsError` if the Cath lab does not exist.

  ## Examples

      iex> get_cath_lab!(123)
      %Cath_lab{}

      iex> get_cath_lab!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cath_lab!(id), do: Repo.get!(Cath_lab, id)

  @doc """
  Creates a cath_lab.

  ## Examples

      iex> create_cath_lab(%{field: value})
      {:ok, %Cath_lab{}}

      iex> create_cath_lab(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cath_lab(attrs \\ %{}) do
    %Cath_lab{}
    |> Cath_lab.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cath_lab.

  ## Examples

      iex> update_cath_lab(cath_lab, %{field: new_value})
      {:ok, %Cath_lab{}}

      iex> update_cath_lab(cath_lab, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cath_lab(%Cath_lab{} = cath_lab, attrs) do
    cath_lab
    |> Cath_lab.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cath_lab.

  ## Examples

      iex> delete_cath_lab(cath_lab)
      {:ok, %Cath_lab{}}

      iex> delete_cath_lab(cath_lab)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cath_lab(%Cath_lab{} = cath_lab) do
    Repo.delete(cath_lab)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cath_lab changes.

  ## Examples

      iex> change_cath_lab(cath_lab)
      %Ecto.Changeset{source: %Cath_lab{}}

  """
  def change_cath_lab(%Cath_lab{} = cath_lab) do
    Cath_lab.changeset(cath_lab, %{})
  end

  ##########################
  def count_bloods(id) do
    Angio.Repo.one(
      from(
        blood in Cath_lab,
        select: count(blood.id),
        where: blood.info_coronary_id == ^id
      )
    )
  end
end
