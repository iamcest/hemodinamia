defmodule Angio.Repo.Migrations.AlterCoarcDevicesCoarcProcedureId do
  use Ecto.Migration

  def change do
    alter table(:coarc_devices) do
      remove(:coarc_id)
      add(:coarc_procedure_id, references(:coarc_procedures, on_delete: :delete_all))
    end
  end
end
