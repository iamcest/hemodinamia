defmodule Angio.Repo.Migrations.AlterTableDefSencenceAddLamgConstrain do
  use Ecto.Migration

  def change do
    create(unique_index(:defs_sentences, [:language, :definition_id]))
  end
end
