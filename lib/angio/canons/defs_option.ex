defmodule Angio.Canons.Defs_option do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  # alias Angio.Canons.Definition

  schema "defs_options" do
    field(:code, :string)
    field(:definition_id, :integer)
    field(:name, :string)
    field(:selection_definition, :string)
    field(:selection_notes, :string)
    field(:selection_text, :string)

    # belongs_to(:definition, Angio.Canons.Definition, foreign_key: :definition_id)
    has_many(:opts_codes, Angio.Canons.Opts_code, foreign_key: :defs_option_id)
    has_many(:opts_sentences, Angio.Canons.Opts_sentence, foreign_key: :defs_option_id)
    timestamps()
  end

  @doc false
  def changeset(defs_option, attrs) do
    defs_option
    |> cast(attrs, [
      :name,
      :code,
      :selection_text,
      :selection_definition,
      :selection_notes
    ])
    |> validate_required([])

    # |> order_by_code()
  end

  def order_by_code(query) do
    _results = from(q in query, order_by: [desc: q.code])
  end
end
