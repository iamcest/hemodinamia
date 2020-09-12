defmodule Angio.Followups.Asd_closures_fup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "asd_closures_fups" do
    field(:asdclf_anti_platelet_yn, :boolean, default: false)
    field(:asdclf_arrhythmias_yn, :boolean, default: false)
    field(:asdclf_assessment_dt, :date)
    field(:asdclf_embolization_yn, :boolean, default: false)
    field(:asdclf_erosion_yn, :boolean, default: false)
    field(:asdclf_frame_fracture_yn, :boolean, default: false)
    field(:asdclf_free_events_yn, :boolean, default: false)
    field(:asdclf_fup_status, :string)
    field(:asdclf_new_headaches_yn, :boolean, default: false)
    field(:asdclf_notes, :string)
    field(:asdclf_reintervention_closure_dt, :date)
    field(:asdclf_reintervention_closure_yn, :string)
    field(:asdclf_residual_shunt_size, :string)
    field(:asdclf_retrivied_surgery_yn, :boolean, default: false)
    field(:asdclf_sbe_diagnosis_dt, :date)
    field(:asdclf_sbe_factors, :string)
    field(:asdclf_sbe_treatment, :string)
    field(:asdclf_sbe_yn, :boolean, default: false)
    field(:asdclf_start_dt, :date)
    field(:asdclf_visit_status, :string)
    field(:patient_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(asd_closures_fup, attrs) do
    asd_closures_fup
    |> cast(attrs, [
      :asdclf_assessment_dt,
      :asdclf_start_dt,
      :asdclf_fup_status,
      :asdclf_visit_status,
      :asdclf_free_events_yn,
      :asdclf_residual_shunt_size,
      :asdclf_frame_fracture_yn,
      :asdclf_sbe_yn,
      :asdclf_sbe_diagnosis_dt,
      :asdclf_sbe_factors,
      :asdclf_erosion_yn,
      :asdclf_sbe_treatment,
      :asdclf_embolization_yn,
      :asdclf_retrivied_surgery_yn,
      :asdclf_reintervention_closure_yn,
      :asdclf_reintervention_closure_dt,
      :asdclf_new_headaches_yn,
      :asdclf_arrhythmias_yn,
      :asdclf_anti_platelet_yn,
      :asdclf_notes
    ])
    |> validate_required([])

    # |> validate_required([:asdclf_assessment_dt, :asdclf_start_dt, :asdclf_fup_status, :asdclf_visit_status, :asdclf_free_events_yn, :asdclf_residual_shunt_size, :asdclf_frame_fracture_yn, :asdclf_sbe_yn, :asdclf_sbe_diagnosis_dt, :asdclf_sbe_factors, :asdclf_erosion_yn, :asdclf_sbe_treatment, :asdclf_embolization_yn, :asdclf_retrivied_surgery_yn, :asdclf_reintervention_closure_yn, :asdclf_reintervention_closure_dt, :asdclf_new_headaches_yn, :asdclf_arrhythmias_yn, :asdclf_anti_platelet_yn, :asdclf_notes])
  end
end
