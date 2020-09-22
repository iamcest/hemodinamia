defmodule Angio.Ivestigations do
  @moduledoc """
  The Ivestigations context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Ivestigations.Treadmill_exercise

  @doc """
  Returns the list of treadmill_exercises.

  ## Examples

      iex> list_treadmill_exercises()
      [%Treadmill_exercise{}, ...]

  """

  # def list_treadmill_exercises do
  #  Repo.all(Treadmill_exercise)
  # end

  @doc """
  Gets a single treadmill_exercise.

  Raises `Ecto.NoResultsError` if the Treadmill exercise does not exist.

  ## Examples

      iex> get_treadmill_exercise!(123)
      %Treadmill_exercise{}

      iex> get_treadmill_exercise!(456)
      ** (Ecto.NoResultsError)

  """
  def get_treadmill_exercise!(id), do: Repo.get!(Treadmill_exercise, id)

  @doc """
  Creates a treadmill_exercise.

  ## Examples

      iex> create_treadmill_exercise(%{field: value})
      {:ok, %Treadmill_exercise{}}

      iex> create_treadmill_exercise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_treadmill_exercise(attrs \\ %{}) do
    %Treadmill_exercise{}
    |> Treadmill_exercise.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a treadmill_exercise.

  ## Examples

      iex> update_treadmill_exercise(treadmill_exercise, %{field: new_value})
      {:ok, %Treadmill_exercise{}}

      iex> update_treadmill_exercise(treadmill_exercise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_treadmill_exercise(%Treadmill_exercise{} = treadmill_exercise, attrs) do
    treadmill_exercise
    |> Treadmill_exercise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a treadmill_exercise.

  ## Examples

      iex> delete_treadmill_exercise(treadmill_exercise)
      {:ok, %Treadmill_exercise{}}

      iex> delete_treadmill_exercise(treadmill_exercise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_treadmill_exercise(%Treadmill_exercise{} = treadmill_exercise) do
    Repo.delete(treadmill_exercise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking treadmill_exercise changes.

  ## Examples

      iex> change_treadmill_exercise(treadmill_exercise)
      %Ecto.Changeset{source: %Treadmill_exercise{}}

  """
  def change_treadmill_exercise(%Treadmill_exercise{} = treadmill_exercise) do
    Treadmill_exercise.changeset(treadmill_exercise, %{})
  end

  def list_treadmill_exercises(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:patient], :treadmill_exercises))
    # Repo.all(Contact)
  end

  def count_treadmill_exercises(id) do
    Angio.Repo.one(
      from(
        ext in Treadmill_exercise,
        select: count(ext.id),
        where: ext.patient_id == ^id
      )
    )
  end

  alias Angio.Ivestigations.Cardiac_echo

  @doc """
  Returns the list of cardiac_echoes.

  ## Examples

      iex> list_cardiac_echoes()
      [%Cardiac_echo{}, ...]

  """
  def list_cardiac_echoes do
    Repo.all(Cardiac_echo)
  end

  def list_cardiac_echoes(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:patient], :cardiac_echoes))
    # Repo.all(Contact)
  end

  @doc """
  Gets a single cardiac_echo.

  Raises `Ecto.NoResultsError` if the Cardiac echo does not exist.

  ## Examples

      iex> get_cardiac_echo!(123)
      %Cardiac_echo{}

      iex> get_cardiac_echo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cardiac_echo!(id), do: Repo.get!(Cardiac_echo, id)

  @doc """
  Creates a cardiac_echo.

  ## Examples

      iex> create_cardiac_echo(%{field: value})
      {:ok, %Cardiac_echo{}}

      iex> create_cardiac_echo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cardiac_echo(attrs \\ %{}) do
    %Cardiac_echo{}
    |> Cardiac_echo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cardiac_echo.

  ## Examples

      iex> update_cardiac_echo(cardiac_echo, %{field: new_value})
      {:ok, %Cardiac_echo{}}

      iex> update_cardiac_echo(cardiac_echo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cardiac_echo(%Cardiac_echo{} = cardiac_echo, attrs) do
    cardiac_echo
    |> Cardiac_echo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cardiac_echo.

  ## Examples

      iex> delete_cardiac_echo(cardiac_echo)
      {:ok, %Cardiac_echo{}}

      iex> delete_cardiac_echo(cardiac_echo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cardiac_echo(%Cardiac_echo{} = cardiac_echo) do
    Repo.delete(cardiac_echo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cardiac_echo changes.

  ## Examples

      iex> change_cardiac_echo(cardiac_echo)
      %Ecto.Changeset{source: %Cardiac_echo{}}

  """
  def change_cardiac_echo(%Cardiac_echo{} = cardiac_echo) do
    Cardiac_echo.changeset(cardiac_echo, %{})
  end

  def count_cardiac_echoes(id) do
    Angio.Repo.one(
      from(
        echo in Cardiac_echo,
        select: count(echo.id),
        where: echo.patient_id == ^id
      )
    )
  end

  alias Angio.Ivestigations.Echo_left_atrium

  @doc """
  Returns the list of echo_left_atriums.

  ## Examples

      iex> list_echo_left_atriums()
      [%Echo_left_atrium{}, ...]

  """
  def list_echo_left_atriums(conn) do
    # Repo.all(Echo_left_atrium)
    Repo.all(Ecto.assoc(conn.assigns[:cardiac_echo], :echo_left_atriums))
  end

  @doc """
  Gets a single echo_left_atrium.

  Raises `Ecto.NoResultsError` if the Echo left atrium does not exist.

  ## Examples

      iex> get_echo_left_atrium!(123)
      %Echo_left_atrium{}

      iex> get_echo_left_atrium!(456)
      ** (Ecto.NoResultsError)

  """
  def get_echo_left_atrium!(id), do: Repo.get!(Echo_left_atrium, id)

  @doc """
  Creates a echo_left_atrium.

  ## Examples

      iex> create_echo_left_atrium(%{field: value})
      {:ok, %Echo_left_atrium{}}

      iex> create_echo_left_atrium(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_echo_left_atrium(attrs \\ %{}) do
    %Echo_left_atrium{}
    |> Echo_left_atrium.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a echo_left_atrium.

  ## Examples

      iex> update_echo_left_atrium(echo_left_atrium, %{field: new_value})
      {:ok, %Echo_left_atrium{}}

      iex> update_echo_left_atrium(echo_left_atrium, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_echo_left_atrium(%Echo_left_atrium{} = echo_left_atrium, attrs) do
    echo_left_atrium
    |> Echo_left_atrium.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a echo_left_atrium.

  ## Examples

      iex> delete_echo_left_atrium(echo_left_atrium)
      {:ok, %Echo_left_atrium{}}

      iex> delete_echo_left_atrium(echo_left_atrium)
      {:error, %Ecto.Changeset{}}

  """
  def delete_echo_left_atrium(%Echo_left_atrium{} = echo_left_atrium) do
    Repo.delete(echo_left_atrium)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking echo_left_atrium changes.

  ## Examples

      iex> change_echo_left_atrium(echo_left_atrium)
      %Ecto.Changeset{source: %Echo_left_atrium{}}

  """
  def change_echo_left_atrium(%Echo_left_atrium{} = echo_left_atrium) do
    Echo_left_atrium.changeset(echo_left_atrium, %{})
  end

  def count_echo_left_atriums(id) do
    Angio.Repo.one(
      from(
        echo_la in Echo_left_atrium,
        select: count(echo_la.id),
        where: echo_la.cardiac_echo_id == ^id
      )
    )
  end

  alias Angio.Ivestigations.Echo_right_atrium

  @doc """
  Returns the list of echo_right_atriums.

  ## Examples

      iex> list_echo_right_atriums()
      [%Echo_right_atrium{}, ...]

  """
  def list_echo_right_atriums(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:cardiac_echo], :echo_right_atriums))
    # Repo.all(Echo_right_atrium)
  end

  @doc """
  Gets a single echo_right_atrium.

  Raises `Ecto.NoResultsError` if the Echo right atrium does not exist.

  ## Examples

      iex> get_echo_right_atrium!(123)
      %Echo_right_atrium{}

      iex> get_echo_right_atrium!(456)
      ** (Ecto.NoResultsError)

  """
  def get_echo_right_atrium!(id), do: Repo.get!(Echo_right_atrium, id)

  @doc """
  Creates a echo_right_atrium.

  ## Examples

      iex> create_echo_right_atrium(%{field: value})
      {:ok, %Echo_right_atrium{}}

      iex> create_echo_right_atrium(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_echo_right_atrium(attrs \\ %{}) do
    %Echo_right_atrium{}
    |> Echo_right_atrium.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a echo_right_atrium.

  ## Examples

      iex> update_echo_right_atrium(echo_right_atrium, %{field: new_value})
      {:ok, %Echo_right_atrium{}}

      iex> update_echo_right_atrium(echo_right_atrium, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_echo_right_atrium(%Echo_right_atrium{} = echo_right_atrium, attrs) do
    echo_right_atrium
    |> Echo_right_atrium.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a echo_right_atrium.

  ## Examples

      iex> delete_echo_right_atrium(echo_right_atrium)
      {:ok, %Echo_right_atrium{}}

      iex> delete_echo_right_atrium(echo_right_atrium)
      {:error, %Ecto.Changeset{}}

  """
  def delete_echo_right_atrium(%Echo_right_atrium{} = echo_right_atrium) do
    Repo.delete(echo_right_atrium)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking echo_right_atrium changes.

  ## Examples

      iex> change_echo_right_atrium(echo_right_atrium)
      %Ecto.Changeset{source: %Echo_right_atrium{}}

  """
  def change_echo_right_atrium(%Echo_right_atrium{} = echo_right_atrium) do
    Echo_right_atrium.changeset(echo_right_atrium, %{})
  end

  def count_echo_right_atriums(id) do
    Angio.Repo.one(
      from(
        echo_ra in Echo_right_atrium,
        select: count(echo_ra.id),
        where: echo_ra.cardiac_echo_id == ^id
      )
    )
  end

  alias Angio.Ivestigations.Echo_ventricle_left

  @doc """
  Returns the list of echo_ventricle_lefts.

  ## Examples

      iex> list_echo_ventricle_lefts()
      [%Echo_ventricle_left{}, ...]

  """
  def list_echo_ventricle_lefts(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:cardiac_echo], :echo_ventricle_lefts))
    # Repo.all(Ecto.assoc(conn.assigns[:cardiac_echo], :echo_right_atriums))
    # Repo.all(Echo_ventricle_left)
  end

  @doc """
  Gets a single echo_ventricle_left.

  Raises `Ecto.NoResultsError` if the Echo ventricle left does not exist.

  ## Examples

      iex> get_echo_ventricle_left!(123)
      %Echo_ventricle_left{}

      iex> get_echo_ventricle_left!(456)
      ** (Ecto.NoResultsError)

  """
  def get_echo_ventricle_left!(id), do: Repo.get!(Echo_ventricle_left, id)

  @doc """
  Creates a echo_ventricle_left.

  ## Examples

      iex> create_echo_ventricle_left(%{field: value})
      {:ok, %Echo_ventricle_left{}}

      iex> create_echo_ventricle_left(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_echo_ventricle_left(attrs \\ %{}) do
    %Echo_ventricle_left{}
    |> Echo_ventricle_left.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a echo_ventricle_left.

  ## Examples

      iex> update_echo_ventricle_left(echo_ventricle_left, %{field: new_value})
      {:ok, %Echo_ventricle_left{}}

      iex> update_echo_ventricle_left(echo_ventricle_left, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_echo_ventricle_left(%Echo_ventricle_left{} = echo_ventricle_left, attrs) do
    echo_ventricle_left
    |> Echo_ventricle_left.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a echo_ventricle_left.

  ## Examples

      iex> delete_echo_ventricle_left(echo_ventricle_left)
      {:ok, %Echo_ventricle_left{}}

      iex> delete_echo_ventricle_left(echo_ventricle_left)
      {:error, %Ecto.Changeset{}}

  """
  def delete_echo_ventricle_left(%Echo_ventricle_left{} = echo_ventricle_left) do
    Repo.delete(echo_ventricle_left)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking echo_ventricle_left changes.

  ## Examples

      iex> change_echo_ventricle_left(echo_ventricle_left)
      %Ecto.Changeset{source: %Echo_ventricle_left{}}

  """
  def change_echo_ventricle_left(%Echo_ventricle_left{} = echo_ventricle_left) do
    Echo_ventricle_left.changeset(echo_ventricle_left, %{})
  end

  def count_echo_ventricle_lefts(id) do
    Angio.Repo.one(
      from(
        echo_lv in Echo_ventricle_left,
        select: count(echo_lv.id),
        where: echo_lv.cardiac_echo_id == ^id
      )
    )
  end

  alias Angio.Ivestigations.Echo_ventricle_left_systolic_func

  @doc """
  Returns the list of echo_ventricle_left_systolic_funcs.

  ## Examples

      iex> list_echo_ventricle_left_systolic_funcs()
      [%Echo_ventricle_left_systolic_func{}, ...]

  """
  def list_echo_ventricle_left_systolic_funcs do
    Repo.all(Echo_ventricle_left_systolic_func)
  end


  def list_echo_ventricle_left_systolic_funcs(conn) do
    #Repo.all(Echo_ventricle_left_systolic_func)
    Repo.all(Ecto.assoc(conn.assigns[:cardiac_echo], :echo_ventricle_left_systolic_funcs))
  end
  @doc """
  Gets a single echo_ventricle_left_systolic_func.

  Raises `Ecto.NoResultsError` if the Echo ventricle left systolic func does not exist.

  ## Examples

      iex> get_echo_ventricle_left_systolic_func!(123)
      %Echo_ventricle_left_systolic_func{}

      iex> get_echo_ventricle_left_systolic_func!(456)
      ** (Ecto.NoResultsError)

  """
  def get_echo_ventricle_left_systolic_func!(id), do: Repo.get!(Echo_ventricle_left_systolic_func, id)

  @doc """
  Creates a echo_ventricle_left_systolic_func.

  ## Examples

      iex> create_echo_ventricle_left_systolic_func(%{field: value})
      {:ok, %Echo_ventricle_left_systolic_func{}}

      iex> create_echo_ventricle_left_systolic_func(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_echo_ventricle_left_systolic_func(attrs \\ %{}) do
    %Echo_ventricle_left_systolic_func{}
    |> Echo_ventricle_left_systolic_func.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a echo_ventricle_left_systolic_func.

  ## Examples

      iex> update_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func, %{field: new_value})
      {:ok, %Echo_ventricle_left_systolic_func{}}

      iex> update_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_echo_ventricle_left_systolic_func(%Echo_ventricle_left_systolic_func{} = echo_ventricle_left_systolic_func, attrs) do
    echo_ventricle_left_systolic_func
    |> Echo_ventricle_left_systolic_func.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a echo_ventricle_left_systolic_func.

  ## Examples

      iex> delete_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)
      {:ok, %Echo_ventricle_left_systolic_func{}}

      iex> delete_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)
      {:error, %Ecto.Changeset{}}

  """
  def delete_echo_ventricle_left_systolic_func(%Echo_ventricle_left_systolic_func{} = echo_ventricle_left_systolic_func) do
    Repo.delete(echo_ventricle_left_systolic_func)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking echo_ventricle_left_systolic_func changes.

  ## Examples

      iex> change_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)
      %Ecto.Changeset{source: %Echo_ventricle_left_systolic_func{}}

  """
  def change_echo_ventricle_left_systolic_func(%Echo_ventricle_left_systolic_func{} = echo_ventricle_left_systolic_func) do
    Echo_ventricle_left_systolic_func.changeset(echo_ventricle_left_systolic_func, %{})
  end
  def count_echo_ventricle_left_systolic_funcs(id) do
    Angio.Repo.one(
      from(
        echo_lv in Echo_ventricle_left_systolic_func,
        select: count(echo_lv.id),
        where: echo_lv.cardiac_echo_id == ^id
      )
    )
  end


end
