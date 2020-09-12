defmodule Angio.Canons.Defs_table do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Angio.Canons.Definition, as: Definition
  alias Angio.Canons.Defs_table

  # alias Angio.Repo

  schema "defs_tables" do
    field(:cda_xml, :string)
    field(:code, :string)
    field(:code_system, :string)
    field(:code_system_name, :string)
    field(:display_name, :string)
    field(:name, :string)
    field(:defs_tables_notes, :string)
    field(:template_id, :string)
    timestamps()
    has_many(:definitions, Definition, foreign_key: :defs_table_id)
    # many_to_many :definitions, Definition, join_through: "relation_defs_tables"
  end

  @doc false
  def changeset(defs_table, attrs) do
    defs_table
    |> cast(attrs, [
      :cda_xml,
      :code,
      :code_system,
      :code_system_name,
      :display_name,
      :name,
      :defs_tables_notes,
      :template_id
    ])
    |> validate_required([:name])

    # |> validate_required([:cda_xml, :code, :code_system, :code_system_name, :display_name, :name, :note, :template_id])
  end

  def alphabetical(query) do
    from(c in query, order_by: c.name)
  end

  def names_and_ids(query) do
    from(c in query, select: {c.name, c.id})
  end

  def id_to_name(defs_table_id) do
    Angio.Repo.one(from(t in Defs_table, where: t.id == ^defs_table_id, select: t.name))
  end

  def count_definitions(query) do
    from(
      p in query,
      group_by: p.id,
      left_join: c in assoc(p, :definitions),
      select: {p, count(c.id)}
    )
  end

  ##################
end
