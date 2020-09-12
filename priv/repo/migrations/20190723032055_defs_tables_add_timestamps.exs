defmodule Angio.Repo.Migrations.DefsTablesAddTimestamps do
  use Ecto.Migration

  def change do
    alter table(:defs_tables) do
      timestamps()
    end
  end
end
