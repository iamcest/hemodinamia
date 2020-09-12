defmodule AngioWeb.Treadmill_exerciseControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{ext_protocole_used: "some ext_protocole_used", ext_st_depres_pre_yn: true, ext_stop_reason: "some ext_stop_reason", ext_result: "some ext_result", ext_st_depres_max_location: "some ext_st_depres_max_location", ext_consent_yn: true, ext_tm: ~T[14:00:00], ext_bp_sys_max: "some ext_bp_sys_max", ext_watts: "some ext_watts", ext_va_treadmill_score: "some ext_va_treadmill_score", ext_doctor_lname: "some ext_doctor_lname", ext_cpx_peak_vo2: "some ext_cpx_peak_vo2", ext_notes: "some ext_notes", ext_is_done_yn: true, ext_indication: "some ext_indication", ext_result_notes: "some ext_result_notes", ext_technician_fname: "some ext_technician_fname", ext_bp_sys_recovery: "some ext_bp_sys_recovery", ext_main_problem_cardiac_yn: true, ext_cpx_peak_mets: "some ext_cpx_peak_mets", ext_limitations_relative: "some ext_limitations_relative", ext_lv_hypertrophy_pre_yn: true, ext_st_elevation_max: "some ext_st_elevation_max", ext_not_done_reason: "some ext_not_done_reason", ext_st_depres_recovery_val: "some ext_st_depres_recovery_val", ext_bp_diast_rest: "some ext_bp_diast_rest", ext_stop_reason_angina_yn: true, ext_lab_id: "some ext_lab_id", ext_dt: ~D[2010-04-17], ext_compl_afib_post_yn: true, ext_borg_scale: "some ext_borg_scale", ext_cpx_ve_vco2_slope: "some ext_cpx_ve_vco2_slope", ext_aerobic_capacity_max: "some ext_aerobic_capacity_max", ext_main_problem_medical_yn: true, ext_on_bblockers_yn: true, ext_athens_score: "some ext_athens_score", ext_compl_notes: "some ext_compl_notes", ext_st_depres_max_duration: "some ext_st_depres_max_duration", ext_bp_sys_rest: "some ext_bp_sys_rest", ext_heart_rate_rest: "some ext_heart_rate_rest", ext_cpx_age_vo2: "some ext_cpx_age_vo2", ext_mortality_cad_risk: "some ext_mortality_cad_risk", ext_on_digoxin_yn: true, ext_complication_yn: true, ext_cad_pretest_probability: "some ext_cad_pretest_probability", ext_qwaves_pre: "some ext_qwaves_pre", ext_st_depres_pre_val: "some ext_st_depres_pre_val", ext_recommendations: "some ext_recommendations", ext_main_problem_pulm_yn: true, ext_st_slop_max: "some ext_st_slop_max", ...}
  @update_attrs %{ext_protocole_used: "some updated ext_protocole_used", ext_st_depres_pre_yn: false, ext_stop_reason: "some updated ext_stop_reason", ext_result: "some updated ext_result", ext_st_depres_max_location: "some updated ext_st_depres_max_location", ext_consent_yn: false, ext_tm: ~T[15:01:01], ext_bp_sys_max: "some updated ext_bp_sys_max", ext_watts: "some updated ext_watts", ext_va_treadmill_score: "some updated ext_va_treadmill_score", ext_doctor_lname: "some updated ext_doctor_lname", ext_cpx_peak_vo2: "some updated ext_cpx_peak_vo2", ext_notes: "some updated ext_notes", ext_is_done_yn: false, ext_indication: "some updated ext_indication", ext_result_notes: "some updated ext_result_notes", ext_technician_fname: "some updated ext_technician_fname", ext_bp_sys_recovery: "some updated ext_bp_sys_recovery", ext_main_problem_cardiac_yn: false, ext_cpx_peak_mets: "some updated ext_cpx_peak_mets", ext_limitations_relative: "some updated ext_limitations_relative", ext_lv_hypertrophy_pre_yn: false, ext_st_elevation_max: "some updated ext_st_elevation_max", ext_not_done_reason: "some updated ext_not_done_reason", ext_st_depres_recovery_val: "some updated ext_st_depres_recovery_val", ext_bp_diast_rest: "some updated ext_bp_diast_rest", ext_stop_reason_angina_yn: false, ext_lab_id: "some updated ext_lab_id", ext_dt: ~D[2011-05-18], ext_compl_afib_post_yn: false, ext_borg_scale: "some updated ext_borg_scale", ext_cpx_ve_vco2_slope: "some updated ext_cpx_ve_vco2_slope", ext_aerobic_capacity_max: "some updated ext_aerobic_capacity_max", ext_main_problem_medical_yn: false, ext_on_bblockers_yn: false, ext_athens_score: "some updated ext_athens_score", ext_compl_notes: "some updated ext_compl_notes", ext_st_depres_max_duration: "some updated ext_st_depres_max_duration", ext_bp_sys_rest: "some updated ext_bp_sys_rest", ext_heart_rate_rest: "some updated ext_heart_rate_rest", ext_cpx_age_vo2: "some updated ext_cpx_age_vo2", ext_mortality_cad_risk: "some updated ext_mortality_cad_risk", ext_on_digoxin_yn: false, ext_complication_yn: false, ext_cad_pretest_probability: "some updated ext_cad_pretest_probability", ext_qwaves_pre: "some updated ext_qwaves_pre", ext_st_depres_pre_val: "some updated ext_st_depres_pre_val", ext_recommendations: "some updated ext_recommendations", ext_main_problem_pulm_yn: false, ext_st_slop_max: "some updated ext_st_slop_max", ...}
  @invalid_attrs %{ext_protocole_used: nil, ext_st_depres_pre_yn: nil, ext_stop_reason: nil, ext_result: nil, ext_st_depres_max_location: nil, ext_consent_yn: nil, ext_tm: nil, ext_bp_sys_max: nil, ext_watts: nil, ext_va_treadmill_score: nil, ext_doctor_lname: nil, ext_cpx_peak_vo2: nil, ext_notes: nil, ext_is_done_yn: nil, ext_indication: nil, ext_result_notes: nil, ext_technician_fname: nil, ext_bp_sys_recovery: nil, ext_main_problem_cardiac_yn: nil, ext_cpx_peak_mets: nil, ext_limitations_relative: nil, ext_lv_hypertrophy_pre_yn: nil, ext_st_elevation_max: nil, ext_not_done_reason: nil, ext_st_depres_recovery_val: nil, ext_bp_diast_rest: nil, ext_stop_reason_angina_yn: nil, ext_lab_id: nil, ext_dt: nil, ext_compl_afib_post_yn: nil, ext_borg_scale: nil, ext_cpx_ve_vco2_slope: nil, ext_aerobic_capacity_max: nil, ext_main_problem_medical_yn: nil, ext_on_bblockers_yn: nil, ext_athens_score: nil, ext_compl_notes: nil, ext_st_depres_max_duration: nil, ext_bp_sys_rest: nil, ext_heart_rate_rest: nil, ext_cpx_age_vo2: nil, ext_mortality_cad_risk: nil, ext_on_digoxin_yn: nil, ext_complication_yn: nil, ext_cad_pretest_probability: nil, ext_qwaves_pre: nil, ext_st_depres_pre_val: nil, ext_recommendations: nil, ext_main_problem_pulm_yn: nil, ext_st_slop_max: nil, ...}

  def fixture(:treadmill_exercise) do
    {:ok, treadmill_exercise} = Ivestigations.create_treadmill_exercise(@create_attrs)
    treadmill_exercise
  end

  describe "index" do
    test "lists all treadmill_exercises", %{conn: conn} do
      conn = get(conn, Routes.treadmill_exercise_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Treadmill exercises"
    end
  end

  describe "new treadmill_exercise" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.treadmill_exercise_path(conn, :new))
      assert html_response(conn, 200) =~ "New Treadmill exercise"
    end
  end

  describe "create treadmill_exercise" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.treadmill_exercise_path(conn, :create), treadmill_exercise: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.treadmill_exercise_path(conn, :show, id)

      conn = get(conn, Routes.treadmill_exercise_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Treadmill exercise"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.treadmill_exercise_path(conn, :create), treadmill_exercise: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Treadmill exercise"
    end
  end

  describe "edit treadmill_exercise" do
    setup [:create_treadmill_exercise]

    test "renders form for editing chosen treadmill_exercise", %{conn: conn, treadmill_exercise: treadmill_exercise} do
      conn = get(conn, Routes.treadmill_exercise_path(conn, :edit, treadmill_exercise))
      assert html_response(conn, 200) =~ "Edit Treadmill exercise"
    end
  end

  describe "update treadmill_exercise" do
    setup [:create_treadmill_exercise]

    test "redirects when data is valid", %{conn: conn, treadmill_exercise: treadmill_exercise} do
      conn = put(conn, Routes.treadmill_exercise_path(conn, :update, treadmill_exercise), treadmill_exercise: @update_attrs)
      assert redirected_to(conn) == Routes.treadmill_exercise_path(conn, :show, treadmill_exercise)

      conn = get(conn, Routes.treadmill_exercise_path(conn, :show, treadmill_exercise))
      assert html_response(conn, 200) =~ "some updated ext_protocole_used"
    end

    test "renders errors when data is invalid", %{conn: conn, treadmill_exercise: treadmill_exercise} do
      conn = put(conn, Routes.treadmill_exercise_path(conn, :update, treadmill_exercise), treadmill_exercise: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Treadmill exercise"
    end
  end

  describe "delete treadmill_exercise" do
    setup [:create_treadmill_exercise]

    test "deletes chosen treadmill_exercise", %{conn: conn, treadmill_exercise: treadmill_exercise} do
      conn = delete(conn, Routes.treadmill_exercise_path(conn, :delete, treadmill_exercise))
      assert redirected_to(conn) == Routes.treadmill_exercise_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.treadmill_exercise_path(conn, :show, treadmill_exercise))
      end
    end
  end

  defp create_treadmill_exercise(_) do
    treadmill_exercise = fixture(:treadmill_exercise)
    {:ok, treadmill_exercise: treadmill_exercise}
  end
end
