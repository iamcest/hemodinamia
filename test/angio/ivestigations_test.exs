defmodule Angio.IvestigationsTest do
  use Angio.DataCase

  alias Angio.Ivestigations

  describe "treadmill_exercises" do
    alias Angio.Ivestigations.Treadmill_exercise

    @valid_attrs %{ext_anginal_meds_yn: true, ext_cad_pretest_probability: "some ext_cad_pretest_probability", ext_consent_yn: true, ext_doctor_fname: "some ext_doctor_fname", ext_doctor_lname: "some ext_doctor_lname", ext_dt: ~D[2010-04-17], ext_ecg_normal_pre_yn: true, ext_indication: "some ext_indication", ext_indication_notes: "some ext_indication_notes", ext_is_done_yn: true, ext_lab_id: "some ext_lab_id", ext_lab_num: "some ext_lab_num", ext_lab_yr: "some ext_lab_yr", ext_limitations: "some ext_limitations", ext_limitations_relative: "some ext_limitations_relative", ext_main_problem_cardiac_yn: true, ext_main_problem_medical_yn: true, ext_main_problem_notes: "some ext_main_problem_notes", ext_main_problem_pulm_yn: true, ext_medications_yn: true, ext_mortality_cad_risk: "some ext_mortality_cad_risk", ext_not_done_reason: "some ext_not_done_reason", ext_on_bblockers_yn: true, ext_on_digoxin_yn: true, ext_protocole_used: "some ext_protocole_used", ext_referral_person: "some ext_referral_person", ext_technician_fname: "some ext_technician_fname", ext_technician_lname: "some ext_technician_lname", ext_tm: ~T[14:00:00]}
    @update_attrs %{ext_anginal_meds_yn: false, ext_cad_pretest_probability: "some updated ext_cad_pretest_probability", ext_consent_yn: false, ext_doctor_fname: "some updated ext_doctor_fname", ext_doctor_lname: "some updated ext_doctor_lname", ext_dt: ~D[2011-05-18], ext_ecg_normal_pre_yn: false, ext_indication: "some updated ext_indication", ext_indication_notes: "some updated ext_indication_notes", ext_is_done_yn: false, ext_lab_id: "some updated ext_lab_id", ext_lab_num: "some updated ext_lab_num", ext_lab_yr: "some updated ext_lab_yr", ext_limitations: "some updated ext_limitations", ext_limitations_relative: "some updated ext_limitations_relative", ext_main_problem_cardiac_yn: false, ext_main_problem_medical_yn: false, ext_main_problem_notes: "some updated ext_main_problem_notes", ext_main_problem_pulm_yn: false, ext_medications_yn: false, ext_mortality_cad_risk: "some updated ext_mortality_cad_risk", ext_not_done_reason: "some updated ext_not_done_reason", ext_on_bblockers_yn: false, ext_on_digoxin_yn: false, ext_protocole_used: "some updated ext_protocole_used", ext_referral_person: "some updated ext_referral_person", ext_technician_fname: "some updated ext_technician_fname", ext_technician_lname: "some updated ext_technician_lname", ext_tm: ~T[15:01:01]}
    @invalid_attrs %{ext_anginal_meds_yn: nil, ext_cad_pretest_probability: nil, ext_consent_yn: nil, ext_doctor_fname: nil, ext_doctor_lname: nil, ext_dt: nil, ext_ecg_normal_pre_yn: nil, ext_indication: nil, ext_indication_notes: nil, ext_is_done_yn: nil, ext_lab_id: nil, ext_lab_num: nil, ext_lab_yr: nil, ext_limitations: nil, ext_limitations_relative: nil, ext_main_problem_cardiac_yn: nil, ext_main_problem_medical_yn: nil, ext_main_problem_notes: nil, ext_main_problem_pulm_yn: nil, ext_medications_yn: nil, ext_mortality_cad_risk: nil, ext_not_done_reason: nil, ext_on_bblockers_yn: nil, ext_on_digoxin_yn: nil, ext_protocole_used: nil, ext_referral_person: nil, ext_technician_fname: nil, ext_technician_lname: nil, ext_tm: nil}

    def treadmill_exercise_fixture(attrs \\ %{}) do
      {:ok, treadmill_exercise} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_treadmill_exercise()

      treadmill_exercise
    end

    test "list_treadmill_exercises/0 returns all treadmill_exercises" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert Ivestigations.list_treadmill_exercises() == [treadmill_exercise]
    end

    test "get_treadmill_exercise!/1 returns the treadmill_exercise with given id" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert Ivestigations.get_treadmill_exercise!(treadmill_exercise.id) == treadmill_exercise
    end

    test "create_treadmill_exercise/1 with valid data creates a treadmill_exercise" do
      assert {:ok, %Treadmill_exercise{} = treadmill_exercise} = Ivestigations.create_treadmill_exercise(@valid_attrs)
      assert treadmill_exercise.ext_anginal_meds_yn == true
      assert treadmill_exercise.ext_cad_pretest_probability == "some ext_cad_pretest_probability"
      assert treadmill_exercise.ext_consent_yn == true
      assert treadmill_exercise.ext_doctor_fname == "some ext_doctor_fname"
      assert treadmill_exercise.ext_doctor_lname == "some ext_doctor_lname"
      assert treadmill_exercise.ext_dt == ~D[2010-04-17]
      assert treadmill_exercise.ext_ecg_normal_pre_yn == true
      assert treadmill_exercise.ext_indication == "some ext_indication"
      assert treadmill_exercise.ext_indication_notes == "some ext_indication_notes"
      assert treadmill_exercise.ext_is_done_yn == true
      assert treadmill_exercise.ext_lab_id == "some ext_lab_id"
      assert treadmill_exercise.ext_lab_num == "some ext_lab_num"
      assert treadmill_exercise.ext_lab_yr == "some ext_lab_yr"
      assert treadmill_exercise.ext_limitations == "some ext_limitations"
      assert treadmill_exercise.ext_limitations_relative == "some ext_limitations_relative"
      assert treadmill_exercise.ext_main_problem_cardiac_yn == true
      assert treadmill_exercise.ext_main_problem_medical_yn == true
      assert treadmill_exercise.ext_main_problem_notes == "some ext_main_problem_notes"
      assert treadmill_exercise.ext_main_problem_pulm_yn == true
      assert treadmill_exercise.ext_medications_yn == true
      assert treadmill_exercise.ext_mortality_cad_risk == "some ext_mortality_cad_risk"
      assert treadmill_exercise.ext_not_done_reason == "some ext_not_done_reason"
      assert treadmill_exercise.ext_on_bblockers_yn == true
      assert treadmill_exercise.ext_on_digoxin_yn == true
      assert treadmill_exercise.ext_protocole_used == "some ext_protocole_used"
      assert treadmill_exercise.ext_referral_person == "some ext_referral_person"
      assert treadmill_exercise.ext_technician_fname == "some ext_technician_fname"
      assert treadmill_exercise.ext_technician_lname == "some ext_technician_lname"
      assert treadmill_exercise.ext_tm == ~T[14:00:00]
    end

    test "create_treadmill_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_treadmill_exercise(@invalid_attrs)
    end

    test "update_treadmill_exercise/2 with valid data updates the treadmill_exercise" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:ok, %Treadmill_exercise{} = treadmill_exercise} = Ivestigations.update_treadmill_exercise(treadmill_exercise, @update_attrs)
      assert treadmill_exercise.ext_anginal_meds_yn == false
      assert treadmill_exercise.ext_cad_pretest_probability == "some updated ext_cad_pretest_probability"
      assert treadmill_exercise.ext_consent_yn == false
      assert treadmill_exercise.ext_doctor_fname == "some updated ext_doctor_fname"
      assert treadmill_exercise.ext_doctor_lname == "some updated ext_doctor_lname"
      assert treadmill_exercise.ext_dt == ~D[2011-05-18]
      assert treadmill_exercise.ext_ecg_normal_pre_yn == false
      assert treadmill_exercise.ext_indication == "some updated ext_indication"
      assert treadmill_exercise.ext_indication_notes == "some updated ext_indication_notes"
      assert treadmill_exercise.ext_is_done_yn == false
      assert treadmill_exercise.ext_lab_id == "some updated ext_lab_id"
      assert treadmill_exercise.ext_lab_num == "some updated ext_lab_num"
      assert treadmill_exercise.ext_lab_yr == "some updated ext_lab_yr"
      assert treadmill_exercise.ext_limitations == "some updated ext_limitations"
      assert treadmill_exercise.ext_limitations_relative == "some updated ext_limitations_relative"
      assert treadmill_exercise.ext_main_problem_cardiac_yn == false
      assert treadmill_exercise.ext_main_problem_medical_yn == false
      assert treadmill_exercise.ext_main_problem_notes == "some updated ext_main_problem_notes"
      assert treadmill_exercise.ext_main_problem_pulm_yn == false
      assert treadmill_exercise.ext_medications_yn == false
      assert treadmill_exercise.ext_mortality_cad_risk == "some updated ext_mortality_cad_risk"
      assert treadmill_exercise.ext_not_done_reason == "some updated ext_not_done_reason"
      assert treadmill_exercise.ext_on_bblockers_yn == false
      assert treadmill_exercise.ext_on_digoxin_yn == false
      assert treadmill_exercise.ext_protocole_used == "some updated ext_protocole_used"
      assert treadmill_exercise.ext_referral_person == "some updated ext_referral_person"
      assert treadmill_exercise.ext_technician_fname == "some updated ext_technician_fname"
      assert treadmill_exercise.ext_technician_lname == "some updated ext_technician_lname"
      assert treadmill_exercise.ext_tm == ~T[15:01:01]
    end

    test "update_treadmill_exercise/2 with invalid data returns error changeset" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_treadmill_exercise(treadmill_exercise, @invalid_attrs)
      assert treadmill_exercise == Ivestigations.get_treadmill_exercise!(treadmill_exercise.id)
    end

    test "delete_treadmill_exercise/1 deletes the treadmill_exercise" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:ok, %Treadmill_exercise{}} = Ivestigations.delete_treadmill_exercise(treadmill_exercise)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_treadmill_exercise!(treadmill_exercise.id) end
    end

    test "change_treadmill_exercise/1 returns a treadmill_exercise changeset" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_treadmill_exercise(treadmill_exercise)
    end
  end

  describe "treadmill_exercises" do
    alias Angio.Ivestigations.Treadmill_exercise

    @valid_attrs %{ext_protocole_used: "some ext_protocole_used", ext_st_depres_pre_yn: true, ext_stop_reason: "some ext_stop_reason", ext_result: "some ext_result", ext_st_depres_max_location: "some ext_st_depres_max_location", ext_consent_yn: true, ext_tm: ~T[14:00:00], ext_bp_sys_max: "some ext_bp_sys_max", ext_watts: "some ext_watts", ext_va_treadmill_score: "some ext_va_treadmill_score", ext_doctor_lname: "some ext_doctor_lname", ext_cpx_peak_vo2: "some ext_cpx_peak_vo2", ext_notes: "some ext_notes", ext_is_done_yn: true, ext_indication: "some ext_indication", ext_result_notes: "some ext_result_notes", ext_technician_fname: "some ext_technician_fname", ext_bp_sys_recovery: "some ext_bp_sys_recovery", ext_main_problem_cardiac_yn: true, ext_cpx_peak_mets: "some ext_cpx_peak_mets", ext_limitations_relative: "some ext_limitations_relative", ext_lv_hypertrophy_pre_yn: true, ext_st_elevation_max: "some ext_st_elevation_max", ext_not_done_reason: "some ext_not_done_reason", ext_st_depres_recovery_val: "some ext_st_depres_recovery_val", ext_bp_diast_rest: "some ext_bp_diast_rest", ext_stop_reason_angina_yn: true, ext_lab_id: "some ext_lab_id", ext_dt: ~D[2010-04-17], ext_compl_afib_post_yn: true, ext_borg_scale: "some ext_borg_scale", ext_cpx_ve_vco2_slope: "some ext_cpx_ve_vco2_slope", ext_aerobic_capacity_max: "some ext_aerobic_capacity_max", ext_main_problem_medical_yn: true, ext_on_bblockers_yn: true, ext_athens_score: "some ext_athens_score", ext_compl_notes: "some ext_compl_notes", ext_st_depres_max_duration: "some ext_st_depres_max_duration", ext_bp_sys_rest: "some ext_bp_sys_rest", ext_heart_rate_rest: "some ext_heart_rate_rest", ext_cpx_age_vo2: "some ext_cpx_age_vo2", ext_mortality_cad_risk: "some ext_mortality_cad_risk", ext_on_digoxin_yn: true, ext_complication_yn: true, ext_cad_pretest_probability: "some ext_cad_pretest_probability", ext_qwaves_pre: "some ext_qwaves_pre", ext_st_depres_pre_val: "some ext_st_depres_pre_val", ext_recommendations: "some ext_recommendations", ext_main_problem_pulm_yn: true, ext_st_slop_max: "some ext_st_slop_max", ...}
    @update_attrs %{ext_protocole_used: "some updated ext_protocole_used", ext_st_depres_pre_yn: false, ext_stop_reason: "some updated ext_stop_reason", ext_result: "some updated ext_result", ext_st_depres_max_location: "some updated ext_st_depres_max_location", ext_consent_yn: false, ext_tm: ~T[15:01:01], ext_bp_sys_max: "some updated ext_bp_sys_max", ext_watts: "some updated ext_watts", ext_va_treadmill_score: "some updated ext_va_treadmill_score", ext_doctor_lname: "some updated ext_doctor_lname", ext_cpx_peak_vo2: "some updated ext_cpx_peak_vo2", ext_notes: "some updated ext_notes", ext_is_done_yn: false, ext_indication: "some updated ext_indication", ext_result_notes: "some updated ext_result_notes", ext_technician_fname: "some updated ext_technician_fname", ext_bp_sys_recovery: "some updated ext_bp_sys_recovery", ext_main_problem_cardiac_yn: false, ext_cpx_peak_mets: "some updated ext_cpx_peak_mets", ext_limitations_relative: "some updated ext_limitations_relative", ext_lv_hypertrophy_pre_yn: false, ext_st_elevation_max: "some updated ext_st_elevation_max", ext_not_done_reason: "some updated ext_not_done_reason", ext_st_depres_recovery_val: "some updated ext_st_depres_recovery_val", ext_bp_diast_rest: "some updated ext_bp_diast_rest", ext_stop_reason_angina_yn: false, ext_lab_id: "some updated ext_lab_id", ext_dt: ~D[2011-05-18], ext_compl_afib_post_yn: false, ext_borg_scale: "some updated ext_borg_scale", ext_cpx_ve_vco2_slope: "some updated ext_cpx_ve_vco2_slope", ext_aerobic_capacity_max: "some updated ext_aerobic_capacity_max", ext_main_problem_medical_yn: false, ext_on_bblockers_yn: false, ext_athens_score: "some updated ext_athens_score", ext_compl_notes: "some updated ext_compl_notes", ext_st_depres_max_duration: "some updated ext_st_depres_max_duration", ext_bp_sys_rest: "some updated ext_bp_sys_rest", ext_heart_rate_rest: "some updated ext_heart_rate_rest", ext_cpx_age_vo2: "some updated ext_cpx_age_vo2", ext_mortality_cad_risk: "some updated ext_mortality_cad_risk", ext_on_digoxin_yn: false, ext_complication_yn: false, ext_cad_pretest_probability: "some updated ext_cad_pretest_probability", ext_qwaves_pre: "some updated ext_qwaves_pre", ext_st_depres_pre_val: "some updated ext_st_depres_pre_val", ext_recommendations: "some updated ext_recommendations", ext_main_problem_pulm_yn: false, ext_st_slop_max: "some updated ext_st_slop_max", ...}
    @invalid_attrs %{ext_protocole_used: nil, ext_st_depres_pre_yn: nil, ext_stop_reason: nil, ext_result: nil, ext_st_depres_max_location: nil, ext_consent_yn: nil, ext_tm: nil, ext_bp_sys_max: nil, ext_watts: nil, ext_va_treadmill_score: nil, ext_doctor_lname: nil, ext_cpx_peak_vo2: nil, ext_notes: nil, ext_is_done_yn: nil, ext_indication: nil, ext_result_notes: nil, ext_technician_fname: nil, ext_bp_sys_recovery: nil, ext_main_problem_cardiac_yn: nil, ext_cpx_peak_mets: nil, ext_limitations_relative: nil, ext_lv_hypertrophy_pre_yn: nil, ext_st_elevation_max: nil, ext_not_done_reason: nil, ext_st_depres_recovery_val: nil, ext_bp_diast_rest: nil, ext_stop_reason_angina_yn: nil, ext_lab_id: nil, ext_dt: nil, ext_compl_afib_post_yn: nil, ext_borg_scale: nil, ext_cpx_ve_vco2_slope: nil, ext_aerobic_capacity_max: nil, ext_main_problem_medical_yn: nil, ext_on_bblockers_yn: nil, ext_athens_score: nil, ext_compl_notes: nil, ext_st_depres_max_duration: nil, ext_bp_sys_rest: nil, ext_heart_rate_rest: nil, ext_cpx_age_vo2: nil, ext_mortality_cad_risk: nil, ext_on_digoxin_yn: nil, ext_complication_yn: nil, ext_cad_pretest_probability: nil, ext_qwaves_pre: nil, ext_st_depres_pre_val: nil, ext_recommendations: nil, ext_main_problem_pulm_yn: nil, ext_st_slop_max: nil, ...}

    def treadmill_exercise_fixture(attrs \\ %{}) do
      {:ok, treadmill_exercise} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_treadmill_exercise()

      treadmill_exercise
    end

    test "list_treadmill_exercises/0 returns all treadmill_exercises" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert Ivestigations.list_treadmill_exercises() == [treadmill_exercise]
    end

    test "get_treadmill_exercise!/1 returns the treadmill_exercise with given id" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert Ivestigations.get_treadmill_exercise!(treadmill_exercise.id) == treadmill_exercise
    end

    test "create_treadmill_exercise/1 with valid data creates a treadmill_exercise" do
      assert {:ok, %Treadmill_exercise{} = treadmill_exercise} = Ivestigations.create_treadmill_exercise(@valid_attrs)
      assert treadmill_exercise.ext_medications_yn == true
      assert treadmill_exercise.ext_stopping_reason_notes == "some ext_stopping_reason_notes"
      assert treadmill_exercise.ext_stop_reason_other_yn == true
      assert treadmill_exercise.ext_angina_severe_post_yn == true
      assert treadmill_exercise.ext_cardio_shock_post_yn == true
      assert treadmill_exercise.ext_cpx_vo2_ventilatory_response == "some ext_cpx_vo2_ventilatory_response"
      assert treadmill_exercise.ext_lab_num == "some ext_lab_num"
      assert treadmill_exercise.ext_heart_rate_at_max_st_depres == "some ext_heart_rate_at_max_st_depres"
      assert treadmill_exercise.ext_referral_person == "some ext_referral_person"
      assert treadmill_exercise.ext_st_depres_recovery_location == "some ext_st_depres_recovery_location"
      assert treadmill_exercise.ext_cpr_post_yn == true
      assert treadmill_exercise.ext_compl_other_yn == true
      assert treadmill_exercise.ext_heart_rate_max_predicted == "some ext_heart_rate_max_predicted"
      assert treadmill_exercise.ext_vt_post_yn == true
      assert treadmill_exercise.ext_indication_notes == "some ext_indication_notes"
      assert treadmill_exercise.ext_afib_pre_yn == true
      assert treadmill_exercise.ext_st_depres_max == "some ext_st_depres_max"
      assert treadmill_exercise.ext_stages_completed == "some ext_stages_completed"
      assert treadmill_exercise.ext_anginal_meds_yn == true
      assert treadmill_exercise.ext_technician_lname == "some ext_technician_lname"
      assert treadmill_exercise.ext_t_wave_inversion_pre_yn == true
      assert treadmill_exercise.ext_qrs_morphology_pre == []
      assert treadmill_exercise.ext_bradycardia_post_yn == true
      assert treadmill_exercise.ext_lab_yr == "some ext_lab_yr"
      assert treadmill_exercise.ext_main_problem_notes == "some ext_main_problem_notes"
      assert treadmill_exercise.ext_bp_diast_max == "some ext_bp_diast_max"
      assert treadmill_exercise.ext_ecg_normal_pre_yn == true
      assert treadmill_exercise.ext_heart_rate_achieved == "some ext_heart_rate_achieved"
      assert treadmill_exercise.ext_mets == "some ext_mets"
      assert treadmill_exercise.ext_limitations == "some ext_limitations"
      assert treadmill_exercise.ext_bp_diast_recovery == "some ext_bp_diast_recovery"
      assert treadmill_exercise.ext_pvc_pre_yn == true
      assert treadmill_exercise.ext_duke_score == "some ext_duke_score"
      assert treadmill_exercise.ext_mi_post_yn == true
      assert treadmill_exercise.ext_doctor_fname == "some ext_doctor_fname"
      assert treadmill_exercise.ext_need_hold_handrails_yn == true
      assert treadmill_exercise.ext_st_slop_max == "some ext_st_slop_max"
      assert treadmill_exercise.ext_main_problem_pulm_yn == true
      assert treadmill_exercise.ext_recommendations == "some ext_recommendations"
      assert treadmill_exercise.ext_st_depres_pre_val == "some ext_st_depres_pre_val"
      assert treadmill_exercise.ext_qwaves_pre == "some ext_qwaves_pre"
      assert treadmill_exercise.ext_cad_pretest_probability == "some ext_cad_pretest_probability"
      assert treadmill_exercise.ext_complication_yn == true
      assert treadmill_exercise.ext_on_digoxin_yn == true
      assert treadmill_exercise.ext_mortality_cad_risk == "some ext_mortality_cad_risk"
      assert treadmill_exercise.ext_cpx_age_vo2 == "some ext_cpx_age_vo2"
      assert treadmill_exercise.ext_heart_rate_rest == "some ext_heart_rate_rest"
      assert treadmill_exercise.ext_bp_sys_rest == "some ext_bp_sys_rest"
      assert treadmill_exercise.ext_st_depres_max_duration == "some ext_st_depres_max_duration"
      assert treadmill_exercise.ext_compl_notes == "some ext_compl_notes"
      assert treadmill_exercise.ext_athens_score == "some ext_athens_score"
      assert treadmill_exercise.ext_on_bblockers_yn == true
      assert treadmill_exercise.ext_main_problem_medical_yn == true
      assert treadmill_exercise.ext_aerobic_capacity_max == "some ext_aerobic_capacity_max"
      assert treadmill_exercise.ext_cpx_ve_vco2_slope == "some ext_cpx_ve_vco2_slope"
      assert treadmill_exercise.ext_borg_scale == "some ext_borg_scale"
      assert treadmill_exercise.ext_compl_afib_post_yn == true
      assert treadmill_exercise.ext_dt == ~D[2010-04-17]
      assert treadmill_exercise.ext_lab_id == "some ext_lab_id"
      assert treadmill_exercise.ext_stop_reason_angina_yn == true
      assert treadmill_exercise.ext_bp_diast_rest == "some ext_bp_diast_rest"
      assert treadmill_exercise.ext_st_depres_recovery_val == "some ext_st_depres_recovery_val"
      assert treadmill_exercise.ext_not_done_reason == "some ext_not_done_reason"
      assert treadmill_exercise.ext_st_elevation_max == "some ext_st_elevation_max"
      assert treadmill_exercise.ext_lv_hypertrophy_pre_yn == true
      assert treadmill_exercise.ext_limitations_relative == "some ext_limitations_relative"
      assert treadmill_exercise.ext_cpx_peak_mets == "some ext_cpx_peak_mets"
      assert treadmill_exercise.ext_main_problem_cardiac_yn == true
      assert treadmill_exercise.ext_bp_sys_recovery == "some ext_bp_sys_recovery"
      assert treadmill_exercise.ext_technician_fname == "some ext_technician_fname"
      assert treadmill_exercise.ext_result_notes == "some ext_result_notes"
      assert treadmill_exercise.ext_indication == "some ext_indication"
      assert treadmill_exercise.ext_is_done_yn == true
      assert treadmill_exercise.ext_notes == "some ext_notes"
      assert treadmill_exercise.ext_cpx_peak_vo2 == "some ext_cpx_peak_vo2"
      assert treadmill_exercise.ext_doctor_lname == "some ext_doctor_lname"
      assert treadmill_exercise.ext_va_treadmill_score == "some ext_va_treadmill_score"
      assert treadmill_exercise.ext_watts == "some ext_watts"
      assert treadmill_exercise.ext_bp_sys_max == "some ext_bp_sys_max"
      assert treadmill_exercise.ext_tm == ~T[14:00:00]
      assert treadmill_exercise.ext_consent_yn == true
      assert treadmill_exercise.ext_st_depres_max_location == "some ext_st_depres_max_location"
      assert treadmill_exercise.ext_result == "some ext_result"
      assert treadmill_exercise.ext_stop_reason == "some ext_stop_reason"
      assert treadmill_exercise.ext_st_depres_pre_yn == true
      assert treadmill_exercise.ext_protocole_used == "some ext_protocole_used"
    end

    test "create_treadmill_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_treadmill_exercise(@invalid_attrs)
    end

    test "update_treadmill_exercise/2 with valid data updates the treadmill_exercise" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:ok, %Treadmill_exercise{} = treadmill_exercise} = Ivestigations.update_treadmill_exercise(treadmill_exercise, @update_attrs)
      assert treadmill_exercise.ext_medications_yn == false
      assert treadmill_exercise.ext_stopping_reason_notes == "some updated ext_stopping_reason_notes"
      assert treadmill_exercise.ext_stop_reason_other_yn == false
      assert treadmill_exercise.ext_angina_severe_post_yn == false
      assert treadmill_exercise.ext_cardio_shock_post_yn == false
      assert treadmill_exercise.ext_cpx_vo2_ventilatory_response == "some updated ext_cpx_vo2_ventilatory_response"
      assert treadmill_exercise.ext_lab_num == "some updated ext_lab_num"
      assert treadmill_exercise.ext_heart_rate_at_max_st_depres == "some updated ext_heart_rate_at_max_st_depres"
      assert treadmill_exercise.ext_referral_person == "some updated ext_referral_person"
      assert treadmill_exercise.ext_st_depres_recovery_location == "some updated ext_st_depres_recovery_location"
      assert treadmill_exercise.ext_cpr_post_yn == false
      assert treadmill_exercise.ext_compl_other_yn == false
      assert treadmill_exercise.ext_heart_rate_max_predicted == "some updated ext_heart_rate_max_predicted"
      assert treadmill_exercise.ext_vt_post_yn == false
      assert treadmill_exercise.ext_indication_notes == "some updated ext_indication_notes"
      assert treadmill_exercise.ext_afib_pre_yn == false
      assert treadmill_exercise.ext_st_depres_max == "some updated ext_st_depres_max"
      assert treadmill_exercise.ext_stages_completed == "some updated ext_stages_completed"
      assert treadmill_exercise.ext_anginal_meds_yn == false
      assert treadmill_exercise.ext_technician_lname == "some updated ext_technician_lname"
      assert treadmill_exercise.ext_t_wave_inversion_pre_yn == false
      assert treadmill_exercise.ext_qrs_morphology_pre == []
      assert treadmill_exercise.ext_bradycardia_post_yn == false
      assert treadmill_exercise.ext_lab_yr == "some updated ext_lab_yr"
      assert treadmill_exercise.ext_main_problem_notes == "some updated ext_main_problem_notes"
      assert treadmill_exercise.ext_bp_diast_max == "some updated ext_bp_diast_max"
      assert treadmill_exercise.ext_ecg_normal_pre_yn == false
      assert treadmill_exercise.ext_heart_rate_achieved == "some updated ext_heart_rate_achieved"
      assert treadmill_exercise.ext_mets == "some updated ext_mets"
      assert treadmill_exercise.ext_limitations == "some updated ext_limitations"
      assert treadmill_exercise.ext_bp_diast_recovery == "some updated ext_bp_diast_recovery"
      assert treadmill_exercise.ext_pvc_pre_yn == false
      assert treadmill_exercise.ext_duke_score == "some updated ext_duke_score"
      assert treadmill_exercise.ext_mi_post_yn == false
      assert treadmill_exercise.ext_doctor_fname == "some updated ext_doctor_fname"
      assert treadmill_exercise.ext_need_hold_handrails_yn == false
      assert treadmill_exercise.ext_st_slop_max == "some updated ext_st_slop_max"
      assert treadmill_exercise.ext_main_problem_pulm_yn == false
      assert treadmill_exercise.ext_recommendations == "some updated ext_recommendations"
      assert treadmill_exercise.ext_st_depres_pre_val == "some updated ext_st_depres_pre_val"
      assert treadmill_exercise.ext_qwaves_pre == "some updated ext_qwaves_pre"
      assert treadmill_exercise.ext_cad_pretest_probability == "some updated ext_cad_pretest_probability"
      assert treadmill_exercise.ext_complication_yn == false
      assert treadmill_exercise.ext_on_digoxin_yn == false
      assert treadmill_exercise.ext_mortality_cad_risk == "some updated ext_mortality_cad_risk"
      assert treadmill_exercise.ext_cpx_age_vo2 == "some updated ext_cpx_age_vo2"
      assert treadmill_exercise.ext_heart_rate_rest == "some updated ext_heart_rate_rest"
      assert treadmill_exercise.ext_bp_sys_rest == "some updated ext_bp_sys_rest"
      assert treadmill_exercise.ext_st_depres_max_duration == "some updated ext_st_depres_max_duration"
      assert treadmill_exercise.ext_compl_notes == "some updated ext_compl_notes"
      assert treadmill_exercise.ext_athens_score == "some updated ext_athens_score"
      assert treadmill_exercise.ext_on_bblockers_yn == false
      assert treadmill_exercise.ext_main_problem_medical_yn == false
      assert treadmill_exercise.ext_aerobic_capacity_max == "some updated ext_aerobic_capacity_max"
      assert treadmill_exercise.ext_cpx_ve_vco2_slope == "some updated ext_cpx_ve_vco2_slope"
      assert treadmill_exercise.ext_borg_scale == "some updated ext_borg_scale"
      assert treadmill_exercise.ext_compl_afib_post_yn == false
      assert treadmill_exercise.ext_dt == ~D[2011-05-18]
      assert treadmill_exercise.ext_lab_id == "some updated ext_lab_id"
      assert treadmill_exercise.ext_stop_reason_angina_yn == false
      assert treadmill_exercise.ext_bp_diast_rest == "some updated ext_bp_diast_rest"
      assert treadmill_exercise.ext_st_depres_recovery_val == "some updated ext_st_depres_recovery_val"
      assert treadmill_exercise.ext_not_done_reason == "some updated ext_not_done_reason"
      assert treadmill_exercise.ext_st_elevation_max == "some updated ext_st_elevation_max"
      assert treadmill_exercise.ext_lv_hypertrophy_pre_yn == false
      assert treadmill_exercise.ext_limitations_relative == "some updated ext_limitations_relative"
      assert treadmill_exercise.ext_cpx_peak_mets == "some updated ext_cpx_peak_mets"
      assert treadmill_exercise.ext_main_problem_cardiac_yn == false
      assert treadmill_exercise.ext_bp_sys_recovery == "some updated ext_bp_sys_recovery"
      assert treadmill_exercise.ext_technician_fname == "some updated ext_technician_fname"
      assert treadmill_exercise.ext_result_notes == "some updated ext_result_notes"
      assert treadmill_exercise.ext_indication == "some updated ext_indication"
      assert treadmill_exercise.ext_is_done_yn == false
      assert treadmill_exercise.ext_notes == "some updated ext_notes"
      assert treadmill_exercise.ext_cpx_peak_vo2 == "some updated ext_cpx_peak_vo2"
      assert treadmill_exercise.ext_doctor_lname == "some updated ext_doctor_lname"
      assert treadmill_exercise.ext_va_treadmill_score == "some updated ext_va_treadmill_score"
      assert treadmill_exercise.ext_watts == "some updated ext_watts"
      assert treadmill_exercise.ext_bp_sys_max == "some updated ext_bp_sys_max"
      assert treadmill_exercise.ext_tm == ~T[15:01:01]
      assert treadmill_exercise.ext_consent_yn == false
      assert treadmill_exercise.ext_st_depres_max_location == "some updated ext_st_depres_max_location"
      assert treadmill_exercise.ext_result == "some updated ext_result"
      assert treadmill_exercise.ext_stop_reason == "some updated ext_stop_reason"
      assert treadmill_exercise.ext_st_depres_pre_yn == false
      assert treadmill_exercise.ext_protocole_used == "some updated ext_protocole_used"
    end

    test "update_treadmill_exercise/2 with invalid data returns error changeset" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_treadmill_exercise(treadmill_exercise, @invalid_attrs)
      assert treadmill_exercise == Ivestigations.get_treadmill_exercise!(treadmill_exercise.id)
    end

    test "delete_treadmill_exercise/1 deletes the treadmill_exercise" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert {:ok, %Treadmill_exercise{}} = Ivestigations.delete_treadmill_exercise(treadmill_exercise)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_treadmill_exercise!(treadmill_exercise.id) end
    end

    test "change_treadmill_exercise/1 returns a treadmill_exercise changeset" do
      treadmill_exercise = treadmill_exercise_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_treadmill_exercise(treadmill_exercise)
    end
  end

  describe "cardiac_echoes" do
    alias Angio.Ivestigations.Cardiac_echo

    @valid_attrs %{echo_referring_doctor_2: "some echo_referring_doctor_2", echo_summary_report: "some echo_summary_report", echo_start_dt: ~D[2010-04-17], echo_reason: "some echo_reason", echo_start_tm: ~T[14:00:00], echo_maschine_type: "some echo_maschine_type", echo_study_protocole: "some echo_study_protocole", echo_lab_num: "some echo_lab_num", echo_doctor_reading: "some echo_doctor_reading", echo_patient_location: "some echo_patient_location", echo_study_location: "some echo_study_location", echo_priority: "some echo_priority", echo_performed_yn: true, sonographer_name: "some sonographer_name", echo_pt_height: "some echo_pt_height", echo_doctor_interpeting_group: "some echo_doctor_interpeting_group", echo_pt_weight: "some echo_pt_weight", echo_doctor_reading_npi: "some echo_doctor_reading_npi", echo_media_location: "some echo_media_location", echo_doctor_operator: "some echo_doctor_operator", echo_stop_tm: ~T[14:00:00], echo_requested_dt: ~D[2010-04-17], echo_heart_rate: "some echo_heart_rate", echo_blood_pressure_sys: "some echo_blood_pressure_sys", echo_idication_icd10cm: "some echo_idication_icd10cm", echo_consent_yn: true, echo_afib_yn: true, echo_lab_id: "some echo_lab_id", echo_bsa: "some echo_bsa", echo_referring_doctor_1: "some echo_referring_doctor_1", echo_lab_num_yr: "some echo_lab_num_yr", echo_indication: "some echo_indication", echo_blood_pressure_diast: "some echo_blood_pressure_diast"}
    @update_attrs %{echo_referring_doctor_2: "some updated echo_referring_doctor_2", echo_summary_report: "some updated echo_summary_report", echo_start_dt: ~D[2011-05-18], echo_reason: "some updated echo_reason", echo_start_tm: ~T[15:01:01], echo_maschine_type: "some updated echo_maschine_type", echo_study_protocole: "some updated echo_study_protocole", echo_lab_num: "some updated echo_lab_num", echo_doctor_reading: "some updated echo_doctor_reading", echo_patient_location: "some updated echo_patient_location", echo_study_location: "some updated echo_study_location", echo_priority: "some updated echo_priority", echo_performed_yn: false, sonographer_name: "some updated sonographer_name", echo_pt_height: "some updated echo_pt_height", echo_doctor_interpeting_group: "some updated echo_doctor_interpeting_group", echo_pt_weight: "some updated echo_pt_weight", echo_doctor_reading_npi: "some updated echo_doctor_reading_npi", echo_media_location: "some updated echo_media_location", echo_doctor_operator: "some updated echo_doctor_operator", echo_stop_tm: ~T[15:01:01], echo_requested_dt: ~D[2011-05-18], echo_heart_rate: "some updated echo_heart_rate", echo_blood_pressure_sys: "some updated echo_blood_pressure_sys", echo_idication_icd10cm: "some updated echo_idication_icd10cm", echo_consent_yn: false, echo_afib_yn: false, echo_lab_id: "some updated echo_lab_id", echo_bsa: "some updated echo_bsa", echo_referring_doctor_1: "some updated echo_referring_doctor_1", echo_lab_num_yr: "some updated echo_lab_num_yr", echo_indication: "some updated echo_indication", echo_blood_pressure_diast: "some updated echo_blood_pressure_diast"}
    @invalid_attrs %{echo_referring_doctor_2: nil, echo_summary_report: nil, echo_start_dt: nil, echo_reason: nil, echo_start_tm: nil, echo_maschine_type: nil, echo_study_protocole: nil, echo_lab_num: nil, echo_doctor_reading: nil, echo_patient_location: nil, echo_study_location: nil, echo_priority: nil, echo_performed_yn: nil, sonographer_name: nil, echo_pt_height: nil, echo_doctor_interpeting_group: nil, echo_pt_weight: nil, echo_doctor_reading_npi: nil, echo_media_location: nil, echo_doctor_operator: nil, echo_stop_tm: nil, echo_requested_dt: nil, echo_heart_rate: nil, echo_blood_pressure_sys: nil, echo_idication_icd10cm: nil, echo_consent_yn: nil, echo_afib_yn: nil, echo_lab_id: nil, echo_bsa: nil, echo_referring_doctor_1: nil, echo_lab_num_yr: nil, echo_indication: nil, echo_blood_pressure_diast: nil}

    def cardiac_echo_fixture(attrs \\ %{}) do
      {:ok, cardiac_echo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_cardiac_echo()

      cardiac_echo
    end

    test "list_cardiac_echoes/0 returns all cardiac_echoes" do
      cardiac_echo = cardiac_echo_fixture()
      assert Ivestigations.list_cardiac_echoes() == [cardiac_echo]
    end

    test "get_cardiac_echo!/1 returns the cardiac_echo with given id" do
      cardiac_echo = cardiac_echo_fixture()
      assert Ivestigations.get_cardiac_echo!(cardiac_echo.id) == cardiac_echo
    end

    test "create_cardiac_echo/1 with valid data creates a cardiac_echo" do
      assert {:ok, %Cardiac_echo{} = cardiac_echo} = Ivestigations.create_cardiac_echo(@valid_attrs)
      assert cardiac_echo.echo_blood_pressure_diast == "some echo_blood_pressure_diast"
      assert cardiac_echo.echo_indication == "some echo_indication"
      assert cardiac_echo.echo_lab_num_yr == "some echo_lab_num_yr"
      assert cardiac_echo.echo_referring_doctor_1 == "some echo_referring_doctor_1"
      assert cardiac_echo.echo_bsa == "some echo_bsa"
      assert cardiac_echo.echo_lab_id == "some echo_lab_id"
      assert cardiac_echo.echo_afib_yn == true
      assert cardiac_echo.echo_consent_yn == true
      assert cardiac_echo.echo_idication_icd10cm == "some echo_idication_icd10cm"
      assert cardiac_echo.echo_blood_pressure_sys == "some echo_blood_pressure_sys"
      assert cardiac_echo.echo_heart_rate == "some echo_heart_rate"
      assert cardiac_echo.echo_requested_dt == ~D[2010-04-17]
      assert cardiac_echo.echo_stop_tm == ~T[14:00:00]
      assert cardiac_echo.echo_doctor_operator == "some echo_doctor_operator"
      assert cardiac_echo.echo_media_location == "some echo_media_location"
      assert cardiac_echo.echo_doctor_reading_npi == "some echo_doctor_reading_npi"
      assert cardiac_echo.echo_pt_weight == "some echo_pt_weight"
      assert cardiac_echo.echo_doctor_interpeting_group == "some echo_doctor_interpeting_group"
      assert cardiac_echo.echo_pt_height == "some echo_pt_height"
      assert cardiac_echo.sonographer_name == "some sonographer_name"
      assert cardiac_echo.echo_performed_yn == true
      assert cardiac_echo.echo_priority == "some echo_priority"
      assert cardiac_echo.echo_study_location == "some echo_study_location"
      assert cardiac_echo.echo_patient_location == "some echo_patient_location"
      assert cardiac_echo.echo_doctor_reading == "some echo_doctor_reading"
      assert cardiac_echo.echo_lab_num == "some echo_lab_num"
      assert cardiac_echo.echo_study_protocole == "some echo_study_protocole"
      assert cardiac_echo.echo_maschine_type == "some echo_maschine_type"
      assert cardiac_echo.echo_start_tm == ~T[14:00:00]
      assert cardiac_echo.echo_reason == "some echo_reason"
      assert cardiac_echo.echo_start_dt == ~D[2010-04-17]
      assert cardiac_echo.echo_summary_report == "some echo_summary_report"
      assert cardiac_echo.echo_referring_doctor_2 == "some echo_referring_doctor_2"
    end

    test "create_cardiac_echo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_cardiac_echo(@invalid_attrs)
    end

    test "update_cardiac_echo/2 with valid data updates the cardiac_echo" do
      cardiac_echo = cardiac_echo_fixture()
      assert {:ok, %Cardiac_echo{} = cardiac_echo} = Ivestigations.update_cardiac_echo(cardiac_echo, @update_attrs)
      assert cardiac_echo.echo_blood_pressure_diast == "some updated echo_blood_pressure_diast"
      assert cardiac_echo.echo_indication == "some updated echo_indication"
      assert cardiac_echo.echo_lab_num_yr == "some updated echo_lab_num_yr"
      assert cardiac_echo.echo_referring_doctor_1 == "some updated echo_referring_doctor_1"
      assert cardiac_echo.echo_bsa == "some updated echo_bsa"
      assert cardiac_echo.echo_lab_id == "some updated echo_lab_id"
      assert cardiac_echo.echo_afib_yn == false
      assert cardiac_echo.echo_consent_yn == false
      assert cardiac_echo.echo_idication_icd10cm == "some updated echo_idication_icd10cm"
      assert cardiac_echo.echo_blood_pressure_sys == "some updated echo_blood_pressure_sys"
      assert cardiac_echo.echo_heart_rate == "some updated echo_heart_rate"
      assert cardiac_echo.echo_requested_dt == ~D[2011-05-18]
      assert cardiac_echo.echo_stop_tm == ~T[15:01:01]
      assert cardiac_echo.echo_doctor_operator == "some updated echo_doctor_operator"
      assert cardiac_echo.echo_media_location == "some updated echo_media_location"
      assert cardiac_echo.echo_doctor_reading_npi == "some updated echo_doctor_reading_npi"
      assert cardiac_echo.echo_pt_weight == "some updated echo_pt_weight"
      assert cardiac_echo.echo_doctor_interpeting_group == "some updated echo_doctor_interpeting_group"
      assert cardiac_echo.echo_pt_height == "some updated echo_pt_height"
      assert cardiac_echo.sonographer_name == "some updated sonographer_name"
      assert cardiac_echo.echo_performed_yn == false
      assert cardiac_echo.echo_priority == "some updated echo_priority"
      assert cardiac_echo.echo_study_location == "some updated echo_study_location"
      assert cardiac_echo.echo_patient_location == "some updated echo_patient_location"
      assert cardiac_echo.echo_doctor_reading == "some updated echo_doctor_reading"
      assert cardiac_echo.echo_lab_num == "some updated echo_lab_num"
      assert cardiac_echo.echo_study_protocole == "some updated echo_study_protocole"
      assert cardiac_echo.echo_maschine_type == "some updated echo_maschine_type"
      assert cardiac_echo.echo_start_tm == ~T[15:01:01]
      assert cardiac_echo.echo_reason == "some updated echo_reason"
      assert cardiac_echo.echo_start_dt == ~D[2011-05-18]
      assert cardiac_echo.echo_summary_report == "some updated echo_summary_report"
      assert cardiac_echo.echo_referring_doctor_2 == "some updated echo_referring_doctor_2"
    end

    test "update_cardiac_echo/2 with invalid data returns error changeset" do
      cardiac_echo = cardiac_echo_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_cardiac_echo(cardiac_echo, @invalid_attrs)
      assert cardiac_echo == Ivestigations.get_cardiac_echo!(cardiac_echo.id)
    end

    test "delete_cardiac_echo/1 deletes the cardiac_echo" do
      cardiac_echo = cardiac_echo_fixture()
      assert {:ok, %Cardiac_echo{}} = Ivestigations.delete_cardiac_echo(cardiac_echo)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_cardiac_echo!(cardiac_echo.id) end
    end

    test "change_cardiac_echo/1 returns a cardiac_echo changeset" do
      cardiac_echo = cardiac_echo_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_cardiac_echo(cardiac_echo)
    end
  end

  describe "echo_left_atriums" do
    alias Angio.Ivestigations.Echo_left_atrium

    @valid_attrs %{ela_appearance_trasplantation_yn: true, ela_area_4ch_2d_us: "some ela_area_4ch_2d_us", ela_asd_yn: true, ela_chatheter_loc_desc: "some ela_chatheter_loc_desc", ela_chatheter_yn: true, ela_cor_triatrium_yn: true, ela_diam_ap_val: "some ela_diam_ap_val", ela_diam_ml_val: "some ela_diam_ml_val", ela_diam_si_val: "some ela_diam_si_val", ela_mas_attachment_site: "some ela_mas_attachment_site", ela_mas_location_desc: "some ela_mas_location_desc", ela_mas_yn: true, ela_notes: "some ela_notes", ela_pum_veins_thrombus_tumour_yn: true, ela_spontaneous_contrast_loc: "some ela_spontaneous_contrast_loc", ela_spontaneous_contrast_persist: "some ela_spontaneous_contrast_persist", ela_spontaneous_contrast_yn: true, ela_thromus_tumour_body_loc: "some ela_thromus_tumour_body_loc", ela_volume_desc: "some ela_volume_desc", ela_volume_index: "some ela_volume_index", ela_volume_method: "some ela_volume_method", ela_volume_val: "some ela_volume_val"}
    @update_attrs %{ela_appearance_trasplantation_yn: false, ela_area_4ch_2d_us: "some updated ela_area_4ch_2d_us", ela_asd_yn: false, ela_chatheter_loc_desc: "some updated ela_chatheter_loc_desc", ela_chatheter_yn: false, ela_cor_triatrium_yn: false, ela_diam_ap_val: "some updated ela_diam_ap_val", ela_diam_ml_val: "some updated ela_diam_ml_val", ela_diam_si_val: "some updated ela_diam_si_val", ela_mas_attachment_site: "some updated ela_mas_attachment_site", ela_mas_location_desc: "some updated ela_mas_location_desc", ela_mas_yn: false, ela_notes: "some updated ela_notes", ela_pum_veins_thrombus_tumour_yn: false, ela_spontaneous_contrast_loc: "some updated ela_spontaneous_contrast_loc", ela_spontaneous_contrast_persist: "some updated ela_spontaneous_contrast_persist", ela_spontaneous_contrast_yn: false, ela_thromus_tumour_body_loc: "some updated ela_thromus_tumour_body_loc", ela_volume_desc: "some updated ela_volume_desc", ela_volume_index: "some updated ela_volume_index", ela_volume_method: "some updated ela_volume_method", ela_volume_val: "some updated ela_volume_val"}
    @invalid_attrs %{ela_appearance_trasplantation_yn: nil, ela_area_4ch_2d_us: nil, ela_asd_yn: nil, ela_chatheter_loc_desc: nil, ela_chatheter_yn: nil, ela_cor_triatrium_yn: nil, ela_diam_ap_val: nil, ela_diam_ml_val: nil, ela_diam_si_val: nil, ela_mas_attachment_site: nil, ela_mas_location_desc: nil, ela_mas_yn: nil, ela_notes: nil, ela_pum_veins_thrombus_tumour_yn: nil, ela_spontaneous_contrast_loc: nil, ela_spontaneous_contrast_persist: nil, ela_spontaneous_contrast_yn: nil, ela_thromus_tumour_body_loc: nil, ela_volume_desc: nil, ela_volume_index: nil, ela_volume_method: nil, ela_volume_val: nil}

    def echo_left_atrium_fixture(attrs \\ %{}) do
      {:ok, echo_left_atrium} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_echo_left_atrium()

      echo_left_atrium
    end

    test "list_echo_left_atriums/0 returns all echo_left_atriums" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert Ivestigations.list_echo_left_atriums() == [echo_left_atrium]
    end

    test "get_echo_left_atrium!/1 returns the echo_left_atrium with given id" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert Ivestigations.get_echo_left_atrium!(echo_left_atrium.id) == echo_left_atrium
    end

    test "create_echo_left_atrium/1 with valid data creates a echo_left_atrium" do
      assert {:ok, %Echo_left_atrium{} = echo_left_atrium} = Ivestigations.create_echo_left_atrium(@valid_attrs)
      assert echo_left_atrium.ela_appearance_trasplantation_yn == true
      assert echo_left_atrium.ela_area_4ch_2d_us == "some ela_area_4ch_2d_us"
      assert echo_left_atrium.ela_asd_yn == true
      assert echo_left_atrium.ela_chatheter_loc_desc == "some ela_chatheter_loc_desc"
      assert echo_left_atrium.ela_chatheter_yn == true
      assert echo_left_atrium.ela_cor_triatrium_yn == true
      assert echo_left_atrium.ela_diam_ap_val == "some ela_diam_ap_val"
      assert echo_left_atrium.ela_diam_ml_val == "some ela_diam_ml_val"
      assert echo_left_atrium.ela_diam_si_val == "some ela_diam_si_val"
      assert echo_left_atrium.ela_mas_attachment_site == "some ela_mas_attachment_site"
      assert echo_left_atrium.ela_mas_location_desc == "some ela_mas_location_desc"
      assert echo_left_atrium.ela_mas_yn == true
      assert echo_left_atrium.ela_notes == "some ela_notes"
      assert echo_left_atrium.ela_pum_veins_thrombus_tumour_yn == true
      assert echo_left_atrium.ela_spontaneous_contrast_loc == "some ela_spontaneous_contrast_loc"
      assert echo_left_atrium.ela_spontaneous_contrast_persist == "some ela_spontaneous_contrast_persist"
      assert echo_left_atrium.ela_spontaneous_contrast_yn == true
      assert echo_left_atrium.ela_thromus_tumour_body_loc == "some ela_thromus_tumour_body_loc"
      assert echo_left_atrium.ela_volume_desc == "some ela_volume_desc"
      assert echo_left_atrium.ela_volume_index == "some ela_volume_index"
      assert echo_left_atrium.ela_volume_method == "some ela_volume_method"
      assert echo_left_atrium.ela_volume_val == "some ela_volume_val"
    end

    test "create_echo_left_atrium/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_echo_left_atrium(@invalid_attrs)
    end

    test "update_echo_left_atrium/2 with valid data updates the echo_left_atrium" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert {:ok, %Echo_left_atrium{} = echo_left_atrium} = Ivestigations.update_echo_left_atrium(echo_left_atrium, @update_attrs)
      assert echo_left_atrium.ela_appearance_trasplantation_yn == false
      assert echo_left_atrium.ela_area_4ch_2d_us == "some updated ela_area_4ch_2d_us"
      assert echo_left_atrium.ela_asd_yn == false
      assert echo_left_atrium.ela_chatheter_loc_desc == "some updated ela_chatheter_loc_desc"
      assert echo_left_atrium.ela_chatheter_yn == false
      assert echo_left_atrium.ela_cor_triatrium_yn == false
      assert echo_left_atrium.ela_diam_ap_val == "some updated ela_diam_ap_val"
      assert echo_left_atrium.ela_diam_ml_val == "some updated ela_diam_ml_val"
      assert echo_left_atrium.ela_diam_si_val == "some updated ela_diam_si_val"
      assert echo_left_atrium.ela_mas_attachment_site == "some updated ela_mas_attachment_site"
      assert echo_left_atrium.ela_mas_location_desc == "some updated ela_mas_location_desc"
      assert echo_left_atrium.ela_mas_yn == false
      assert echo_left_atrium.ela_notes == "some updated ela_notes"
      assert echo_left_atrium.ela_pum_veins_thrombus_tumour_yn == false
      assert echo_left_atrium.ela_spontaneous_contrast_loc == "some updated ela_spontaneous_contrast_loc"
      assert echo_left_atrium.ela_spontaneous_contrast_persist == "some updated ela_spontaneous_contrast_persist"
      assert echo_left_atrium.ela_spontaneous_contrast_yn == false
      assert echo_left_atrium.ela_thromus_tumour_body_loc == "some updated ela_thromus_tumour_body_loc"
      assert echo_left_atrium.ela_volume_desc == "some updated ela_volume_desc"
      assert echo_left_atrium.ela_volume_index == "some updated ela_volume_index"
      assert echo_left_atrium.ela_volume_method == "some updated ela_volume_method"
      assert echo_left_atrium.ela_volume_val == "some updated ela_volume_val"
    end

    test "update_echo_left_atrium/2 with invalid data returns error changeset" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_echo_left_atrium(echo_left_atrium, @invalid_attrs)
      assert echo_left_atrium == Ivestigations.get_echo_left_atrium!(echo_left_atrium.id)
    end

    test "delete_echo_left_atrium/1 deletes the echo_left_atrium" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert {:ok, %Echo_left_atrium{}} = Ivestigations.delete_echo_left_atrium(echo_left_atrium)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_echo_left_atrium!(echo_left_atrium.id) end
    end

    test "change_echo_left_atrium/1 returns a echo_left_atrium changeset" do
      echo_left_atrium = echo_left_atrium_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_echo_left_atrium(echo_left_atrium)
    end
  end

  describe "echo_right_atriums" do
    alias Angio.Ivestigations.Echo_right_atrium

    @valid_attrs %{era_area_val: "some era_area_val", era_cath_wire_yn: true, era_chiari_prominent_yn: true, era_coronary_sinus_dilated_yn: true, era_eustachian_prominent_yn: true, era_ivc_thrombus_tumour_yn: true, era_max_diameter_val: "some era_max_diameter_val", era_ml_diameter_val: "some era_ml_diameter_val", era_notes: "some era_notes", era_persistent_svc_yn: true, era_septum_bowed_left_yn: true, era_si_diameter_val: "some era_si_diameter_val", era_size_volume_desc: "some era_size_volume_desc", era_size_volume_method: "some era_size_volume_method", era_svc_thrombus_tumour_yn: true, era_thrombus_tumour_yn: true, era_volume_val: "some era_volume_val"}
    @update_attrs %{era_area_val: "some updated era_area_val", era_cath_wire_yn: false, era_chiari_prominent_yn: false, era_coronary_sinus_dilated_yn: false, era_eustachian_prominent_yn: false, era_ivc_thrombus_tumour_yn: false, era_max_diameter_val: "some updated era_max_diameter_val", era_ml_diameter_val: "some updated era_ml_diameter_val", era_notes: "some updated era_notes", era_persistent_svc_yn: false, era_septum_bowed_left_yn: false, era_si_diameter_val: "some updated era_si_diameter_val", era_size_volume_desc: "some updated era_size_volume_desc", era_size_volume_method: "some updated era_size_volume_method", era_svc_thrombus_tumour_yn: false, era_thrombus_tumour_yn: false, era_volume_val: "some updated era_volume_val"}
    @invalid_attrs %{era_area_val: nil, era_cath_wire_yn: nil, era_chiari_prominent_yn: nil, era_coronary_sinus_dilated_yn: nil, era_eustachian_prominent_yn: nil, era_ivc_thrombus_tumour_yn: nil, era_max_diameter_val: nil, era_ml_diameter_val: nil, era_notes: nil, era_persistent_svc_yn: nil, era_septum_bowed_left_yn: nil, era_si_diameter_val: nil, era_size_volume_desc: nil, era_size_volume_method: nil, era_svc_thrombus_tumour_yn: nil, era_thrombus_tumour_yn: nil, era_volume_val: nil}

    def echo_right_atrium_fixture(attrs \\ %{}) do
      {:ok, echo_right_atrium} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_echo_right_atrium()

      echo_right_atrium
    end

    test "list_echo_right_atriums/0 returns all echo_right_atriums" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert Ivestigations.list_echo_right_atriums() == [echo_right_atrium]
    end

    test "get_echo_right_atrium!/1 returns the echo_right_atrium with given id" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert Ivestigations.get_echo_right_atrium!(echo_right_atrium.id) == echo_right_atrium
    end

    test "create_echo_right_atrium/1 with valid data creates a echo_right_atrium" do
      assert {:ok, %Echo_right_atrium{} = echo_right_atrium} = Ivestigations.create_echo_right_atrium(@valid_attrs)
      assert echo_right_atrium.era_area_val == "some era_area_val"
      assert echo_right_atrium.era_cath_wire_yn == true
      assert echo_right_atrium.era_chiari_prominent_yn == true
      assert echo_right_atrium.era_coronary_sinus_dilated_yn == true
      assert echo_right_atrium.era_eustachian_prominent_yn == true
      assert echo_right_atrium.era_ivc_thrombus_tumour_yn == true
      assert echo_right_atrium.era_max_diameter_val == "some era_max_diameter_val"
      assert echo_right_atrium.era_ml_diameter_val == "some era_ml_diameter_val"
      assert echo_right_atrium.era_notes == "some era_notes"
      assert echo_right_atrium.era_persistent_svc_yn == true
      assert echo_right_atrium.era_septum_bowed_left_yn == true
      assert echo_right_atrium.era_si_diameter_val == "some era_si_diameter_val"
      assert echo_right_atrium.era_size_volume_desc == "some era_size_volume_desc"
      assert echo_right_atrium.era_size_volume_method == "some era_size_volume_method"
      assert echo_right_atrium.era_svc_thrombus_tumour_yn == true
      assert echo_right_atrium.era_thrombus_tumour_yn == true
      assert echo_right_atrium.era_volume_val == "some era_volume_val"
    end

    test "create_echo_right_atrium/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_echo_right_atrium(@invalid_attrs)
    end

    test "update_echo_right_atrium/2 with valid data updates the echo_right_atrium" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert {:ok, %Echo_right_atrium{} = echo_right_atrium} = Ivestigations.update_echo_right_atrium(echo_right_atrium, @update_attrs)
      assert echo_right_atrium.era_area_val == "some updated era_area_val"
      assert echo_right_atrium.era_cath_wire_yn == false
      assert echo_right_atrium.era_chiari_prominent_yn == false
      assert echo_right_atrium.era_coronary_sinus_dilated_yn == false
      assert echo_right_atrium.era_eustachian_prominent_yn == false
      assert echo_right_atrium.era_ivc_thrombus_tumour_yn == false
      assert echo_right_atrium.era_max_diameter_val == "some updated era_max_diameter_val"
      assert echo_right_atrium.era_ml_diameter_val == "some updated era_ml_diameter_val"
      assert echo_right_atrium.era_notes == "some updated era_notes"
      assert echo_right_atrium.era_persistent_svc_yn == false
      assert echo_right_atrium.era_septum_bowed_left_yn == false
      assert echo_right_atrium.era_si_diameter_val == "some updated era_si_diameter_val"
      assert echo_right_atrium.era_size_volume_desc == "some updated era_size_volume_desc"
      assert echo_right_atrium.era_size_volume_method == "some updated era_size_volume_method"
      assert echo_right_atrium.era_svc_thrombus_tumour_yn == false
      assert echo_right_atrium.era_thrombus_tumour_yn == false
      assert echo_right_atrium.era_volume_val == "some updated era_volume_val"
    end

    test "update_echo_right_atrium/2 with invalid data returns error changeset" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_echo_right_atrium(echo_right_atrium, @invalid_attrs)
      assert echo_right_atrium == Ivestigations.get_echo_right_atrium!(echo_right_atrium.id)
    end

    test "delete_echo_right_atrium/1 deletes the echo_right_atrium" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert {:ok, %Echo_right_atrium{}} = Ivestigations.delete_echo_right_atrium(echo_right_atrium)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_echo_right_atrium!(echo_right_atrium.id) end
    end

    test "change_echo_right_atrium/1 returns a echo_right_atrium changeset" do
      echo_right_atrium = echo_right_atrium_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_echo_right_atrium(echo_right_atrium)
    end
  end

  describe "echo_ventricle_lefts" do
    alias Angio.Ivestigations.Echo_ventricle_left

    @valid_attrs %{elv_wall_thick_normal_yn: true, elv_lvid_lves_na: true, elv_notes: "some elv_notes", elv_lv_shape_normal_yn: true, elv_concentric_hyper_yn: true, elv_lv_geometry_desc: "some elv_lv_geometry_desc", elv_lves_volume_val: "some elv_lves_volume_val", elv_thrombus_tumour_yn: true, elv_lved_volume_index: "some elv_lved_volume_index", elv_wall_thick_region: "some elv_wall_thick_region", elv_thrombus_tumour_loc: "some elv_thrombus_tumour_loc", elv_non_compaction_yn: true, elv_lves_volume_method: "some elv_lves_volume_method", elv_myocardial_mass_method: "some elv_myocardial_mass_method", elv_lv_appearance_other_text: "some elv_lv_appearance_other_text", elv_lvpw_thick_sys_val: "some elv_lvpw_thick_sys_val", elv_lved_overall_septal_thick_desc: "some elv_lved_overall_septal_thick_desc", elv_wall_thick_region_name: "some elv_wall_thick_region_name", elv_lved_inferior_lateral_septal_thick_val: "some elv_lved_inferior_lateral_septal_thick_val", elv_wall_thick_region_qualitative: "some elv_wall_thick_region_qualitative", elv_lvid_lves_val: "some elv_lvid_lves_val", elv_lvot_desc: "some elv_lvot_desc", elv_wall_thick_asym_hyper_desc: "some elv_wall_thick_asym_hyper_desc", elv_lved_cavity_size_desc: "some elv_lved_cavity_size_desc", elv_segment_17model: "some elv_segment_17model", elv_aneurism_shape_desc: "some elv_aneurism_shape_desc", elv_lvid_lved_val: "some elv_lvid_lved_val", elv_lvpw_thick_diast_val: "some elv_lvpw_thick_diast_val", elv_myocardial_mass_val: "some elv_myocardial_mass_val", elv_lv_appearance_desc: "some elv_lv_appearance_desc", elv_lvid_lved_na: true, elv_lves_volume_index: "some elv_lves_volume_index", elv_lved_volume_val: "some elv_lved_volume_val", elv_lves_septal_thick_val: "some elv_lves_septal_thick_val", elv_ste_radial_peak_strain: "some elv_ste_radial_peak_strain", elv_ste_circ_peak_strain: "some elv_ste_circ_peak_strain", elv_aneurism_pseudo_shape_desc: "some elv_aneurism_pseudo_shape_desc", elv_lved_volume_method: "some elv_lved_volume_method", elv_myocardial_mass_qualitative: "some elv_myocardial_mass_qualitative", elv_lved_septal_thick_val: "some elv_lved_septal_thick_val"}
    @update_attrs %{elv_wall_thick_normal_yn: false, elv_lvid_lves_na: false, elv_notes: "some updated elv_notes", elv_lv_shape_normal_yn: false, elv_concentric_hyper_yn: false, elv_lv_geometry_desc: "some updated elv_lv_geometry_desc", elv_lves_volume_val: "some updated elv_lves_volume_val", elv_thrombus_tumour_yn: false, elv_lved_volume_index: "some updated elv_lved_volume_index", elv_wall_thick_region: "some updated elv_wall_thick_region", elv_thrombus_tumour_loc: "some updated elv_thrombus_tumour_loc", elv_non_compaction_yn: false, elv_lves_volume_method: "some updated elv_lves_volume_method", elv_myocardial_mass_method: "some updated elv_myocardial_mass_method", elv_lv_appearance_other_text: "some updated elv_lv_appearance_other_text", elv_lvpw_thick_sys_val: "some updated elv_lvpw_thick_sys_val", elv_lved_overall_septal_thick_desc: "some updated elv_lved_overall_septal_thick_desc", elv_wall_thick_region_name: "some updated elv_wall_thick_region_name", elv_lved_inferior_lateral_septal_thick_val: "some updated elv_lved_inferior_lateral_septal_thick_val", elv_wall_thick_region_qualitative: "some updated elv_wall_thick_region_qualitative", elv_lvid_lves_val: "some updated elv_lvid_lves_val", elv_lvot_desc: "some updated elv_lvot_desc", elv_wall_thick_asym_hyper_desc: "some updated elv_wall_thick_asym_hyper_desc", elv_lved_cavity_size_desc: "some updated elv_lved_cavity_size_desc", elv_segment_17model: "some updated elv_segment_17model", elv_aneurism_shape_desc: "some updated elv_aneurism_shape_desc", elv_lvid_lved_val: "some updated elv_lvid_lved_val", elv_lvpw_thick_diast_val: "some updated elv_lvpw_thick_diast_val", elv_myocardial_mass_val: "some updated elv_myocardial_mass_val", elv_lv_appearance_desc: "some updated elv_lv_appearance_desc", elv_lvid_lved_na: false, elv_lves_volume_index: "some updated elv_lves_volume_index", elv_lved_volume_val: "some updated elv_lved_volume_val", elv_lves_septal_thick_val: "some updated elv_lves_septal_thick_val", elv_ste_radial_peak_strain: "some updated elv_ste_radial_peak_strain", elv_ste_circ_peak_strain: "some updated elv_ste_circ_peak_strain", elv_aneurism_pseudo_shape_desc: "some updated elv_aneurism_pseudo_shape_desc", elv_lved_volume_method: "some updated elv_lved_volume_method", elv_myocardial_mass_qualitative: "some updated elv_myocardial_mass_qualitative", elv_lved_septal_thick_val: "some updated elv_lved_septal_thick_val"}
    @invalid_attrs %{elv_wall_thick_normal_yn: nil, elv_lvid_lves_na: nil, elv_notes: nil, elv_lv_shape_normal_yn: nil, elv_concentric_hyper_yn: nil, elv_lv_geometry_desc: nil, elv_lves_volume_val: nil, elv_thrombus_tumour_yn: nil, elv_lved_volume_index: nil, elv_wall_thick_region: nil, elv_thrombus_tumour_loc: nil, elv_non_compaction_yn: nil, elv_lves_volume_method: nil, elv_myocardial_mass_method: nil, elv_lv_appearance_other_text: nil, elv_lvpw_thick_sys_val: nil, elv_lved_overall_septal_thick_desc: nil, elv_wall_thick_region_name: nil, elv_lved_inferior_lateral_septal_thick_val: nil, elv_wall_thick_region_qualitative: nil, elv_lvid_lves_val: nil, elv_lvot_desc: nil, elv_wall_thick_asym_hyper_desc: nil, elv_lved_cavity_size_desc: nil, elv_segment_17model: nil, elv_aneurism_shape_desc: nil, elv_lvid_lved_val: nil, elv_lvpw_thick_diast_val: nil, elv_myocardial_mass_val: nil, elv_lv_appearance_desc: nil, elv_lvid_lved_na: nil, elv_lves_volume_index: nil, elv_lved_volume_val: nil, elv_lves_septal_thick_val: nil, elv_ste_radial_peak_strain: nil, elv_ste_circ_peak_strain: nil, elv_aneurism_pseudo_shape_desc: nil, elv_lved_volume_method: nil, elv_myocardial_mass_qualitative: nil, elv_lved_septal_thick_val: nil}

    def echo_ventricle_left_fixture(attrs \\ %{}) do
      {:ok, echo_ventricle_left} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_echo_ventricle_left()

      echo_ventricle_left
    end

    test "list_echo_ventricle_lefts/0 returns all echo_ventricle_lefts" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert Ivestigations.list_echo_ventricle_lefts() == [echo_ventricle_left]
    end

    test "get_echo_ventricle_left!/1 returns the echo_ventricle_left with given id" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert Ivestigations.get_echo_ventricle_left!(echo_ventricle_left.id) == echo_ventricle_left
    end

    test "create_echo_ventricle_left/1 with valid data creates a echo_ventricle_left" do
      assert {:ok, %Echo_ventricle_left{} = echo_ventricle_left} = Ivestigations.create_echo_ventricle_left(@valid_attrs)
      assert echo_ventricle_left.elv_lved_septal_thick_val == "some elv_lved_septal_thick_val"
      assert echo_ventricle_left.elv_myocardial_mass_qualitative == "some elv_myocardial_mass_qualitative"
      assert echo_ventricle_left.elv_lved_volume_method == "some elv_lved_volume_method"
      assert echo_ventricle_left.elv_aneurism_pseudo_shape_desc == "some elv_aneurism_pseudo_shape_desc"
      assert echo_ventricle_left.elv_ste_circ_peak_strain == "some elv_ste_circ_peak_strain"
      assert echo_ventricle_left.elv_ste_radial_peak_strain == "some elv_ste_radial_peak_strain"
      assert echo_ventricle_left.elv_lves_septal_thick_val == "some elv_lves_septal_thick_val"
      assert echo_ventricle_left.elv_lved_volume_val == "some elv_lved_volume_val"
      assert echo_ventricle_left.elv_lves_volume_index == "some elv_lves_volume_index"
      assert echo_ventricle_left.elv_lvid_lved_na == true
      assert echo_ventricle_left.elv_lv_appearance_desc == "some elv_lv_appearance_desc"
      assert echo_ventricle_left.elv_myocardial_mass_val == "some elv_myocardial_mass_val"
      assert echo_ventricle_left.elv_lvpw_thick_diast_val == "some elv_lvpw_thick_diast_val"
      assert echo_ventricle_left.elv_lvid_lved_val == "some elv_lvid_lved_val"
      assert echo_ventricle_left.elv_aneurism_shape_desc == "some elv_aneurism_shape_desc"
      assert echo_ventricle_left.elv_segment_17model == "some elv_segment_17model"
      assert echo_ventricle_left.elv_lved_cavity_size_desc == "some elv_lved_cavity_size_desc"
      assert echo_ventricle_left.elv_wall_thick_asym_hyper_desc == "some elv_wall_thick_asym_hyper_desc"
      assert echo_ventricle_left.elv_lvot_desc == "some elv_lvot_desc"
      assert echo_ventricle_left.elv_lvid_lves_val == "some elv_lvid_lves_val"
      assert echo_ventricle_left.elv_wall_thick_region_qualitative == "some elv_wall_thick_region_qualitative"
      assert echo_ventricle_left.elv_lved_inferior_lateral_septal_thick_val == "some elv_lved_inferior_lateral_septal_thick_val"
      assert echo_ventricle_left.elv_wall_thick_region_name == "some elv_wall_thick_region_name"
      assert echo_ventricle_left.elv_lved_overall_septal_thick_desc == "some elv_lved_overall_septal_thick_desc"
      assert echo_ventricle_left.elv_lvpw_thick_sys_val == "some elv_lvpw_thick_sys_val"
      assert echo_ventricle_left.elv_lv_appearance_other_text == "some elv_lv_appearance_other_text"
      assert echo_ventricle_left.elv_myocardial_mass_method == "some elv_myocardial_mass_method"
      assert echo_ventricle_left.elv_lves_volume_method == "some elv_lves_volume_method"
      assert echo_ventricle_left.elv_non_compaction_yn == true
      assert echo_ventricle_left.elv_thrombus_tumour_loc == "some elv_thrombus_tumour_loc"
      assert echo_ventricle_left.elv_wall_thick_region == "some elv_wall_thick_region"
      assert echo_ventricle_left.elv_lved_volume_index == "some elv_lved_volume_index"
      assert echo_ventricle_left.elv_thrombus_tumour_yn == true
      assert echo_ventricle_left.elv_lves_volume_val == "some elv_lves_volume_val"
      assert echo_ventricle_left.elv_lv_geometry_desc == "some elv_lv_geometry_desc"
      assert echo_ventricle_left.elv_concentric_hyper_yn == true
      assert echo_ventricle_left.elv_lv_shape_normal_yn == true
      assert echo_ventricle_left.elv_notes == "some elv_notes"
      assert echo_ventricle_left.elv_lvid_lves_na == true
      assert echo_ventricle_left.elv_wall_thick_normal_yn == true
    end

    test "create_echo_ventricle_left/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_echo_ventricle_left(@invalid_attrs)
    end

    test "update_echo_ventricle_left/2 with valid data updates the echo_ventricle_left" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert {:ok, %Echo_ventricle_left{} = echo_ventricle_left} = Ivestigations.update_echo_ventricle_left(echo_ventricle_left, @update_attrs)
      assert echo_ventricle_left.elv_lved_septal_thick_val == "some updated elv_lved_septal_thick_val"
      assert echo_ventricle_left.elv_myocardial_mass_qualitative == "some updated elv_myocardial_mass_qualitative"
      assert echo_ventricle_left.elv_lved_volume_method == "some updated elv_lved_volume_method"
      assert echo_ventricle_left.elv_aneurism_pseudo_shape_desc == "some updated elv_aneurism_pseudo_shape_desc"
      assert echo_ventricle_left.elv_ste_circ_peak_strain == "some updated elv_ste_circ_peak_strain"
      assert echo_ventricle_left.elv_ste_radial_peak_strain == "some updated elv_ste_radial_peak_strain"
      assert echo_ventricle_left.elv_lves_septal_thick_val == "some updated elv_lves_septal_thick_val"
      assert echo_ventricle_left.elv_lved_volume_val == "some updated elv_lved_volume_val"
      assert echo_ventricle_left.elv_lves_volume_index == "some updated elv_lves_volume_index"
      assert echo_ventricle_left.elv_lvid_lved_na == false
      assert echo_ventricle_left.elv_lv_appearance_desc == "some updated elv_lv_appearance_desc"
      assert echo_ventricle_left.elv_myocardial_mass_val == "some updated elv_myocardial_mass_val"
      assert echo_ventricle_left.elv_lvpw_thick_diast_val == "some updated elv_lvpw_thick_diast_val"
      assert echo_ventricle_left.elv_lvid_lved_val == "some updated elv_lvid_lved_val"
      assert echo_ventricle_left.elv_aneurism_shape_desc == "some updated elv_aneurism_shape_desc"
      assert echo_ventricle_left.elv_segment_17model == "some updated elv_segment_17model"
      assert echo_ventricle_left.elv_lved_cavity_size_desc == "some updated elv_lved_cavity_size_desc"
      assert echo_ventricle_left.elv_wall_thick_asym_hyper_desc == "some updated elv_wall_thick_asym_hyper_desc"
      assert echo_ventricle_left.elv_lvot_desc == "some updated elv_lvot_desc"
      assert echo_ventricle_left.elv_lvid_lves_val == "some updated elv_lvid_lves_val"
      assert echo_ventricle_left.elv_wall_thick_region_qualitative == "some updated elv_wall_thick_region_qualitative"
      assert echo_ventricle_left.elv_lved_inferior_lateral_septal_thick_val == "some updated elv_lved_inferior_lateral_septal_thick_val"
      assert echo_ventricle_left.elv_wall_thick_region_name == "some updated elv_wall_thick_region_name"
      assert echo_ventricle_left.elv_lved_overall_septal_thick_desc == "some updated elv_lved_overall_septal_thick_desc"
      assert echo_ventricle_left.elv_lvpw_thick_sys_val == "some updated elv_lvpw_thick_sys_val"
      assert echo_ventricle_left.elv_lv_appearance_other_text == "some updated elv_lv_appearance_other_text"
      assert echo_ventricle_left.elv_myocardial_mass_method == "some updated elv_myocardial_mass_method"
      assert echo_ventricle_left.elv_lves_volume_method == "some updated elv_lves_volume_method"
      assert echo_ventricle_left.elv_non_compaction_yn == false
      assert echo_ventricle_left.elv_thrombus_tumour_loc == "some updated elv_thrombus_tumour_loc"
      assert echo_ventricle_left.elv_wall_thick_region == "some updated elv_wall_thick_region"
      assert echo_ventricle_left.elv_lved_volume_index == "some updated elv_lved_volume_index"
      assert echo_ventricle_left.elv_thrombus_tumour_yn == false
      assert echo_ventricle_left.elv_lves_volume_val == "some updated elv_lves_volume_val"
      assert echo_ventricle_left.elv_lv_geometry_desc == "some updated elv_lv_geometry_desc"
      assert echo_ventricle_left.elv_concentric_hyper_yn == false
      assert echo_ventricle_left.elv_lv_shape_normal_yn == false
      assert echo_ventricle_left.elv_notes == "some updated elv_notes"
      assert echo_ventricle_left.elv_lvid_lves_na == false
      assert echo_ventricle_left.elv_wall_thick_normal_yn == false
    end

    test "update_echo_ventricle_left/2 with invalid data returns error changeset" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_echo_ventricle_left(echo_ventricle_left, @invalid_attrs)
      assert echo_ventricle_left == Ivestigations.get_echo_ventricle_left!(echo_ventricle_left.id)
    end

    test "delete_echo_ventricle_left/1 deletes the echo_ventricle_left" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert {:ok, %Echo_ventricle_left{}} = Ivestigations.delete_echo_ventricle_left(echo_ventricle_left)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_echo_ventricle_left!(echo_ventricle_left.id) end
    end

    test "change_echo_ventricle_left/1 returns a echo_ventricle_left changeset" do
      echo_ventricle_left = echo_ventricle_left_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_echo_ventricle_left(echo_ventricle_left)
    end
  end

  describe "echo_ventricle_left_systolic_funcs" do
    alias Angio.Ivestigations.Echo_ventricle_left_systolic_func

    @valid_attrs %{elvsf_cardiac_index: "some elvsf_cardiac_index", elvsf_cardiac_output_method: "some elvsf_cardiac_output_method", elvsf_cardiac_output_val: "some elvsf_cardiac_output_val", elvsf_dyssynchrony: "some elvsf_dyssynchrony", elvsf_ejection: "some elvsf_ejection", elvsf_ejection_fraction_calculated: "some elvsf_ejection_fraction_calculated", elvsf_ejection_fraction_desc: "some elvsf_ejection_fraction_desc", elvsf_fractional_shortening_desc: "some elvsf_fractional_shortening_desc", elvsf_fractional_shortening_method: "some elvsf_fractional_shortening_method", elvsf_fractional_shortening_val: "some elvsf_fractional_shortening_val", elvsf_global_long_strain: "some elvsf_global_long_strain", elvsf_is_normal_yn: true, elvsf_lvot_area_val: "some elvsf_lvot_area_val", elvsf_lvot_diameter_val: "some elvsf_lvot_diameter_val", elvsf_lvot_peak_velocity_val: "some elvsf_lvot_peak_velocity_val", elvsf_lvot_vti_val: "some elvsf_lvot_vti_val", elvsf_mean_dp_dt: "some elvsf_mean_dp_dt", elvsf_measurment_dt: "some elvsf_measurment_dt", elvsf_notes: "some elvsf_notes", elvsf_peak_dp_dt: "some elvsf_peak_dp_dt", elvsf_pulsed_tissue_doppler_s: "some elvsf_pulsed_tissue_doppler_s", elvsf_stroke_distance: "some elvsf_stroke_distance", elvsf_stroke_volume_doppler: "some elvsf_stroke_volume_doppler", elvsf_stroke_volume_method: "some elvsf_stroke_volume_method", elvsf_stroke_volume_valumetric: "some elvsf_stroke_volume_valumetric", elvsf_stroke_work_index: "some elvsf_stroke_work_index", elvsf_stroke_work_val: "some elvsf_stroke_work_val", elvsf_systolic_function_desc: "some elvsf_systolic_function_desc", elvsf_tei_index: "some elvsf_tei_index", elvsf_vti_a_wave_us_val: "some elvsf_vti_a_wave_us_val", elvsf_vti_e_wave_us_val: "some elvsf_vti_e_wave_us_val", elvsf_wall_seg_doppler_val: "some elvsf_wall_seg_doppler_val"}
    @update_attrs %{elvsf_cardiac_index: "some updated elvsf_cardiac_index", elvsf_cardiac_output_method: "some updated elvsf_cardiac_output_method", elvsf_cardiac_output_val: "some updated elvsf_cardiac_output_val", elvsf_dyssynchrony: "some updated elvsf_dyssynchrony", elvsf_ejection: "some updated elvsf_ejection", elvsf_ejection_fraction_calculated: "some updated elvsf_ejection_fraction_calculated", elvsf_ejection_fraction_desc: "some updated elvsf_ejection_fraction_desc", elvsf_fractional_shortening_desc: "some updated elvsf_fractional_shortening_desc", elvsf_fractional_shortening_method: "some updated elvsf_fractional_shortening_method", elvsf_fractional_shortening_val: "some updated elvsf_fractional_shortening_val", elvsf_global_long_strain: "some updated elvsf_global_long_strain", elvsf_is_normal_yn: false, elvsf_lvot_area_val: "some updated elvsf_lvot_area_val", elvsf_lvot_diameter_val: "some updated elvsf_lvot_diameter_val", elvsf_lvot_peak_velocity_val: "some updated elvsf_lvot_peak_velocity_val", elvsf_lvot_vti_val: "some updated elvsf_lvot_vti_val", elvsf_mean_dp_dt: "some updated elvsf_mean_dp_dt", elvsf_measurment_dt: "some updated elvsf_measurment_dt", elvsf_notes: "some updated elvsf_notes", elvsf_peak_dp_dt: "some updated elvsf_peak_dp_dt", elvsf_pulsed_tissue_doppler_s: "some updated elvsf_pulsed_tissue_doppler_s", elvsf_stroke_distance: "some updated elvsf_stroke_distance", elvsf_stroke_volume_doppler: "some updated elvsf_stroke_volume_doppler", elvsf_stroke_volume_method: "some updated elvsf_stroke_volume_method", elvsf_stroke_volume_valumetric: "some updated elvsf_stroke_volume_valumetric", elvsf_stroke_work_index: "some updated elvsf_stroke_work_index", elvsf_stroke_work_val: "some updated elvsf_stroke_work_val", elvsf_systolic_function_desc: "some updated elvsf_systolic_function_desc", elvsf_tei_index: "some updated elvsf_tei_index", elvsf_vti_a_wave_us_val: "some updated elvsf_vti_a_wave_us_val", elvsf_vti_e_wave_us_val: "some updated elvsf_vti_e_wave_us_val", elvsf_wall_seg_doppler_val: "some updated elvsf_wall_seg_doppler_val"}
    @invalid_attrs %{elvsf_cardiac_index: nil, elvsf_cardiac_output_method: nil, elvsf_cardiac_output_val: nil, elvsf_dyssynchrony: nil, elvsf_ejection: nil, elvsf_ejection_fraction_calculated: nil, elvsf_ejection_fraction_desc: nil, elvsf_fractional_shortening_desc: nil, elvsf_fractional_shortening_method: nil, elvsf_fractional_shortening_val: nil, elvsf_global_long_strain: nil, elvsf_is_normal_yn: nil, elvsf_lvot_area_val: nil, elvsf_lvot_diameter_val: nil, elvsf_lvot_peak_velocity_val: nil, elvsf_lvot_vti_val: nil, elvsf_mean_dp_dt: nil, elvsf_measurment_dt: nil, elvsf_notes: nil, elvsf_peak_dp_dt: nil, elvsf_pulsed_tissue_doppler_s: nil, elvsf_stroke_distance: nil, elvsf_stroke_volume_doppler: nil, elvsf_stroke_volume_method: nil, elvsf_stroke_volume_valumetric: nil, elvsf_stroke_work_index: nil, elvsf_stroke_work_val: nil, elvsf_systolic_function_desc: nil, elvsf_tei_index: nil, elvsf_vti_a_wave_us_val: nil, elvsf_vti_e_wave_us_val: nil, elvsf_wall_seg_doppler_val: nil}

    def echo_ventricle_left_systolic_func_fixture(attrs \\ %{}) do
      {:ok, echo_ventricle_left_systolic_func} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ivestigations.create_echo_ventricle_left_systolic_func()

      echo_ventricle_left_systolic_func
    end

    test "list_echo_ventricle_left_systolic_funcs/0 returns all echo_ventricle_left_systolic_funcs" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert Ivestigations.list_echo_ventricle_left_systolic_funcs() == [echo_ventricle_left_systolic_func]
    end

    test "get_echo_ventricle_left_systolic_func!/1 returns the echo_ventricle_left_systolic_func with given id" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert Ivestigations.get_echo_ventricle_left_systolic_func!(echo_ventricle_left_systolic_func.id) == echo_ventricle_left_systolic_func
    end

    test "create_echo_ventricle_left_systolic_func/1 with valid data creates a echo_ventricle_left_systolic_func" do
      assert {:ok, %Echo_ventricle_left_systolic_func{} = echo_ventricle_left_systolic_func} = Ivestigations.create_echo_ventricle_left_systolic_func(@valid_attrs)
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_index == "some elvsf_cardiac_index"
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_output_method == "some elvsf_cardiac_output_method"
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_output_val == "some elvsf_cardiac_output_val"
      assert echo_ventricle_left_systolic_func.elvsf_dyssynchrony == "some elvsf_dyssynchrony"
      assert echo_ventricle_left_systolic_func.elvsf_ejection == "some elvsf_ejection"
      assert echo_ventricle_left_systolic_func.elvsf_ejection_fraction_calculated == "some elvsf_ejection_fraction_calculated"
      assert echo_ventricle_left_systolic_func.elvsf_ejection_fraction_desc == "some elvsf_ejection_fraction_desc"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_desc == "some elvsf_fractional_shortening_desc"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_method == "some elvsf_fractional_shortening_method"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_val == "some elvsf_fractional_shortening_val"
      assert echo_ventricle_left_systolic_func.elvsf_global_long_strain == "some elvsf_global_long_strain"
      assert echo_ventricle_left_systolic_func.elvsf_is_normal_yn == true
      assert echo_ventricle_left_systolic_func.elvsf_lvot_area_val == "some elvsf_lvot_area_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_diameter_val == "some elvsf_lvot_diameter_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_peak_velocity_val == "some elvsf_lvot_peak_velocity_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_vti_val == "some elvsf_lvot_vti_val"
      assert echo_ventricle_left_systolic_func.elvsf_mean_dp_dt == "some elvsf_mean_dp_dt"
      assert echo_ventricle_left_systolic_func.elvsf_measurment_dt == "some elvsf_measurment_dt"
      assert echo_ventricle_left_systolic_func.elvsf_notes == "some elvsf_notes"
      assert echo_ventricle_left_systolic_func.elvsf_peak_dp_dt == "some elvsf_peak_dp_dt"
      assert echo_ventricle_left_systolic_func.elvsf_pulsed_tissue_doppler_s == "some elvsf_pulsed_tissue_doppler_s"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_distance == "some elvsf_stroke_distance"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_doppler == "some elvsf_stroke_volume_doppler"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_method == "some elvsf_stroke_volume_method"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_valumetric == "some elvsf_stroke_volume_valumetric"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_work_index == "some elvsf_stroke_work_index"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_work_val == "some elvsf_stroke_work_val"
      assert echo_ventricle_left_systolic_func.elvsf_systolic_function_desc == "some elvsf_systolic_function_desc"
      assert echo_ventricle_left_systolic_func.elvsf_tei_index == "some elvsf_tei_index"
      assert echo_ventricle_left_systolic_func.elvsf_vti_a_wave_us_val == "some elvsf_vti_a_wave_us_val"
      assert echo_ventricle_left_systolic_func.elvsf_vti_e_wave_us_val == "some elvsf_vti_e_wave_us_val"
      assert echo_ventricle_left_systolic_func.elvsf_wall_seg_doppler_val == "some elvsf_wall_seg_doppler_val"
    end

    test "create_echo_ventricle_left_systolic_func/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ivestigations.create_echo_ventricle_left_systolic_func(@invalid_attrs)
    end

    test "update_echo_ventricle_left_systolic_func/2 with valid data updates the echo_ventricle_left_systolic_func" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert {:ok, %Echo_ventricle_left_systolic_func{} = echo_ventricle_left_systolic_func} = Ivestigations.update_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func, @update_attrs)
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_index == "some updated elvsf_cardiac_index"
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_output_method == "some updated elvsf_cardiac_output_method"
      assert echo_ventricle_left_systolic_func.elvsf_cardiac_output_val == "some updated elvsf_cardiac_output_val"
      assert echo_ventricle_left_systolic_func.elvsf_dyssynchrony == "some updated elvsf_dyssynchrony"
      assert echo_ventricle_left_systolic_func.elvsf_ejection == "some updated elvsf_ejection"
      assert echo_ventricle_left_systolic_func.elvsf_ejection_fraction_calculated == "some updated elvsf_ejection_fraction_calculated"
      assert echo_ventricle_left_systolic_func.elvsf_ejection_fraction_desc == "some updated elvsf_ejection_fraction_desc"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_desc == "some updated elvsf_fractional_shortening_desc"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_method == "some updated elvsf_fractional_shortening_method"
      assert echo_ventricle_left_systolic_func.elvsf_fractional_shortening_val == "some updated elvsf_fractional_shortening_val"
      assert echo_ventricle_left_systolic_func.elvsf_global_long_strain == "some updated elvsf_global_long_strain"
      assert echo_ventricle_left_systolic_func.elvsf_is_normal_yn == false
      assert echo_ventricle_left_systolic_func.elvsf_lvot_area_val == "some updated elvsf_lvot_area_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_diameter_val == "some updated elvsf_lvot_diameter_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_peak_velocity_val == "some updated elvsf_lvot_peak_velocity_val"
      assert echo_ventricle_left_systolic_func.elvsf_lvot_vti_val == "some updated elvsf_lvot_vti_val"
      assert echo_ventricle_left_systolic_func.elvsf_mean_dp_dt == "some updated elvsf_mean_dp_dt"
      assert echo_ventricle_left_systolic_func.elvsf_measurment_dt == "some updated elvsf_measurment_dt"
      assert echo_ventricle_left_systolic_func.elvsf_notes == "some updated elvsf_notes"
      assert echo_ventricle_left_systolic_func.elvsf_peak_dp_dt == "some updated elvsf_peak_dp_dt"
      assert echo_ventricle_left_systolic_func.elvsf_pulsed_tissue_doppler_s == "some updated elvsf_pulsed_tissue_doppler_s"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_distance == "some updated elvsf_stroke_distance"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_doppler == "some updated elvsf_stroke_volume_doppler"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_method == "some updated elvsf_stroke_volume_method"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_volume_valumetric == "some updated elvsf_stroke_volume_valumetric"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_work_index == "some updated elvsf_stroke_work_index"
      assert echo_ventricle_left_systolic_func.elvsf_stroke_work_val == "some updated elvsf_stroke_work_val"
      assert echo_ventricle_left_systolic_func.elvsf_systolic_function_desc == "some updated elvsf_systolic_function_desc"
      assert echo_ventricle_left_systolic_func.elvsf_tei_index == "some updated elvsf_tei_index"
      assert echo_ventricle_left_systolic_func.elvsf_vti_a_wave_us_val == "some updated elvsf_vti_a_wave_us_val"
      assert echo_ventricle_left_systolic_func.elvsf_vti_e_wave_us_val == "some updated elvsf_vti_e_wave_us_val"
      assert echo_ventricle_left_systolic_func.elvsf_wall_seg_doppler_val == "some updated elvsf_wall_seg_doppler_val"
    end

    test "update_echo_ventricle_left_systolic_func/2 with invalid data returns error changeset" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert {:error, %Ecto.Changeset{}} = Ivestigations.update_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func, @invalid_attrs)
      assert echo_ventricle_left_systolic_func == Ivestigations.get_echo_ventricle_left_systolic_func!(echo_ventricle_left_systolic_func.id)
    end

    test "delete_echo_ventricle_left_systolic_func/1 deletes the echo_ventricle_left_systolic_func" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert {:ok, %Echo_ventricle_left_systolic_func{}} = Ivestigations.delete_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)
      assert_raise Ecto.NoResultsError, fn -> Ivestigations.get_echo_ventricle_left_systolic_func!(echo_ventricle_left_systolic_func.id) end
    end

    test "change_echo_ventricle_left_systolic_func/1 returns a echo_ventricle_left_systolic_func changeset" do
      echo_ventricle_left_systolic_func = echo_ventricle_left_systolic_func_fixture()
      assert %Ecto.Changeset{} = Ivestigations.change_echo_ventricle_left_systolic_func(echo_ventricle_left_systolic_func)
    end
  end
end
