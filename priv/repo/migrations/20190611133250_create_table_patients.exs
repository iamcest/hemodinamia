defmodule Angio.Repo.Migrations.CreateTablePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add(:patnts_last_name, :string, size: 50)
      add(:patnts_first_name, :string, size: 50)
      add(:patnts_gender, :string, size: 5)
      add(:patnts_middle_name, :string, size: 50)
      add(:patnts_father_name, :string, size: 50)
      add(:patnts_mother_name, :string, size: 50)
      add(:patnts_birth_dt, :date)
      add(:patient_other_id, :string)
      add(:patnts_ssn, :string, size: 15)
      add(:patnts_ssn_na, :boolean, default: false, null: false)
      add(:patnts_deceased, :boolean, default: false, null: false)
      add(:patnts_record_active, :boolean, default: false, null: false)
      add(:patnts_ethnicity_hispanic, :string)
      add(:patnts_language_preferred, :string, size: 12)
      add(:patnts_race, :string, size: 50)
      add(:patnts_uuid, :binary_id)
      add(:patnts_notes, :text)

      timestamps()
    end

    create index(:patients, [:patnts_last_name])
    execute "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA public;"
  end
end
