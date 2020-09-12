defmodule Angio.Repo.Migrations.CreateTableChdRiskFactors do
  use Ecto.Migration

  def change do
    create table(:chd_risk_factors) do
      add(:chd_cardiomyopathy_yn, :boolean, default: false, null: false)
      add(:chd_cardiomyopathy_history, :string)
      add(:chd_chronic_lung_disease_yn, :boolean, default: false, null: false)
      add(:chd_coagulation_disorder_yn, :boolean, default: false, null: false)
      add(:chd_hyper_coagulable_state_yn, :boolean, default: false, null: false)
      add(:chd_hypo_coagulable_state_yn, :boolean, default: false, null: false)
      add(:chd_diabetes_yn, :boolean, default: false, null: false)
      add(:chd_endocarditis_yn, :boolean, default: false, null: false)
      add(:chd_hf_1_month_yn, :boolean, default: false, null: false)
      add(:chd_nyha, :string)
      add(:chd_heart_transplant_yn, :boolean, default: false, null: false)
      add(:chd_hepatic_disease_yn, :boolean, default: false, null: false)
      add(:chd_ischemic_heart_disease_yn, :boolean, default: false, null: false)
      add(:chd_kawasaki_yn, :boolean, default: false, null: false)
      add(:chd_renal_insufficiency_yn, :boolean, default: false, null: false)
      add(:chd_rheumatic_heart_disease_yn, :boolean, default: false, null: false)
      add(:chd_seizure_disorder_yn, :boolean, default: false, null: false)
      add(:chd_sickle_cell_anemia_yn, :boolean, default: false, null: false)
      add(:chd_stroke_prior_yn, :boolean, default: false, null: false)
      add(:chd_arrhythmia_history, {:array, :string})
      add(:chd_risk_factors_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
