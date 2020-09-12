defmodule Angio.Repo.Migrations.TableDefinitionsAlterCol2text do
  use Ecto.Migration

  def change do
    alter table(:definitions) do
      modify :target_value, :text
      modify :coding_instructions, :text
      modify :support_definition, :text
      modify :notes, :text
    end
  end
end
