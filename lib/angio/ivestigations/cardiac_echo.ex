defmodule Angio.Ivestigations.Cardiac_echo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cardiac_echoes" do
    field(:echo_blood_pressure_diast, :string)
    field(:echo_indication, :string)
    field(:echo_lab_num_yr, :string)
    field(:echo_referring_doctor_1, :string)
    field(:echo_bsa, :string)
    field(:echo_lab_id, :string)
    field(:echo_afib_yn, :boolean, default: false)
    field(:echo_consent_yn, :boolean, default: false)
    field(:echo_idication_icd10cm, :string)
    field(:echo_blood_pressure_sys, :string)
    field(:echo_heart_rate, :string)
    field(:echo_requested_dt, :date)
    field(:echo_stop_tm, :time)
    field(:echo_doctor_operator, :string)
    field(:echo_media_location, :string)
    field(:echo_doctor_reading_npi, :string)
    field(:echo_pt_weight, :string)
    field(:echo_doctor_interpeting_group, :string)
    field(:echo_pt_height, :string)
    field(:sonographer_name, :string)
    field(:echo_performed_yn, :boolean, default: false)
    field(:echo_priority, :string)
    field(:echo_study_location, :string)
    field(:echo_patient_location, :string)
    field(:echo_doctor_reading, :string)
    field(:echo_lab_num, :string)
    field(:echo_study_protocole, :string)
    field(:echo_maschine_type, :string)
    field(:echo_start_tm, :time)
    field(:echo_reason, :string)
    field(:echo_start_dt, :date)
    field(:echo_summary_report, :string)
    field(:echo_referring_doctor_2, :string)
    field(:patient_id, :integer)

    has_many(
      :echo_left_atriums,
      Angio.Ivestigations.Echo_left_atrium,
      foreign_key: :cardiac_echo_id
    )

    has_many(
      :echo_right_atriums,
      Angio.Ivestigations.Echo_right_atrium,
      foreign_key: :cardiac_echo_id
    )

    has_many(
      :echo_ventricle_lefts,
      Angio.Ivestigations.Echo_ventricle_left,
      foreign_key: :cardiac_echo_id
    )

    timestamps()
  end

  @doc false
  def changeset(cardiac_echo, attrs) do
    cardiac_echo
    |> cast(attrs, [
      :echo_consent_yn,
      :echo_performed_yn,
      :echo_reason,
      :echo_indication,
      :echo_idication_icd10cm,
      :echo_priority,
      :echo_start_dt,
      :echo_start_tm,
      :echo_stop_tm,
      :echo_lab_id,
      :echo_lab_num,
      :echo_lab_num_yr,
      :echo_maschine_type,
      :echo_study_location,
      :echo_study_protocole,
      :echo_patient_location,
      :echo_requested_dt,
      :echo_referring_doctor_1,
      :echo_referring_doctor_2,
      :echo_doctor_reading,
      :echo_doctor_reading_npi,
      :echo_doctor_interpeting_group,
      :echo_doctor_operator,
      :sonographer_name,
      :echo_blood_pressure_sys,
      :echo_blood_pressure_diast,
      :echo_bsa,
      :echo_pt_weight,
      :echo_pt_height,
      :echo_heart_rate,
      :echo_afib_yn,
      :echo_media_location,
      :echo_summary_report
    ])
    |> validate_required([])

    # |> validate_required([:echo_consent_yn, :echo_performed_yn, :echo_reason, :echo_indication, :echo_idication_icd10cm, :echo_priority, :echo_start_dt, :echo_start_tm, :echo_stop_tm, :echo_lab_id, :echo_lab_num, :echo_lab_num_yr, :echo_maschine_type, :echo_study_location, :echo_study_protocole, :echo_patient_location, :echo_requested_dt, :echo_referring_doctor_1, :echo_referring_doctor_2, :echo_doctor_reading, :echo_doctor_reading_npi, :echo_doctor_interpeting_group, :echo_doctor_operator, :sonographer_name, :echo_blood_pressure_sys, :echo_blood_pressure_diast, :echo_bsa, :echo_pt_weight, :echo_pt_height, :echo_heart_rate, :echo_afib_yn, :echo_media_location, :echo_summary_report])
  end
end
