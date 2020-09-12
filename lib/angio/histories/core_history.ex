defmodule Angio.Histories.Core_history do
  use Ecto.Schema
  import Ecto.Changeset

  schema "core_histories" do
    field(:coh_tobacco_type, :string)
    field(:coh_prior_cor_interv_yn, :boolean, default: false)
    field(:coh_hypertension_yn, :boolean, default: false)
    field(:coh_chf_etiology, :string)
    field(:coh_tobacco_cigarette_amount, :string)
    field(:coh_diabetes_therapy, :string)
    field(:coh_peripheral_art_dis_yn, :boolean, default: false)
    field(:coh_chronic_kidney_dis, :string)
    field(:coh_contrast_allergy_yn, :boolean, default: false)
    field(:coh_prior_sten_50pct_yn, :boolean, default: false)
    field(:coh_tobacco_use, :string)
    field(:coh_mascular_dis_yn, :boolean, default: false)
    field(:coh_chf_prior_yn, :boolean, default: false)
    field(:coh_diabetes_yn, :boolean, default: false)
    field(:coh_arthritis_collagen_dis_yn, :boolean, default: false)
    field(:coh_cardiomyo, :string)
    field(:coh_cur_on_dyalisis_yn, :boolean, default: false)
    field(:coh_cancer_type, :string)
    field(:coh_renal_artery_dis_yn, :boolean, default: false)
    field(:coh_cancer_history_yn, :boolean, default: false)
    field(:coh_fatigue_yn, :boolean, default: false)
    field(:coh_prior_afib_yn, :boolean, default: false)
    field(:coh_angina_yn, :boolean, default: false)
    field(:coh_prior_mi_yn, :boolean, default: false)
    field(:coh_arrest_cardiac_yn, :boolean, default: false)
    field(:coh_histories_notes, :string)
    field(:coh_copd_yn, :boolean, default: false)
    field(:coh_chf_hosp_timeframe, :string)
    field(:coh_family_diabetes_yn, :boolean, default: false)
    field(:coh_cerebrovasc_dis_yn, :boolean, default: false)
    field(:coh_dyslipidemia_yn, :boolean, default: false)
    field(:coh_family_cor_dis_yn, :boolean, default: false)
    field(:coh_angina_class, :string)
    field(:coh_mi_timeframe, :string)
    field(:coh_stroke_ischemic_yn, :boolean, default: false)
    field(:coh_chf_symptom_duration, :string)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(core_history, attrs) do
    core_history
    |> cast(attrs, [
      :coh_contrast_allergy_yn,
      :coh_angina_yn,
      :coh_angina_class,
      :coh_prior_cor_interv_yn,
      :coh_prior_sten_50pct_yn,
      :coh_prior_mi_yn,
      :coh_mi_timeframe,
      :coh_family_cor_dis_yn,
      :coh_diabetes_yn,
      :coh_diabetes_therapy,
      :coh_family_diabetes_yn,
      :coh_hypertension_yn,
      :coh_dyslipidemia_yn,
      :coh_arrest_cardiac_yn,
      :coh_cerebrovasc_dis_yn,
      :coh_copd_yn,
      :coh_chf_prior_yn,
      :coh_chf_etiology,
      :coh_chf_symptom_duration,
      :coh_chf_hosp_timeframe,
      :coh_cancer_type,
      :coh_cancer_history_yn,
      :coh_arthritis_collagen_dis_yn,
      :coh_prior_afib_yn,
      :coh_tobacco_use,
      :coh_tobacco_type,
      :coh_tobacco_cigarette_amount,
      :coh_renal_artery_dis_yn,
      :coh_fatigue_yn,
      :coh_mascular_dis_yn,
      :coh_chronic_kidney_dis,
      :coh_cur_on_dyalisis_yn,
      :coh_stroke_ischemic_yn,
      :coh_cardiomyo,
      :coh_peripheral_art_dis_yn,
      :coh_histories_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :core_histories_info_coronary_id_index,
      message: "Error: Record For  in table  Essential History Was completed"
    )

    # |> validate_required([:coh_contrast_allergy_yn, :coh_angina_yn, :coh_angina_class, :coh_prior_cor_interv_yn, :coh_prior_sten_50pct_yn, :coh_prior_mi_yn, :coh_mi_timeframe, :coh_family_cor_dis_yn, :coh_diabetes_yn, :coh_diabetes_therapy, :coh_family_diabetes_yn, :coh_hypertension_yn, :coh_dyslipidemia_yn, :coh_arrest_cardiac_yn, :coh_cerebrovasc_dis_yn, :coh_copd_yn, :coh_chf_prior_yn, :coh_chf_etiology, :coh_chf_symptom_duration, :coh_chf_hosp_timeframe, :coh_cancer_type, :coh_cancer_history_yn, :coh_arthritis_collagen_dis_yn, :coh_prior_afib_yn, :coh_tobacco_use, :coh_tobacco_type, :coh_tobacco_cigarette_amount, :coh_renal_artery_dis_yn, :coh_fatigue_yn, :coh_mascular_dis_yn, :coh_chronic_kidney_dis, :coh_cur_on_dyalisis_yn, :coh_stroke_ischemic_yn, :coh_cardiomyo, :coh_peripheral_art_dis_yn, :coh_histories_notes])
  end
end
