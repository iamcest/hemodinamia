defmodule Angio.Canons.Definition do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "definitions" do
    field(:coding_instructions, :string)
    field(:data_source, :string)
    field(:default_value, :string)
    field(:definition_id, :integer)
    field(:defs_table_id, :integer)
    field(:name, :string)
    field(:notes, :string)
    field(:ref, :string)
    field(:short_name, :string)
    field(:support_definition, :string)
    field(:table_name, :string)
    field(:target_value, :string)
    field(:title_name, :string)
    field(:usual_range, :string)
    field(:valid_range, :string)
    field(:vocabulary_en, :string)
    field(:used_yn, :boolean)
    field(:upper_value, :string)
    field(:low_value, :string)

    timestamps()
    has_many(:defs_sentences, Angio.Canons.Defs_sentence, foreign_key: :definition_id)
    has_many(:defs_codes, Angio.Canons.Defs_code, foreign_key: :definition_id)

    has_many(:defs_options, Angio.Canons.Defs_option, foreign_key: :definition_id)
  end

  @doc false

  def changeset(definition, attrs) do
    definition
    |> cast(attrs, [
      :definition_id,
      :table_name,
      :name,
      :coding_instructions,
      :target_value,
      :short_name,
      :support_definition,
      :notes,
      :ref,
      :vocabulary_en,
      :title_name,
      :short_name,
      :default_value,
      :usual_range,
      :valid_range,
      :data_source,
      :defs_table_id,
      :used_yn,
      :upper_value,
      :low_value
    ])
    |> validate_required([])
    |> unique_constraint(:name,
      name: :definitions_name_index,
      message: "Error:  Dublicate Field Name in table definitions"
    )
  end

  def order_by_name(query) do
    _query = from(c in query, order_by: c.name)
  end

  #################
end
