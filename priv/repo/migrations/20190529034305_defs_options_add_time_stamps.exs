defmodule Angio.Repo.Migrations.DefsOptionsAddTimeStamps do
  use Ecto.Migration

  def change do
    alter table(:defs_sentences) do
      timestamps()
    end
  end
end
