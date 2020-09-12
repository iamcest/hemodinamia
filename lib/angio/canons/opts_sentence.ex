defmodule Angio.Canons.Opts_sentence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opts_sentences" do
    field(:definition_id, :integer)
    field(:language, :string)
    field(:note, :string)
    field(:sentence, :string)
    field(:defs_option_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(opts_sentence, attrs) do
    opts_sentence
    |> cast(attrs, [:language, :sentence, :note, :definition_id])
    # |> validate_required([:language, :sentence, :note, :definition_id])
    |> validate_required([])
  end
end
