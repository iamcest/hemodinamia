defmodule Angio.Canons.Language do
  use Ecto.Schema
  import Ecto.Query

  import Ecto.Changeset
  alias Angio.Canons.Language

  schema "languages" do
    field(:alpha2, :string)
    field(:english, :string)
  end

  #################
  @doc false
  def changeset(%Language{} = language, attrs) do
    language
    |> cast(attrs, [:alpha2, :english])
    |> validate_required([:alpha2, :english])
  end

  ####################
  def alphabetical(query) do
    from(c in query, order_by: c.english)
  end

  #################
  def names_and_codes(query) do
    from(c in query, select: {c.english, c.alpha2})
  end

  #############################
  def code_to_name_en(field) do
    query_a =
      from(
        d in Language,
        where: d.alpha2 == ^field,
        select: [d.english],
        order_by: [asc: d.english]
      )

    # res = Angio.Repo.one(query_a)
    Angio.Repo.one(query_a)
  end

  #########################
end
