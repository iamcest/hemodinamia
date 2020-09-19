defmodule Angio.Persons.Patient do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "patients" do
    field(:patient_other_id, :string)
    field(:patnts_birth_dt, :date)
    field(:patnts_deceased, :boolean, default: false)
    field(:patnts_ethnicity_hispanic, :boolean, default: false)
    field(:patnts_father_name, :string)
    field(:patnts_first_name, :string)
    field(:patnts_gender, :string)
    field(:patnts_language_preferred, :string)
    field(:patnts_last_name, :string)
    field(:patnts_middle_name, :string)
    field(:patnts_mother_name, :string)
    field(:patnts_notes, :string)
    field(:patnts_race, :string)
    field(:patnts_record_active, :boolean, default: false)
    field(:patnts_ssn, :string)
    field(:patnts_ssn_na, :boolean, default: false)
    field(:patnts_uuid, Ecto.UUID, autogenerate: true)
    timestamps()
    has_many(:contacts, Angio.Persons.Contact, foreign_key: :patient_id)
    has_many(:asd_closures_fups, Angio.Followups.Asd_closures_fup, foreign_key: :patient_id)
    has_many(:pci_fups, Angio.Followups.Pci_fup, foreign_key: :patient_id)

    has_many(:treadmill_exercises, Angio.Ivestigations.Treadmill_exercise,
      foreign_key: :patient_id
    )

    has_many(:cardiac_echoes, Angio.Ivestigations.Cardiac_echo, foreign_key: :patient_id)
    has_many(:info_coronaries, Angio.Caths.Info_coronary, foreign_key: :patient_id)
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [
      :patnts_last_name,
      :patnts_first_name,
      :patnts_gender,
      :patnts_middle_name,
      :patnts_father_name,
      :patnts_mother_name,
      :patnts_birth_dt,
      :patient_other_id,
      :patnts_ssn,
      :patnts_ssn_na,
      :patnts_deceased,
      :patnts_record_active,
      :patnts_ethnicity_hispanic,
      :patnts_language_preferred,
      :patnts_race,
      :patnts_uuid,
      :patnts_notes
    ])
    |> validate_required([])
  end

  def order_by_name(query) do
    from(patient in query,
      order_by: [asc: patient.patnts_last_name]
    )
  end

  #    |> validate_required([:patnts_last_name, :patnts_first_name, :patnts_gender, :patnts_middle_name, :patnts_father_name, :patnts_mother_name, :patnts_birth_dt, :patient_other_id, :patnts_ssn, :patnts_ssn_na, :patnts_deceased, :patnts_record_active, :patnts_ethnicity_hispanic, :patnts_language_preferred, :patnts_race, :patnts_uuid, :"", :patnts_notes, :""])
end
