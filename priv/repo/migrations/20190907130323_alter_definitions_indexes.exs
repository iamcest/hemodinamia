defmodule Angio.Repo.Migrations.AlterDefinitionsIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:definitions, [:name])
    execute "
    DROP INDEX idx_unique_name
    "
  end
end
