defmodule Angio.Repo.Migrations.AlterDefinitionsAddMulti do
  use Ecto.Migration

  def change do
    alter table(:definitions) do
      add :defs_table_id_multi, {:array, :integer}
      modify :target_value, :text
    end

    execute "
   CREATE UNIQUE INDEX idx_unique_name
    ON definitions(name);"
  end
end
