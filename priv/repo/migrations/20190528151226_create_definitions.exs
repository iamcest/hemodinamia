defmodule Angio.Repo.Migrations.CreateDefinitions do
  use Ecto.Migration

  def change do
    create table(:definitions) do
      add :definition_id, :integer
      add :table_name, :string
      add :name, :string
      add :coding_instructions, :string
      add :target_value, :string
      add :support_definition, :string
      add :notes, :string
      add :ref, :string
      add :vocabulary_en, :string
      add :title_name, :string
      add :short_name, :string
      add :default_value, :string
      add :usual_range, :string
      add :valid_range, :string
      add :data_source, :string
      add :defs_table_id, :integer

      timestamps()
    end
  end
end
