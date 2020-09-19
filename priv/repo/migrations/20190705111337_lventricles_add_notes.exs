defmodule Angio.Repo.Migrations.LventriclesAddNotes do
  use Ecto.Migration

  def change do
    alter table(:lventricles) do
      add(:cath_lv_notes, :text)
    end
  end
end
