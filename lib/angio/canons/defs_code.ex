defmodule Angio.Canons.Defs_code do
  use Ecto.Schema
  import Ecto.Changeset

  schema "defs_codes" do
    field(:code, :string)
    field(:code_system, :string)
    field(:definition_id, :integer)
    field(:description, :string)
    field(:note, :string)

    timestamps()
  end

  @doc false
  def changeset(defs_code, attrs) do
    defs_code
    |> cast(attrs, [:code_system, :code, :description, :note, :definition_id])
    |> validate_required([])

    #    |> validate_required([:code_system, :code, :description, :note, :definition_id])
  end

  ##########
  #
end
