defmodule Angio.Canons.Defs_sentence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "defs_sentences" do
    field(:definition_id, :integer)
    field(:language, :string)
    field(:note, :string)
    field(:sentence, :string)

    timestamps()
  end

  def changeset(defs_sentence, attrs) do
    defs_sentence
    |> cast(attrs, [:language, :sentence, :note, :definition_id])
    |> validate_required([])
    |> unique_constraint(:language,
      name: :defs_sentences_language_definition_id_index,
      message: "Error: Only One sentence per language in defs_sentence"
    )
  end
end
