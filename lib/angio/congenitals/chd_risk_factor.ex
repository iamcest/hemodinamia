defmodule Angio.Congenitals.Chd_risk_factor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chd_risk_factors" do
    field(:chd_arrhythmia_history, {:array, :string})
    field(:chd_cardiomyopathy_history, :string)
    field(:chd_cardiomyopathy_yn, :boolean, default: false)
    field(:chd_chronic_lung_disease_yn, :boolean, default: false)
    field(:chd_coagulation_disorder_yn, :boolean, default: false)
    field(:chd_diabetes_yn, :boolean, default: false)
    field(:chd_endocarditis_yn, :boolean, default: false)
    field(:chd_heart_transplant_yn, :boolean, default: false)
    field(:chd_hepatic_disease_yn, :boolean, default: false)
    field(:chd_hf_1_month_yn, :boolean, default: false)
    field(:chd_hyper_coagulable_state_yn, :boolean, default: false)
    field(:chd_hypo_coagulable_state_yn, :boolean, default: false)
    field(:chd_ischemic_heart_disease_yn, :boolean, default: false)
    field(:chd_kawasaki_yn, :boolean, default: false)
    field(:chd_nyha, :string)
    field(:chd_renal_insufficiency_yn, :boolean, default: false)
    field(:chd_rheumatic_heart_disease_yn, :boolean, default: false)
    field(:chd_risk_factors_notes, :string)
    field(:chd_seizure_disorder_yn, :boolean, default: false)
    field(:chd_sickle_cell_anemia_yn, :boolean, default: false)
    field(:chd_stroke_prior_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(chd_risk_factor, attrs) do
    chd_risk_factor
    |> cast(attrs, [
      :chd_cardiomyopathy_yn,
      :chd_cardiomyopathy_history,
      :chd_chronic_lung_disease_yn,
      :chd_coagulation_disorder_yn,
      :chd_hyper_coagulable_state_yn,
      :chd_hypo_coagulable_state_yn,
      :chd_diabetes_yn,
      :chd_endocarditis_yn,
      :chd_hf_1_month_yn,
      :chd_nyha,
      :chd_heart_transplant_yn,
      :chd_hepatic_disease_yn,
      :chd_ischemic_heart_disease_yn,
      :chd_kawasaki_yn,
      :chd_renal_insufficiency_yn,
      :chd_rheumatic_heart_disease_yn,
      :chd_seizure_disorder_yn,
      :chd_sickle_cell_anemia_yn,
      :chd_stroke_prior_yn,
      :chd_arrhythmia_history,
      :chd_risk_factors_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :chd_risk_factors_info_coronary_id_index,
      message: "Error: Record For  in table  CHD Risk Factors Was completed"
    )
    #|> unique_constraint(:info_coronary_id,
    #name: :cath_clinicals_info_coronary_id_index,
    #message: "Error: Record For  Cath Events  Was Inserted"
    # )
    # |> validate_required([:chd_cardiomyopathy_yn, :chd_cardiomyopathy_history, :chd_chronic_lung_disease_yn, :chd_coagulation_disorder_yn, :chd_hyper_coagulable_state_yn, :chd_hypo_coagulable_state_yn, :chd_diabetes_yn, :chd_endocarditis_yn, :chd_hf_1_month_yn, :chd_nyha, :chd_heart_transplant_yn, :chd_hepatic_disease_yn, :chd_ischemic_heart_disease_yn, :chd_kawasaki_yn, :chd_renal_insufficiency_yn, :chd_rheumatic_heart_disease_yn, :chd_seizure_disorder_yn, :chd_sickle_cell_anemia_yn, :chd_stroke_prior_yn, :chd_arrhythmia_history, :chd_risk_factors_notes])
  end
end
