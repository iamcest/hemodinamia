defmodule Angio.Repo.Migrations.CreateOptsCodes do
  use Ecto.Migration

  def change do
    create table(:opts_codes) do
      add :code_system, :string
      add :code, :string
      add :description, :text
      add :notes, :text
      add :definition_id, :integer
      add :defs_option_id, :integer

      timestamps()
    end
  end
end
