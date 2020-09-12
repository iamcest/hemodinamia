defmodule Angio.Medcodes do
  @moduledoc """
  The Medcodes context.
  """

  import Ecto.Query, warn: false
  alias Angio.Repo

  alias Angio.Medcodes.Loinc

  @doc """
  Returns the list of loincs.

  ## Examples

      iex> list_loincs()
      [%Loinc{}, ...]

  """
  def list_loincs(params) do
    _page =
    Loinc
    |> Loinc.order_by_shortname()
    |> Repo.paginate(params)
    # Repo.all(Loinc)
  end

  @doc """
  Gets a single loinc.

  Raises `Ecto.NoResultsError` if the Loinc does not exist.

  ## Examples

      iex> get_loinc!(123)
      %Loinc{}

      iex> get_loinc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loinc!(id), do: Repo.get!(Loinc, id)

  @doc """
  Creates a loinc.

  ## Examples

      iex> create_loinc(%{field: value})
      {:ok, %Loinc{}}

      iex> create_loinc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loinc(attrs \\ %{}) do
    %Loinc{}
    |> Loinc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loinc.

  ## Examples

      iex> update_loinc(loinc, %{field: new_value})
      {:ok, %Loinc{}}

      iex> update_loinc(loinc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loinc(%Loinc{} = loinc, attrs) do
    loinc
    |> Loinc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loinc.

  ## Examples

      iex> delete_loinc(loinc)
      {:ok, %Loinc{}}

      iex> delete_loinc(loinc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loinc(%Loinc{} = loinc) do
    Repo.delete(loinc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loinc changes.

  ## Examples

      iex> change_loinc(loinc)
      %Ecto.Changeset{source: %Loinc{}}

  """
  def change_loinc(%Loinc{} = loinc) do
    Loinc.changeset(loinc, %{})
  end

  def search_loincs(query, selection) do
    case selection do
      "loinc_codes" -> search_loinc_codes(query)
      "tsv_search" ->  search_loinc_tsv(query)
      "tsv_long_name" -> search_tsv_long_name(query)
      _ -> ""
    end
  end
  def search_tsv_long_name(query) do
  _query =
    from( d in Loinc,
    where: ilike(d.long_common_name, ^"%#{query}%"),
    #where: fragment( "(?) @@ plainto`_tsquery(?)",  d.long_common_name, ^query),
    limit: 100,
    order_by: [asc:  d.long_common_name]
    )
  end
  def search_loinc_codes(query) do
 _query =
  from(
     p in Loinc,
         where: ilike(p.loinc_num, ^"#{query}%"),
          limit: 100,
         order_by: [asc: p.loinc_num]
)
  #Angio.Repo.all(query)
  end

  def search_loinc_tsv(query) do
    _query =
    from(
      d in Loinc,
      #where: fragment("ts_headline((?), (?), 'StartSel=<em>, StopSel=</em>' ", d.coding_instructions, ^query)
      where: fragment( "(?) @@ plainto_tsquery(?)",  d.tsv_search, ^query),
      #where: fragment( "(?) @@ plainto_tsquery(?)",  d.long_common_name, ^query),
      limit: 100,
      order_by:
      fragment(
        "ts_rank((to_tsvector('english', ?)
        || to_tsvector(coalesce('english', ?))),
          plainto_tsquery('english', ?)) DESC",
          d.long_common_name,
          d.shortname,
        ^query
      )
       )
  end

  def search_loinc_tsv_1(query) do
   sql = "SELECT ts_headline(long_common_name,q,'StartSel=<mark>,StopSel=</mark>,MaxWords=10,MinWords=5'),
   ts_rank_cd(tsv_search, q) as rank from loincs, plainto_tsquery('#{query}')  q
   WHERE tsv_search  @@  q ORDER By rank DESC;"

   {:ok, result} = Ecto.Adapters.SQL.query(Repo, sql, [])

   rows = result.rows
    #IO.puts("-----------columns -------------------------")
    #IO.inspect  columns

    IO.puts("-----------rows -------------------------")
    IO.inspect  rows

   {:ok, record} = Enum.map(result.rows, &Repo.load(Loinc, {result.rows, &1}))
  # list_record = List.last( record )

   IO.puts("------------map -------------------------")
   IO.inspect  record

   record



  end

###################

def count_loincs do
  Repo.aggregate(Loinc, :count, :id)
end



####################
  end
