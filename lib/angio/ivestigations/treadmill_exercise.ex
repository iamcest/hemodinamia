defmodule Angio.Ivestigations.Treadmill_exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treadmill_exercises" do
    field(:ext_medications_yn, :boolean, default: false)
    field(:ext_stopping_reason_notes, :string)
    field(:ext_stop_reason_other_yn, :boolean, default: false)
    field(:ext_angina_severe_post_yn, :boolean, default: false)
    field(:ext_cardio_shock_post_yn, :boolean, default: false)
    field(:ext_cpx_vo2_ventilatory_response, :string)
    field(:ext_lab_num, :string)
    field(:ext_heart_rate_at_max_st_depres, :string)
    field(:ext_referral_person, :string)
    field(:ext_st_depres_recovery_location, :string)
    field(:ext_cpr_post_yn, :boolean, default: false)
    field(:ext_compl_other_yn, :boolean, default: false)
    field(:ext_heart_rate_max_predicted, :string)
    field(:ext_vt_post_yn, :boolean, default: false)
    field(:ext_indication_notes, :string)
    field(:ext_afib_pre_yn, :boolean, default: false)
    field(:ext_st_depres_max, :string)
    field(:ext_stages_completed, :string)
    field(:ext_anginal_meds_yn, :boolean, default: false)
    field(:ext_technician_lname, :string)
    field(:ext_t_wave_inversion_pre_yn, :boolean, default: false)
    field(:ext_qrs_morphology_pre, {:array, :string})
    field(:ext_bradycardia_post_yn, :boolean, default: false)
    field(:ext_lab_yr, :string)
    field(:ext_main_problem_notes, :string)
    field(:ext_bp_diast_max, :string)
    field(:ext_ecg_normal_pre_yn, :boolean, default: false)
    field(:ext_heart_rate_achieved, :string)
    field(:ext_mets, :string)
    field(:ext_limitations, :string)
    field(:ext_bp_diast_recovery, :string)
    field(:ext_pvc_pre_yn, :boolean, default: false)
    field(:ext_duke_score, :string)
    field(:ext_mi_post_yn, :boolean, default: false)
    field(:ext_doctor_fname, :string)
    field(:ext_need_hold_handrails_yn, :boolean, default: false)
    field(:ext_st_slop_max, :string)
    field(:ext_main_problem_pulm_yn, :boolean, default: false)
    field(:ext_recommendations, :string)
    field(:ext_st_depres_pre_val, :string)
    field(:ext_qwaves_pre, :string)
    field(:ext_cad_pretest_probability, :string)
    field(:ext_complication_yn, :boolean, default: false)
    field(:ext_on_digoxin_yn, :boolean, default: false)
    field(:ext_mortality_cad_risk, :string)
    field(:ext_cpx_age_vo2, :string)
    field(:ext_heart_rate_rest, :string)
    field(:ext_bp_sys_rest, :string)
    field(:ext_st_depres_max_duration, :string)
    field(:ext_compl_notes, :string)
    field(:ext_athens_score, :string)
    field(:ext_on_bblockers_yn, :boolean, default: false)
    field(:ext_main_problem_medical_yn, :boolean, default: false)
    field(:ext_aerobic_capacity_max, :string)
    field(:ext_cpx_ve_vco2_slope, :string)
    field(:ext_borg_scale, :string)
    field(:ext_compl_afib_post_yn, :boolean, default: false)
    field(:ext_dt, :date)
    field(:ext_lab_id, :string)
    field(:ext_stop_reason_angina_yn, :boolean, default: false)
    field(:ext_bp_diast_rest, :string)
    field(:ext_st_depres_recovery_val, :string)
    field(:ext_not_done_reason, :string)
    field(:ext_st_elevation_max, :string)
    field(:ext_lv_hypertrophy_pre_yn, :boolean, default: false)
    field(:ext_limitations_relative, :string)
    field(:ext_cpx_peak_mets, :string)
    field(:ext_main_problem_cardiac_yn, :boolean, default: false)
    field(:ext_bp_sys_recovery, :string)
    field(:ext_technician_fname, :string)
    field(:ext_result_notes, :string)
    field(:ext_indication, :string)
    field(:ext_is_done_yn, :boolean, default: false)
    field(:ext_notes, :string)
    field(:ext_cpx_peak_vo2, :string)
    field(:ext_doctor_lname, :string)
    field(:ext_va_treadmill_score, :string)
    field(:ext_watts, :string)
    field(:ext_bp_sys_max, :string)
    field(:ext_tm, :time)
    field(:ext_consent_yn, :boolean, default: false)
    field(:ext_st_depres_max_location, :string)
    field(:ext_result, :string)
    field(:ext_stop_reason, :string)
    field(:ext_st_depres_pre_yn, :boolean, default: false)
    field(:ext_protocole_used, :string)
    field(:patient_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(treadmill_exercise, attrs) do
    treadmill_exercise
    |> cast(attrs, [
      :ext_dt,
      :ext_tm,
      :ext_lab_num,
      :ext_lab_yr,
      :ext_lab_id,
      :ext_consent_yn,
      :ext_doctor_lname,
      :ext_doctor_fname,
      :ext_technician_lname,
      :ext_technician_fname,
      :ext_referral_person,
      :ext_is_done_yn,
      :ext_not_done_reason,
      :ext_indication,
      :ext_limitations_relative,
      :ext_limitations,
      :ext_indication_notes,
      :ext_protocole_used,
      :ext_main_problem_cardiac_yn,
      :ext_cad_pretest_probability,
      :ext_mortality_cad_risk,
      :ext_main_problem_pulm_yn,
      :ext_main_problem_medical_yn,
      :ext_main_problem_notes,
      :ext_medications_yn,
      :ext_anginal_meds_yn,
      :ext_on_digoxin_yn,
      :ext_on_bblockers_yn,
      :ext_ecg_normal_pre_yn,
      :ext_qrs_morphology_pre,
      :ext_qwaves_pre,
      :ext_st_depres_pre_yn,
      :ext_st_depres_pre_val,
      :ext_t_wave_inversion_pre_yn,
      :ext_lv_hypertrophy_pre_yn,
      :ext_pvc_pre_yn,
      :ext_afib_pre_yn,
      :ext_stages_completed,
      :ext_stop_reason,
      :ext_stop_reason_angina_yn,
      :ext_stop_reason_other_yn,
      :ext_need_hold_handrails_yn,
      :ext_stopping_reason_notes,
      :ext_bp_diast_rest,
      :ext_bp_sys_rest,
      :ext_bp_sys_max,
      :ext_bp_diast_max,
      :ext_heart_rate_rest,
      :ext_heart_rate_achieved,
      :ext_heart_rate_max_predicted,
      :ext_st_elevation_max,
      :ext_st_depres_max,
      :ext_st_depres_max_duration,
      :ext_st_depres_max_location,
      :ext_st_slop_max,
      :ext_mets,
      :ext_watts,
      :ext_duke_score,
      :ext_borg_scale,
      :ext_athens_score,
      :ext_bp_sys_recovery,
      :ext_bp_diast_recovery,
      :ext_st_depres_recovery_val,
      :ext_st_depres_recovery_location,
      :ext_heart_rate_at_max_st_depres,
      :ext_complication_yn,
      :ext_cpr_post_yn,
      :ext_bradycardia_post_yn,
      :ext_cardio_shock_post_yn,
      :ext_mi_post_yn,
      :ext_angina_severe_post_yn,
      :ext_compl_other_yn,
      :ext_vt_post_yn,
      :ext_compl_afib_post_yn,
      :ext_compl_notes,
      :ext_result,
      :ext_result_notes,
      :ext_recommendations,
      :ext_cpx_age_vo2,
      :ext_cpx_vo2_ventilatory_response,
      :ext_cpx_ve_vco2_slope,
      :ext_cpx_peak_mets,
      :ext_cpx_peak_vo2,
      :ext_va_treadmill_score,
      :ext_aerobic_capacity_max,
      :ext_notes
    ])
    |> validate_required([])

    # |> validate_required([:ext_dt, :ext_tm, :ext_lab_num, :ext_lab_yr, :ext_lab_id, :ext_consent_yn, :ext_doctor_lname, :ext_doctor_fname, :ext_technician_lname, :ext_technician_fname, :ext_referral_person, :ext_is_done_yn, :ext_not_done_reason, :ext_indication, :ext_limitations_relative, :ext_limitations, :ext_indication_notes, :ext_protocole_used, :ext_main_problem_cardiac_yn, :ext_cad_pretest_probability, :ext_mortality_cad_risk, :ext_main_problem_pulm_yn, :ext_main_problem_medical_yn, :ext_main_problem_notes, :ext_medications_yn, :ext_anginal_meds_yn, :ext_on_digoxin_yn, :ext_on_bblockers_yn, :ext_ecg_normal_pre_yn, :ext_qrs_morphology_pre, :ext_qwaves_pre, :ext_st_depres_pre_yn, :ext_st_depres_pre_val, :ext_t_wave_inversion_pre_yn, :ext_lv_hypertrophy_pre_yn, :ext_pvc_pre_yn, :ext_afib_pre_yn, :ext_stages_completed, :ext_stop_reason, :ext_stop_reason_angina_yn, :ext_stop_reason_other_yn, :ext_need_hold_handrails_yn, :ext_stopping_reason_notes, :ext_bp_diast_rest, :ext_bp_sys_rest, :ext_bp_sys_max, :ext_bp_diast_max, :ext_heart_rate_rest, :ext_heart_rate_achieved, :ext_heart_rate_max_predicted, :ext_st_elevation_max, :ext_st_depres_max, :ext_st_depres_max_duration, :ext_st_depres_max_location, :ext_st_slop_max, :ext_mets, :ext_watts, :ext_duke_score, :ext_borg_scale, :ext_athens_score, :ext_bp_sys_recovery, :ext_bp_diast_recovery, :ext_st_depres_recovery_val, :ext_st_depres_recovery_location, :ext_heart_rate_at_max_st_depres, :ext_complication_yn, :ext_cpr_post_yn, :ext_bradycardia_post_yn, :ext_cardio_shock_post_yn, :ext_mi_post_yn, :ext_angina_severe_post_yn, :ext_compl_other_yn, :ext_vt_post_yn, :ext_compl_afib_post_yn, :ext_compl_notes, :ext_result, :ext_result_notes, :ext_recommendations, :ext_cpx_age_vo2, :ext_cpx_vo2_ventilatory_response, :ext_cpx_ve_vco2_slope, :ext_cpx_peak_mets, :ext_cpx_peak_vo2, :ext_va_treadmill_score, :ext_aerobic_capacity_max, :ext_notes])
  end
end
