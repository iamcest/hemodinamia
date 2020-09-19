defmodule Angio.Repo.Migrations.CreateDefsOptions do
  use Ecto.Migration

  def change do
    create table(:defs_options) do
      add(:name, :string)
      add(:code, :string)
      add(:selection_text, :text)
      add(:selection_definition, :text)
      add(:selection_notes, :text)
      add(:definition_id, references(:definitions, on_delete: :delete_all))

      timestamps()
    end
  end
end
