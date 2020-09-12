defmodule Angio.Followups.Pci_fup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pci_fups" do
    field(:pfup_cabg_after_yn, :boolean, default: false)
    field(:pfup_aspirin_yn, :boolean, default: false)
    field(:pfup_nyha, :string)
    field(:pfup_type, :string)
    field(:pfup_stent_thrombosis_yn, :boolean, default: false)
    field(:pfup_thienopyridines, :string)
    field(:pfup_stroke_yn, :boolean, default: false)
    field(:pfup_angina_type, :string)
    field(:pfup_anticoagulant_yn, :boolean, default: false)
    field(:pfup_angina_total_num, :string)
    field(:pfup_cabg_after_dt, :date)
    field(:pfup_death_cause, :string)
    field(:pfup_new_infarction_treatment, :string)
    field(:pfup_infarction_yn, :boolean, default: false)
    field(:pfup_primary_fup_method, :string)
    field(:pfup_pci_location, {:array, :string})
    field(:pfup_statin_yn, :boolean, default: false)
    field(:pfup_other_intevention_notes, :string)
    field(:pfup_antiplatelet_yn, :boolean, default: false)
    field(:pfup_rehabilitation, :string)
    field(:pfup_readmission_reason, :string)
    field(:pfup_chest_pain, :string)
    field(:pfup_death_dt, :date)
    field(:pfup_angina_class_canadian, :string)
    field(:pfup_ace_yn, :boolean, default: false)
    field(:pfup_pci_after_yn, :boolean, default: false)
    field(:pfup_new_infarction_location, :string)
    field(:pfup_new_infarction_dt, :date)
    field(:pfup_angio_after_dt, :date)
    field(:pfup_cabage_notes, :string)
    field(:pfup_angio_after_results, :string)
    field(:pfup_no_statin_yn, :boolean, default: false)
    field(:pfup_nitrates_yn, :boolean, default: false)
    field(:pfup_thienopyridines_types, :string)
    field(:pfup_other_intevention_yn, :boolean, default: false)
    field(:pfup_pci_after_dt, :date)
    field(:pfup_assessment_dt, :date)
    field(:pfup_survival_status, :string)
    field(:pfup_angina_last_episode_dt, :date)
    field(:pfup_beta_blocker_yn, :boolean, default: false)
    field(:pfup_stent_thrombosis_timing, :string)
    field(:pfup_arb_yn, :boolean, default: false)
    field(:pfup_infarction_notes, :string)
    field(:pfup_readmission_dt, :date)
    field(:pfup_angio_after_yn, :boolean, default: false)
    field(:pfup_prior_stent_type, :string)
    field(:pfup_readmission_yn, :boolean, default: false)
    field(:pfup_stent_thrombosis_dt, :date)
    field(:pfup_complications_after_pci, :boolean, default: false)
    field(:pfup_notes, :string)
    field(:pfup_diuretics_yn, :boolean, default: false)
    field(:pfup_reason, :string)
    field(:pfup_clinical_improvement_yn, :boolean, default: false)
    field(:pfup_xa_inhibitors, :string)
    field(:pfup_angina_duration, :string)
    field(:pfup_old_infarction_location, :string)
    field(:pfup_stroke_dt, :date)
    field(:patient_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(pci_fup, attrs) do
    pci_fup
    |> cast(attrs, [
      :pfup_assessment_dt,
      :pfup_reason,
      :pfup_type,
      :pfup_primary_fup_method,
      :pfup_survival_status,
      :pfup_clinical_improvement_yn,
      :pfup_complications_after_pci,
      :pfup_death_dt,
      :pfup_death_cause,
      :pfup_prior_stent_type,
      :pfup_stent_thrombosis_yn,
      :pfup_stent_thrombosis_dt,
      :pfup_stent_thrombosis_timing,
      :pfup_readmission_yn,
      :pfup_readmission_dt,
      :pfup_readmission_reason,
      :pfup_stroke_yn,
      :pfup_stroke_dt,
      :pfup_angio_after_yn,
      :pfup_angio_after_dt,
      :pfup_angio_after_results,
      :pfup_pci_after_yn,
      :pfup_pci_after_dt,
      :pfup_pci_location,
      :pfup_cabg_after_yn,
      :pfup_cabg_after_dt,
      :pfup_cabage_notes,
      :pfup_other_intevention_yn,
      :pfup_other_intevention_notes,
      :pfup_infarction_yn,
      :pfup_new_infarction_dt,
      :pfup_old_infarction_location,
      :pfup_new_infarction_location,
      :pfup_new_infarction_treatment,
      :pfup_infarction_notes,
      :pfup_chest_pain,
      :pfup_angina_type,
      :pfup_angina_total_num,
      :pfup_angina_duration,
      :pfup_angina_last_episode_dt,
      :pfup_nyha,
      :pfup_angina_class_canadian,
      :pfup_aspirin_yn,
      :pfup_beta_blocker_yn,
      :pfup_nitrates_yn,
      :pfup_diuretics_yn,
      :pfup_statin_yn,
      :pfup_no_statin_yn,
      :pfup_antiplatelet_yn,
      :pfup_thienopyridines,
      :pfup_arb_yn,
      :pfup_anticoagulant_yn,
      :pfup_thienopyridines_types,
      :pfup_xa_inhibitors,
      :pfup_ace_yn,
      :pfup_rehabilitation,
      :pfup_notes
    ])
    # |> validate_required([:pfup_assessment_dt, :pfup_reason, :pfup_type, :pfup_primary_fup_method, :pfup_survival_status, :pfup_clinical_improvement_yn, :pfup_complications_after_pci, :pfup_death_dt, :pfup_death_cause, :pfup_prior_stent_type, :pfup_stent_thrombosis_yn, :pfup_stent_thrombosis_dt, :pfup_stent_thrombosis_timing, :pfup_readmission_yn, :pfup_readmission_dt, :pfup_readmission_reason, :pfup_stroke_yn, :pfup_stroke_dt, :pfup_angio_after_yn, :pfup_angio_after_dt, :pfup_angio_after_results, :pfup_pci_after_yn, :pfup_pci_after_dt, :pfup_pci_location, :pfup_cabg_after_yn, :pfup_cabg_after_dt, :pfup_cabage_notes, :pfup_other_intevention_yn, :pfup_other_intevention_notes, :pfup_infarction_yn, :pfup_new_infarction_dt, :pfup_old_infarction_location, :pfup_new_infarction_location, :pfup_new_infarction_treatment, :pfup_infarction_notes, :pfup_chest_pain, :pfup_angina_type, :pfup_angina_total_num, :pfup_angina_duration, :pfup_angina_last_episode_dt, :pfup_nyha, :pfup_angina_class_canadian, :pfup_aspirin_yn, :pfup_beta_blocker_yn, :pfup_nitrates_yn, :pfup_diuretics_yn, :pfup_statin_yn, :pfup_no_statin_yn, :pfup_antiplatelet_yn, :pfup_thienopyridines, :pfup_arb_yn, :pfup_anticoagulant_yn, :pfup_thienopyridines_types, :pfup_xa_inhibitors, :pfup_ace_yn, :pfup_rehabilitation, :pfup_notes])
    |> validate_required([])
  end
end
