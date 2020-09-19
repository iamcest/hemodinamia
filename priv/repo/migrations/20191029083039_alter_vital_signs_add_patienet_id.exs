defmodule Angio.Repo.Migrations.AlterVitalSignsAddPatienetId do
  use Ecto.Migration

  def change do
    alter table(:vital_signs) do
      add(:patient_id, :integer)
    end
  end
end
