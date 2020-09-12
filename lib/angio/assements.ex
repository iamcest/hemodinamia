defmodule Angio.Assements do
  @moduledoc """
  The Assements context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Assements.Vital_sign

  @doc """
  Returns the list of vital_signs.

  ## Examples

      iex> list_vital_signs()
      [%Vital_sign{}, ...]

  """
  def list_vital_signs(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :vital_signs))

    # Repo.all(Vital_sign)
  end

  @doc """
  Gets a single vital_sign.

  Raises `Ecto.NoResultsError` if the Vital sign does not exist.

  ## Examples

      iex> get_vital_sign!(123)
      %Vital_sign{}

      iex> get_vital_sign!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vital_sign!(id), do: Repo.get!(Vital_sign, id)

  @doc """
  Creates a vital_sign.

  ## Examples

      iex> create_vital_sign(%{field: value})
      {:ok, %Vital_sign{}}

      iex> create_vital_sign(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vital_sign(attrs \\ %{}) do
    %Vital_sign{}
    |> Vital_sign.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vital_sign.

  ## Examples

      iex> update_vital_sign(vital_sign, %{field: new_value})
      {:ok, %Vital_sign{}}

      iex> update_vital_sign(vital_sign, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vital_sign(%Vital_sign{} = vital_sign, attrs) do
    vital_sign
    |> Vital_sign.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Vital_sign.

  ## Examples

      iex> delete_vital_sign(vital_sign)
      {:ok, %Vital_sign{}}

      iex> delete_vital_sign(vital_sign)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vital_sign(%Vital_sign{} = vital_sign) do
    Repo.delete(vital_sign)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vital_sign changes.

  ## Examples

      iex> change_vital_sign(vital_sign)
      %Ecto.Changeset{source: %Vital_sign{}}

  """
  def change_vital_sign(%Vital_sign{} = vital_sign) do
    Vital_sign.changeset(vital_sign, %{})
  end

  #########################
  def count_vitals(id) do
    Angio.Repo.one(
      from(
        vital in Vital_sign,
        select: count(vital.id),
        where: vital.info_coronary_id == ^id
      )
    )
  end

  ######################

  alias Angio.Assements.Functional_state

  @doc """
  Returns the list of functional_states.

  ## Examples

      iex> list_functional_states()
      [%Functional_state{}, ...]

  """
  def list_functional_states do
    Repo.all(Functional_state)
  end

  @doc """
  Gets a single functional_state.

  Raises `Ecto.NoResultsError` if the Functional state does not exist.

  ## Examples

      iex> get_functional_state!(123)
      %Functional_state{}

      iex> get_functional_state!(456)
      ** (Ecto.NoResultsError)

  """
  def get_functional_state!(id), do: Repo.get!(Functional_state, id)

  @doc """
  Creates a functional_state.

  ## Examples

      iex> create_functional_state(%{field: value})
      {:ok, %Functional_state{}}

      iex> create_functional_state(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_functional_state(attrs \\ %{}) do
    %Functional_state{}
    |> Functional_state.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a functional_state.

  ## Examples

      iex> update_functional_state(functional_state, %{field: new_value})
      {:ok, %Functional_state{}}

      iex> update_functional_state(functional_state, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_functional_state(%Functional_state{} = functional_state, attrs) do
    functional_state
    |> Functional_state.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Functional_state.

  ## Examples

      iex> delete_functional_state(functional_state)
      {:ok, %Functional_state{}}

      iex> delete_functional_state(functional_state)
      {:error, %Ecto.Changeset{}}

  """
  def delete_functional_state(%Functional_state{} = functional_state) do
    Repo.delete(functional_state)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking functional_state changes.

  ## Examples

      iex> change_functional_state(functional_state)
      %Ecto.Changeset{source: %Functional_state{}}

  """
  def change_functional_state(%Functional_state{} = functional_state) do
    Functional_state.changeset(functional_state, %{})
  end

  def list_functional_states(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :functional_states))

    # Repo.all(Vital_sign)
  end

  #########################
  def count_functional_states(id) do
    Angio.Repo.one(
      from(
        funs in Functional_state,
        select: count(funs.id),
        where: funs.info_coronary_id == ^id
      )
    )
  end

  ######################

  alias Angio.Assements.Clinical_exam_cardio

  @doc """
  Returns the list of clinical_exams_cardios.

  ## Examples

      iex> list_clinical_exams_cardios()
      [%Clinical_exam_cardio{}, ...]

  """
  def list_clinical_exams_cardios do
    Repo.all(Clinical_exam_cardio)
  end

  @doc """
  Gets a single clinical_exam_cardio.

  Raises `Ecto.NoResultsError` if the Clinical exam cardio does not exist.

  ## Examples

      iex> get_clinical_exam_cardio!(123)
      %Clinical_exam_cardio{}

      iex> get_clinical_exam_cardio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clinical_exam_cardio!(id), do: Repo.get!(Clinical_exam_cardio, id)

  @doc """
  Creates a clinical_exam_cardio.

  ## Examples

      iex> create_clinical_exam_cardio(%{field: value})
      {:ok, %Clinical_exam_cardio{}}

      iex> create_clinical_exam_cardio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clinical_exam_cardio(attrs \\ %{}) do
    %Clinical_exam_cardio{}
    |> Clinical_exam_cardio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clinical_exam_cardio.

  ## Examples

      iex> update_clinical_exam_cardio(clinical_exam_cardio, %{field: new_value})
      {:ok, %Clinical_exam_cardio{}}

      iex> update_clinical_exam_cardio(clinical_exam_cardio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clinical_exam_cardio(%Clinical_exam_cardio{} = clinical_exam_cardio, attrs) do
    clinical_exam_cardio
    |> Clinical_exam_cardio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Clinical_exam_cardio.

  ## Examples

      iex> delete_clinical_exam_cardio(clinical_exam_cardio)
      {:ok, %Clinical_exam_cardio{}}

      iex> delete_clinical_exam_cardio(clinical_exam_cardio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clinical_exam_cardio(%Clinical_exam_cardio{} = clinical_exam_cardio) do
    Repo.delete(clinical_exam_cardio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clinical_exam_cardio changes.

  ## Examples

      iex> change_clinical_exam_cardio(clinical_exam_cardio)
      %Ecto.Changeset{source: %Clinical_exam_cardio{}}

  """
  def change_clinical_exam_cardio(%Clinical_exam_cardio{} = clinical_exam_cardio) do
    Clinical_exam_cardio.changeset(clinical_exam_cardio, %{})
  end

  #######################################

  #########################
  def count_clinical_exams_cardio(id) do
    Angio.Repo.one(
      from(
        cardio in Clinical_exam_cardio,
        select: count(cardio.id),
        where: cardio.info_coronary_id == ^id
      )
    )
  end

  ######################
  def list_clinical_exams_cardio(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :clinical_exams_cardios))

    # Repo.all(Vital_sign)
  end

  #######################################
end
