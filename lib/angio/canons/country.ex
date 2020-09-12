defmodule Angio.Canons.Country do
  use Ecto.Schema
  import Ecto.Query

  import Ecto.Changeset
  alias Angio.Canons.Country

  schema "countries" do
    field(:value_id, :string)
    field(:value, :string)
  end

  ##################
  @doc false
  def changeset(%Country{} = country, attrs) do
    country
    |> cast(attrs, [:value_id, :value])
    |> validate_required([:value_id, :value])
  end

  ####################
  def alphabetical(query) do
    from(c in query, order_by: c.value)
  end

  #################
  def names_and_codes(query) do
    from(c in query, select: {c.value, c.value_id})
  end

  #############################
  def code_to_name_en(field) do
    query_a =
      from(
        d in Country,
        where: d.value_id == ^field,
        select: [d.value],
        order_by: [asc: d.value]
      )

    # res = Angio.Repo.one(query_a)
    Angio.Repo.one(query_a)
  end

  #########################
end
