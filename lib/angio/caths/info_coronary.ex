defmodule Angio.Caths.Info_coronary do
  use Ecto.Schema
  import Ecto.Changeset

  schema "info_coronaries" do
    field(:cor_les_count, :string)
    field(:icd10cm_code_1, :string)
    field(:icd10cm_code_2, :string)
    field(:icd10cm_code_3, :string)
    field(:icd10cm_code_4, :string)
    field(:info_cor_anomalies_yn, :boolean, default: false)
    field(:info_cor_arrival_dt, :date)
    field(:info_cor_arrival_tm, :time)
    field(:info_cor_cabg_prior_dt, :date)
    field(:info_cor_date, :date)
    field(:info_cor_diagnostic_status, :string)
    field(:info_cor_dis_ves_num, :string)
    field(:info_cor_end_tm, :time)
    field(:info_cor_grafts_dis_yn, :boolean, default: false)
    field(:info_cor_grafts_implanted_num, :string)
    field(:info_cor_grafts_patent_num, :string)
    field(:info_cor_grafts_yn, :boolean, default: false)
    field(:info_cor_main_reason, :string)
    field(:info_cor_normal_natives_yn, :boolean, default: false)
    field(:info_cor_notes, :string)
    field(:info_cor_prior_interv_yn, :boolean, default: false)
    field(:info_cor_rx_recommend, :string)
    field(:info_cor_start_tm, :time)
    field(:info_exam_num, :string)
    field(:patient_id, :integer)

    has_many(
      :cor_lesions,
      Angio.Caths.Cor_lesion,
      foreign_key: :info_coronary_id
    )

    has_many(
      :cath_grafts,
      Angio.Caths.Cath_graft,
      foreign_key: :info_coronary_id
    )

    has_many(
      :cor_collaterals,
      Angio.Caths.Cor_collateral,
      foreign_key: :info_coronary_id
    )

    has_one(
      :care_episodes,
      Angio.Caths.Care_episode,
      foreign_key: :info_coronary_id
    )

    has_one(
      :proc_episodes,
      Angio.Caths.Proc_episode,
      foreign_key: :info_coronary_id
    )

    has_one(
      :cath_radiations,
      Angio.Caths.Cath_radiation,
      foreign_key: :info_coronary_id
    )

    has_one(
      :cath_events,
      Angio.Caths.Cath_event,
      foreign_key: :info_coronary_id
    )

    has_one(
      :lventricles,
      Angio.Caths.Lventricle,
      foreign_key: :info_coronary_id
    )

    has_many(
      :cath_meds,
      Angio.Caths.Cath_med,
      foreign_key: :info_coronary_id
    )

    has_one(
      :cor_anatomies,
      Angio.Caths.Cor_anatomy,
      foreign_key: :info_coronary_id
    )

    has_many(
      :sats_pressures,
      Angio.Caths.Sats_pressure,
      foreign_key: :info_coronary_id
    )

    has_many(
      :vital_signs,
      Angio.Assements.Vital_sign,
      foreign_key: :info_coronary_id
    )

    has_many(
      :functional_states,
      Angio.Assements.Functional_state,
      foreign_key: :info_coronary_id
    )

    has_one(
      :cath_clinicals,
      Angio.Clinicals.Cath_clinical,
      foreign_key: :info_coronary_id
    )

    has_many(
      :cor_mediae,
      Angio.Cor_mediae.Cor_media,
      foreign_key: :info_coronary_id
    )

    has_one(
      :cath_labs,
      Angio.Caths.Cath_lab,
      foreign_key: :info_coronary_id
    )

    has_many(
      :chd_care_episodes,
      Angio.Congenitals.Chd_care_episode,
      foreign_key: :info_coronary_id
    )

    has_many(
      :chd_conditions,
      Angio.Congenitals.Chd_condition,
      foreign_key: :info_coronary_id
    )

    has_one(
      :chd_risk_factors,
      Angio.Congenitals.Chd_risk_factor,
      foreign_key: :info_coronary_id
    )

    has_one(
      :infect_histories,
      Angio.Histories.Infect_history,
      foreign_key: :info_coronary_id
    )

    has_one(
      :core_histories,
      Angio.Histories.Core_history,
      foreign_key: :info_coronary_id
    )

    has_one(
      :social_histories,
      Angio.Histories.Social_history,
      foreign_key: :info_coronary_id
    )

    has_one(
      :proc_histories,
      Angio.Histories.Proc_history,
      foreign_key: :info_coronary_id
    )

    has_many(
      :electrocardiograms,
      Angio.Diagnostics.Electrocardiogram,
      foreign_key: :info_coronary_id
    )

    has_many(
      :asd_closures,
      Angio.Interventions.Asd_closure,
      foreign_key: :info_coronary_id
    )

    has_many(
      :coarc_procedures,
      Angio.Interventions.Coarc_procedure,
      foreign_key: :info_coronary_id
    )

    has_many(
      :av_plasties,
      Angio.Interventions.Av_plasty,
      foreign_key: :info_coronary_id
    )

    has_many(
      :pci_procedures,
      Angio.Interventions.Pci_procedure,
      foreign_key: :info_coronary_id
    )

    has_many(
      :clinical_exams_cardios,
      Angio.Assements.Clinical_exam_cardio,
      foreign_key: :info_coronary_id
    )

    has_many(
      :chest_pain,
      Angio.Clinicals.Chest_pains,
      foreign_key: :info_coronary_id
    )

    timestamps()
  end

  @doc false
  def changeset(info_coronary, attrs) do
    info_coronary
    |> cast(attrs, [
      :info_cor_diagnostic_status,
      :info_cor_date,
      :info_cor_arrival_dt,
      :info_cor_arrival_tm,
      :info_cor_start_tm,
      :info_cor_end_tm,
      :info_exam_num,
      :info_cor_main_reason,
      :icd10cm_code_1,
      :icd10cm_code_2,
      :icd10cm_code_3,
      :icd10cm_code_4,
      :info_cor_normal_natives_yn,
      :info_cor_anomalies_yn,
      :info_cor_dis_ves_num,
      :info_cor_prior_interv_yn,
      :info_cor_grafts_yn,
      :info_cor_grafts_dis_yn,
      :info_cor_cabg_prior_dt,
      :info_cor_grafts_implanted_num,
      :info_cor_grafts_patent_num,
      :info_cor_rx_recommend,
      :info_cor_notes,
      :cor_les_count,
      :patient_id
    ])
    # |> validate_required([:info_cor_diagnostic_status,  :info_cor_date, :info_cor_arrival_dt, :info_cor_arrival_tm, :info_cor_start_tm, :info_cor_end_tm, :info_exam_num, :info_cor_main_reason, :icd10cm_code_1, :icd10cm_code_2, :icd10cm_code_3, :"", :icd10cm_code_4, :info_cor_normal_natives_yn, :info_cor_anomalies_yn, :info_cor_dis_ves_num, :info_cor_prior_interv_yn, :info_cor_grafts_yn, :info_cor_grafts_dis_yn, :info_cor_cabg_prior_dt, :info_cor_grafts_implanted_num, :info_cor_grafts_patent_num, :info_cor_rx_recommend, :info_cor_notes, :cor_les_count])
    |> validate_required([])
  end
end
