defmodule Angio.Repo.Migrations.AlterCathLabsAddNotes do
  use Ecto.Migration

  def change do
    alter table(:cath_labs) do
      add(:cath_lab_notes, :text)
    end
  end
end
