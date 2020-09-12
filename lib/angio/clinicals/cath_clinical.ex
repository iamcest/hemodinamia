defmodule Angio.Clinicals.Cath_clinical do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_clinicals" do
    field(:anesthitist_called_yn, :boolean, default: false)
    field(:anesthitist_at_start_yn, :boolean, default: false)
    field(:angina_class_within_2wk_yn, :boolean, default: false)
    field(:bag_mask_ventilation_yn, :boolean, default: false)
    field(:cabg_most_recent_dt, :date)
    field(:cad_presentation_type, :string)
    field(:cardio_shock_last_24hours_yn, :boolean, default: false)
    field(:cath_cl_arrest_hypothermia_dt, :date)
    field(:cath_cl_arrest_hypothermia_tm, :time)
    field(:cath_cl_arrest_hypothermia_yn, :boolean, default: false)
    field(:cath_cl_arrest_loc, :string)
    field(:cath_cl_arrest_pre_wit_yn, :boolean, default: false)
    field(:cath_cl_iabp_start_dt, :date)
    field(:cath_cl_symptom_onset_dt, :date)
    field(:chf_prior_2wk_yn, :boolean, default: false)
    field(:glasgow_coma_scale, :string)
    field(:iabp_start_tm, :time)
    field(:iabp_support_req_yn, :boolean, default: false)
    field(:intubated_before_cath_yn, :boolean, default: false)
    field(:lv_dysfunction_yn, :boolean, default: false)
    field(:mech_lv_support_other_dt, :date)
    field(:mech_lv_support_other_tm, :time)
    field(:mech_lv_support_other_yn, :boolean, default: false)
    field(:nyha_class_prior_2wk_cath_yn, :boolean, default: false)
    field(:nyha_prior_2wk_category, :string)
    field(:sedation_type, :string)
    field(:symptom_onset_tm, :time)
    field(:symptom_onset_tm_estim, :boolean, default: false)
    field(:symptom_onset_tm_na, :boolean, default: false)
    field(:ventilator_support_yn, :boolean, default: false)
    field(:arrest_cardiac_24h_yn, :boolean, default: false)
    field(:cath_cl_notes, :string)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(cath_clinical, attrs) do
    cath_clinical
    |> cast(attrs, [
      :chf_prior_2wk_yn,
      :nyha_class_prior_2wk_cath_yn,
      :nyha_prior_2wk_category,
      :lv_dysfunction_yn,
      :cardio_shock_last_24hours_yn,
      :iabp_support_req_yn,
      :cath_cl_iabp_start_dt,
      :iabp_start_tm,
      :mech_lv_support_other_yn,
      :mech_lv_support_other_dt,
      :mech_lv_support_other_tm,
      :cath_cl_arrest_pre_wit_yn,
      :cath_cl_arrest_loc,
      :cath_cl_arrest_hypothermia_yn,
      :cath_cl_arrest_hypothermia_dt,
      :cath_cl_arrest_hypothermia_tm,
      :intubated_before_cath_yn,
      :ventilator_support_yn,
      :bag_mask_ventilation_yn,
      :glasgow_coma_scale,
      :cad_presentation_type,
      :angina_class_within_2wk_yn,
      :symptom_onset_tm,
      :cath_cl_symptom_onset_dt,
      :symptom_onset_tm_na,
      :symptom_onset_tm_estim,
      :cabg_most_recent_dt,
      :sedation_type,
      :anesthitist_at_start_yn,
      :anesthitist_called_yn,
      :arrest_cardiac_24h_yn,
      :cath_cl_notes,
      :info_coronary_id
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :cath_clinicals_info_coronary_id_index,
      message: "Error: Record For  Cath Events  Was Inserted"
    )

    # |> validate_required([:chf_prior_2wk_yn, :nyha_class_prior_2wk_cath_yn, :nyha_prior_2wk_category, :lv_dysfunction_yn, :cardio_shock_last_24hours_yn, :iabp_support_req_yn, :cath_cl_iabp_start_dt, :iabp_start_tm, :mech_lv_support_other_yn, :mech_lv_support_other_dt, :mech_lv_support_other_tm, :cath_cl_arrest_pre_wit_yn, :cath_cl_arrest_loc, :cath_cl_arrest_hypothermia_yn, :cath_cl_arrest_hypothermia_dt, :cath_cl_arrest_hypothermia_tm, :intubated_before_cath_yn, :ventilator_support_yn, :bag_mask_ventilation_yn, :glasgow_coma_scale, :cad_presentation_type, :angina_class_within_2wk_yn, :symptom_onset_tm, :cath_cl_symptom_onset_dt, :symptom_onset_tm_na, :symptom_onset_tm_estim, :cabg_most_recent_dt, :sedation_type, :anesthitist_at_start_yn, :" "])
  end
end
