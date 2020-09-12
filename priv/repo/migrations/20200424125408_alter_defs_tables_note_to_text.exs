defmodule Angio.Repo.Migrations.AlterDefsTablesNoteToText do
  use Ecto.Migration

  def change do
    alter table(:defs_tables) do
      remove(:note)
      add(:defs_tables_notes, :text)
    end
  end
end
