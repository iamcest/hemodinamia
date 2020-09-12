defmodule Angio.Repo.Migrations.CreateTableContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add(:pacntcts_lname, :string, size: 50)
      add(:pacntcts_fname, :string, size: 50)
      add(:pacntcts_mname, :string, size: 50)
      add(:pacntcts_ssn, :string, size: 50)
      add(:pacntcts_address, :string, size: 50)
      add(:pacntcts_telecom, :string, size: 50)
      add(:pacntcts_relationship, :string, size: 50)
      add(:pacntcts_organization, :string, size: 50)
      add(:pacntcts_period_start, :date)
      add(:pacntcts_period_end, :date)
      add(:pacntcts_period, :string, size: 50)
      add(:pacntcts_notes, :text)
      add(:patient_id, references(:patients, on_delete: :delete_all))
      timestamps()
    end

    create(index("contacts", [:pacntcts_ssn]))
  end
end
