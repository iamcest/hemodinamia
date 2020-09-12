defmodule Angio.Repo.Migrations.CreateCardiacEchoes do
  use Ecto.Migration

  def change do
    create table(:cardiac_echoes) do
      add(:echo_consent_yn, :boolean, default: false, null: false)
      add(:echo_performed_yn, :boolean, default: false, null: false)
      add(:echo_reason, :string)
      add(:echo_indication, :string)
      add(:echo_idication_icd10cm, :string)
      add(:echo_priority, :string)
      add(:echo_start_dt, :date)
      add(:echo_start_tm, :time)
      add(:echo_stop_tm, :time)
      add(:echo_lab_id, :string)
      add(:echo_lab_num, :string)
      add(:echo_lab_num_yr, :string)
      add(:echo_maschine_type, :string)
      add(:echo_study_location, :string)
      add(:echo_study_protocole, :string)
      add(:echo_patient_location, :string)
      add(:echo_requested_dt, :date)
      add(:echo_referring_doctor_1, :string)
      add(:echo_referring_doctor_2, :string)
      add(:echo_doctor_reading, :string)
      add(:echo_doctor_reading_npi, :string)
      add(:echo_doctor_interpeting_group, :string)
      add(:echo_doctor_operator, :string)
      add(:sonographer_name, :string)
      add(:echo_blood_pressure_sys, :string)
      add(:echo_blood_pressure_diast, :string)
      add(:echo_bsa, :string)
      add(:echo_pt_weight, :string)
      add(:echo_pt_height, :string)
      add(:echo_heart_rate, :string)
      add(:echo_afib_yn, :boolean, default: false, null: false)
      add(:echo_media_location, :string)
      add(:echo_summary_report, :text)
      add(:patient_id, references(:patients, on_delete: :delete_all))
      timestamps()
    end
  end
end
