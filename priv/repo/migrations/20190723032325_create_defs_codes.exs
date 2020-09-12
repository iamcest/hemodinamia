defmodule Angio.Repo.Migrations.CreateDefsCodes do
  use Ecto.Migration

  def change do
    create table(:defs_codes) do
      add :code, :string
      add :code_system, :string
      add :description, :text
      add :note, :text
      add :definition_id, references(:definitions, on_delete: :delete_all)
      timestamps()
    end
  end
end
