defmodule Angio.Canons.Opts_code do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opts_codes" do
    field(:code, :string)
    field(:code_system, :string)
    field(:definition_id, :integer)
    field(:defs_option_id, :integer)
    field(:description, :string)
    field(:notes, :string)

    timestamps()
  end

  @doc false
  def changeset(opts_code, attrs) do
    opts_code
    |> cast(attrs, [:code_system, :code, :description, :notes, :definition_id, :defs_option_id])
    |> validate_required([])
  end
end
