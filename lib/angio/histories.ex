defmodule Angio.Histories do
  @moduledoc """
  The Histories context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Histories.Infect_history

  @doc """
  Returns the list of infect_histories.

  ## Examples

      iex> list_infect_histories()
      [%Infect_history{}, ...]

  """
  def list_infect_histories(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :infect_histories))
  end

  @doc """
  Gets a single infect_history.

  Raises `Ecto.NoResultsError` if the Infect history does not exist.

  ## Examples

      iex> get_infect_history!(123)
      %Infect_history{}

      iex> get_infect_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_infect_history!(id), do: Repo.get!(Infect_history, id)

  @doc """
  Creates a infect_history.

  ## Examples

      iex> create_infect_history(%{field: value})
      {:ok, %Infect_history{}}

      iex> create_infect_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_infect_history(attrs \\ %{}) do
    %Infect_history{}
    |> Infect_history.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a infect_history.

  ## Examples

      iex> update_infect_history(infect_history, %{field: new_value})
      {:ok, %Infect_history{}}

      iex> update_infect_history(infect_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_infect_history(%Infect_history{} = infect_history, attrs) do
    infect_history
    |> Infect_history.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Infect_history.

  ## Examples

      iex> delete_infect_history(infect_history)
      {:ok, %Infect_history{}}

      iex> delete_infect_history(infect_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_infect_history(%Infect_history{} = infect_history) do
    Repo.delete(infect_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking infect_history changes.

  ## Examples

      iex> change_infect_history(infect_history)
      %Ecto.Changeset{source: %Infect_history{}}

  """
  def change_infect_history(%Infect_history{} = infect_history) do
    Infect_history.changeset(infect_history, %{})
  end

  def count_infect_histories(id) do
    Angio.Repo.one(
      from(
        infh in Infect_history,
        select: count(infh.id),
        where: infh.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Histories.Core_history

  @doc """
  Returns the list of core_histories.

  ## Examples

      iex> list_core_histories()
      [%Core_history{}, ...]

  """
  def list_core_histories(conn) do
    # Repo.all(Core_history)
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :core_histories))
  end

  @doc """
  Gets a single core_history.

  Raises `Ecto.NoResultsError` if the Core history does not exist.

  ## Examples

      iex> get_core_history!(123)
      %Core_history{}

      iex> get_core_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_core_history!(id), do: Repo.get!(Core_history, id)

  @doc """
  Creates a core_history.

  ## Examples

      iex> create_core_history(%{field: value})
      {:ok, %Core_history{}}

      iex> create_core_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_core_history(attrs \\ %{}) do
    %Core_history{}
    |> Core_history.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a core_history.

  ## Examples

      iex> update_core_history(core_history, %{field: new_value})
      {:ok, %Core_history{}}

      iex> update_core_history(core_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_core_history(%Core_history{} = core_history, attrs) do
    core_history
    |> Core_history.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Core_history.

  ## Examples

      iex> delete_core_history(core_history)
      {:ok, %Core_history{}}

      iex> delete_core_history(core_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_core_history(%Core_history{} = core_history) do
    Repo.delete(core_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking core_history changes.

  ## Examples

      iex> change_core_history(core_history)
      %Ecto.Changeset{source: %Core_history{}}

  """
  def change_core_history(%Core_history{} = core_history) do
    Core_history.changeset(core_history, %{})
  end

  def count_core_histories(id) do
    Angio.Repo.one(
      from(
        coreh in Core_history,
        select: count(coreh.id),
        where: coreh.info_coronary_id == ^id
      )
    )
  end

  alias Angio.Histories.Social_history

  @doc """
  Returns the list of social_histories.

  ## Examples

      iex> list_social_histories()
      [%Social_history{}, ...]

  """
  def list_social_histories(conn) do
    # Repo.all(Social_history)
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :social_histories))
  end

  @doc """
  Gets a single social_history.

  Raises `Ecto.NoResultsError` if the Social history does not exist.

  ## Examples

      iex> get_social_history!(123)
      %Social_history{}

      iex> get_social_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_history!(id), do: Repo.get!(Social_history, id)

  @doc """
  Creates a social_history.

  ## Examples

      iex> create_social_history(%{field: value})
      {:ok, %Social_history{}}

      iex> create_social_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_history(attrs \\ %{}) do
    %Social_history{}
    |> Social_history.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_history.

  ## Examples

      iex> update_social_history(social_history, %{field: new_value})
      {:ok, %Social_history{}}

      iex> update_social_history(social_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_history(%Social_history{} = social_history, attrs) do
    social_history
    |> Social_history.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Social_history.

  ## Examples

      iex> delete_social_history(social_history)
      {:ok, %Social_history{}}

      iex> delete_social_history(social_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_history(%Social_history{} = social_history) do
    Repo.delete(social_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_history changes.

  ## Examples

      iex> change_social_history(social_history)
      %Ecto.Changeset{source: %Social_history{}}

  """
  def change_social_history(%Social_history{} = social_history) do
    Social_history.changeset(social_history, %{})
  end

  def count_social_histories(id) do
    Angio.Repo.one(
      from(
        socialh in Social_history,
        select: count(socialh.id),
        where: socialh.info_coronary_id == ^id
      )
    )
  end

  ####################

  alias Angio.Histories.Proc_history

  @doc """
  Returns the list of proc_histories.

  ## Examples

      iex> list_proc_histories()
      [%Proc_history{}, ...]

  """
  def list_proc_histories do
    Repo.all(Proc_history)
  end

  @doc """
  Gets a single proc_history.

  Raises `Ecto.NoResultsError` if the Proc history does not exist.

  ## Examples

      iex> get_proc_history!(123)
      %Proc_history{}

      iex> get_proc_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proc_history!(id), do: Repo.get!(Proc_history, id)

  @doc """
  Creates a proc_history.

  ## Examples

      iex> create_proc_history(%{field: value})
      {:ok, %Proc_history{}}

      iex> create_proc_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proc_history(attrs \\ %{}) do
    %Proc_history{}
    |> Proc_history.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proc_history.

  ## Examples

      iex> update_proc_history(proc_history, %{field: new_value})
      {:ok, %Proc_history{}}

      iex> update_proc_history(proc_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proc_history(%Proc_history{} = proc_history, attrs) do
    proc_history
    |> Proc_history.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Proc_history.

  ## Examples

      iex> delete_proc_history(proc_history)
      {:ok, %Proc_history{}}

      iex> delete_proc_history(proc_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proc_history(%Proc_history{} = proc_history) do
    Repo.delete(proc_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proc_history changes.

  ## Examples

      iex> change_proc_history(proc_history)
      %Ecto.Changeset{source: %Proc_history{}}

  """
  def change_proc_history(%Proc_history{} = proc_history) do
    Proc_history.changeset(proc_history, %{})
  end

  def list_proc_histories(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :proc_histories))
  end

  def count_proc_histories(id) do
    Angio.Repo.one(
      from(
        proch in Proc_history,
        select: count(proch.id),
        where: proch.info_coronary_id == ^id
      )
    )
  end
end
