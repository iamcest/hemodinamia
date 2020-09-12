defmodule Angio.Repo.Migrations.AlterCoarcRemoveCoarcNotes do
  use Ecto.Migration

  def change do
 alter table(:coarc_procedures) do
  remove(:"coarc_notes,", :string)
  add :coarc_note, :text
 end
  end
end
