defmodule Angio.Cor_mediae do
  @moduledoc """
  The Cor_mediae context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Cor_mediae.Cor_media

  @doc """
  Returns the list of cor_mediae.

  ## Examples

      iex> list_cor_mediae()
      [%Cor_media{}, ...]

  """
  def list_cor_mediae(conn) do
    Repo.all(Ecto.assoc(conn.assigns[:info_coronary], :cor_mediae))
    # Repo.all(Cor_media)
  end

  @doc """
  Gets a single cor_media.

  Raises `Ecto.NoResultsError` if the Cor media does not exist.

  ## Examples

      iex> get_cor_media!(123)
      %Cor_media{}

      iex> get_cor_media!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cor_media!(id), do: Repo.get!(Cor_media, id)

  @doc """
  Creates a cor_media.

  ## Examples

      iex> create_cor_media(%{field: value})
      {:ok, %Cor_media{}}

      iex> create_cor_media(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cor_media(attrs \\ %{}) do
    %Cor_media{}
    |> Cor_media.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cor_media.

  ## Examples

      iex> update_cor_media(cor_media, %{field: new_value})
      {:ok, %Cor_media{}}

      iex> update_cor_media(cor_media, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cor_media(%Cor_media{} = cor_media, attrs) do
    cor_media
    |> Cor_media.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cor_media.

  ## Examples

      iex> delete_cor_media(cor_media)
      {:ok, %Cor_media{}}

      iex> delete_cor_media(cor_media)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cor_media(%Cor_media{} = cor_media) do
    Repo.delete(cor_media)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cor_media changes.

  ## Examples

      iex> change_cor_media(cor_media)
      %Ecto.Changeset{source: %Cor_media{}}

  """
  def change_cor_media(%Cor_media{} = cor_media) do
    Cor_media.changeset(cor_media, %{})
  end

  def count_media(id) do
    Angio.Repo.one(
      from(
        media in Cor_media,
        select: count(media.id),
        where: media.info_coronary_id == ^id
      )
    )
  end
end
