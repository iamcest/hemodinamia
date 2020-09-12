defmodule Angio.Repo.Migrations.AlterTableAsdClosureFupsAddPatientRelation do
  use Ecto.Migration

  def change do
   alter table(:asd_closures_fups) do
    add(:patient_id, references(:patients, on_delete: :delete_all))
   end
  end
end
