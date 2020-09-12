defmodule Angio.Repo.Migrations.AlterCorLesionsAddNotes do
  use Ecto.Migration

  def change do
    alter table(:cor_lesions) do
      add :cor_les_notes, :text
    end
  end
end
