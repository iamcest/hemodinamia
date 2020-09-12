defmodule Angio.Congenitals do
  @moduledoc """
  The Congenitals context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Congenitals.Chd_care_episode

  @doc """
  Returns the list of chd_care_episodes.

  ## Examples

      iex> list_chd_care_episodes()
      [%Chd_care_episode{}, ...]

  """
  def list_chd_care_episodes(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :chd_care_episodes))
    # Repo.all(Chd_care_episode)
  end

  @doc """
  Gets a single chd_care_episode.

  Raises `Ecto.NoResultsError` if the Chd care episode does not exist.

  ## Examples

      iex> get_chd_care_episode!(123)
      %Chd_care_episode{}

      iex> get_chd_care_episode!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chd_care_episode!(id), do: Repo.get!(Chd_care_episode, id)

  @doc """
  Creates a chd_care_episode.

  ## Examples

      iex> create_chd_care_episode(%{field: value})
      {:ok, %Chd_care_episode{}}

      iex> create_chd_care_episode(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chd_care_episode(attrs \\ %{}) do
    %Chd_care_episode{}
    |> Chd_care_episode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chd_care_episode.

  ## Examples

      iex> update_chd_care_episode(chd_care_episode, %{field: new_value})
      {:ok, %Chd_care_episode{}}

      iex> update_chd_care_episode(chd_care_episode, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chd_care_episode(%Chd_care_episode{} = chd_care_episode, attrs) do
    chd_care_episode
    |> Chd_care_episode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chd_care_episode.

  ## Examples

      iex> delete_chd_care_episode(chd_care_episode)
      {:ok, %Chd_care_episode{}}

      iex> delete_chd_care_episode(chd_care_episode)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chd_care_episode(%Chd_care_episode{} = chd_care_episode) do
    Repo.delete(chd_care_episode)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chd_care_episode changes.

  ## Examples

      iex> change_chd_care_episode(chd_care_episode)
      %Ecto.Changeset{source: %Chd_care_episode{}}

  """
  def change_chd_care_episode(%Chd_care_episode{} = chd_care_episode) do
    Chd_care_episode.changeset(chd_care_episode, %{})
  end

  def count_chd_episodes(id) do
    Angio.Repo.one(
      from(
        episode in Chd_care_episode,
        select: count(episode.id),
        where: episode.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Congenitals.Chd_condition

  @doc """
  Returns the list of chd_conditions.

  ## Examples

      iex> list_chd_conditions()
      [%Chd_condition{}, ...]

  """
  def list_chd_conditions(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :chd_conditions))
    # Repo.all(Chd_condition)
  end

  @doc """
  Gets a single chd_condition.

  Raises `Ecto.NoResultsError` if the Chd condition does not exist.

  ## Examples

      iex> get_chd_condition!(123)
      %Chd_condition{}

      iex> get_chd_condition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chd_condition!(id), do: Repo.get!(Chd_condition, id)

  @doc """
  Creates a chd_condition.

  ## Examples

      iex> create_chd_condition(%{field: value})
      {:ok, %Chd_condition{}}

      iex> create_chd_condition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chd_condition(attrs \\ %{}) do
    %Chd_condition{}
    |> Chd_condition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chd_condition.

  ## Examples

      iex> update_chd_condition(chd_condition, %{field: new_value})
      {:ok, %Chd_condition{}}

      iex> update_chd_condition(chd_condition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chd_condition(%Chd_condition{} = chd_condition, attrs) do
    chd_condition
    |> Chd_condition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chd_condition.

  ## Examples

      iex> delete_chd_condition(chd_condition)
      {:ok, %Chd_condition{}}

      iex> delete_chd_condition(chd_condition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chd_condition(%Chd_condition{} = chd_condition) do
    Repo.delete(chd_condition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chd_condition changes.

  ## Examples

      iex> change_chd_condition(chd_condition)
      %Ecto.Changeset{source: %Chd_condition{}}

  """
  def change_chd_condition(%Chd_condition{} = chd_condition) do
    Chd_condition.changeset(chd_condition, %{})
  end

  #########################
  def count_chd_conditions(id) do
    Angio.Repo.one(
      from(
        condition in Chd_condition,
        select: count(condition.id),
        where: condition.info_coronary_id == ^id
      )
    )
  end

  ##########################

  alias Angio.Congenitals.Chd_risk_factor

  @doc """
  Returns the list of chd_risk_factors.

  ## Examples

      iex> list_chd_risk_factors()
      [%Chd_risk_factor{}, ...]

  """
  def list_chd_risk_factors do
    Repo.all(Chd_risk_factor)
  end

  @doc """
  Gets a single chd_risk_factor.

  Raises `Ecto.NoResultsError` if the Chd risk factor does not exist.

  ## Examples

      iex> get_chd_risk_factor!(123)
      %Chd_risk_factor{}

      iex> get_chd_risk_factor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chd_risk_factor!(id), do: Repo.get!(Chd_risk_factor, id)

  @doc """
  Creates a chd_risk_factor.

  ## Examples

      iex> create_chd_risk_factor(%{field: value})
      {:ok, %Chd_risk_factor{}}

      iex> create_chd_risk_factor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chd_risk_factor(attrs \\ %{}) do
    %Chd_risk_factor{}
    |> Chd_risk_factor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chd_risk_factor.

  ## Examples

      iex> update_chd_risk_factor(chd_risk_factor, %{field: new_value})
      {:ok, %Chd_risk_factor{}}

      iex> update_chd_risk_factor(chd_risk_factor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chd_risk_factor(%Chd_risk_factor{} = chd_risk_factor, attrs) do
    chd_risk_factor
    |> Chd_risk_factor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chd_risk_factor.

  ## Examples

      iex> delete_chd_risk_factor(chd_risk_factor)
      {:ok, %Chd_risk_factor{}}

      iex> delete_chd_risk_factor(chd_risk_factor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chd_risk_factor(%Chd_risk_factor{} = chd_risk_factor) do
    Repo.delete(chd_risk_factor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chd_risk_factor changes.

  ## Examples

      iex> change_chd_risk_factor(chd_risk_factor)
      %Ecto.Changeset{source: %Chd_risk_factor{}}

  """
  def change_chd_risk_factor(%Chd_risk_factor{} = chd_risk_factor) do
    Chd_risk_factor.changeset(chd_risk_factor, %{})
  end

  def list_chd_risk_factors(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :chd_risk_factors))
    # Repo.all(Chd_care_episode)
  end

  def count_chd_risk_factors(id) do
    Angio.Repo.one(
      from(
        risk in Chd_risk_factor,
        select: count(risk.id),
        where: risk.info_coronary_id == ^id
      )
    )
  end
end
