defmodule AngioWeb.Clinical_exam_cardioControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Assements

  @create_attrs %{cle_sounds_notes: "some cle_sounds_notes", cle_av_ejection_click_yn: true, cle_pv_sys_murmur_grade: "some cle_pv_sys_murmur_grade", cle_complain_chest_pain_yn: true, cle_tm: ~T[14:00:00], cle_tr_notes: "some cle_tr_notes", cle_complain_palpitations_yn: true, cle_heart_sounds_abnormal_yn: true, cle_s2_heart_sound: "some cle_s2_heart_sound", cle_temperature: "some cle_temperature", cle_mv_abnormal_yn: true, cle_s3_heart_sound_yn: true, cle_continuous_murmur: "some cle_continuous_murmur", cle_s1_heart_sound: "some cle_s1_heart_sound", cle_tr_sys_murmur_yn: true, cle_pv_dias_murmur_yn: true, cle_complain_dysp: "some cle_complain_dysp", cle_dt: ~D[2010-04-17], cle_mv_dias_murmur_grade: "some cle_mv_dias_murmur_grade", cle_av_sys_murmur_yn: true, cle_tr_dias_murmur_yn: true, cle_mv_sys_murmur_grade: "some cle_mv_sys_murmur_grade", cle_av_abnormal_yn: true, cle_mv_sys_murmur_yn: true, cle_av_dias_murmur_grade: "some cle_av_dias_murmur_grade", cle_av_prosthetic_sound_yn: true, cle_mv_dias_murmur_yn: true, cle_pv_notes: "some cle_pv_notes", cle_complain_cough_yn: true, cle_murmur_notes: "some cle_murmur_notes", cle_s4_heart_sound_yn: true, cle_av_sys_murmur_grade: "some cle_av_sys_murmur_grade", cle_mv_opening_snap_yn: true, cle_complain_yn: true, cle_av_dias_murmur_yn: true, cle_no_ejection_click_yn: true, cle_complain_notes: "some cle_complain_notes", cle_mv_notes: "some cle_mv_notes", cle_pv_sys_murmur_yn: true, cle_pv_abnormal_yn: true, cle_peri_rub_yn: true, cle_killip_class: "some cle_killip_class", cle_normal_yn: true, cle_pv_dias_murmur_grade: "some cle_pv_dias_murmur_grade", cle_tr_abnormal_yn: true, cle_mv_prosthetic_sound_yn: true}
  @update_attrs %{cle_sounds_notes: "some updated cle_sounds_notes", cle_av_ejection_click_yn: false, cle_pv_sys_murmur_grade: "some updated cle_pv_sys_murmur_grade", cle_complain_chest_pain_yn: false, cle_tm: ~T[15:01:01], cle_tr_notes: "some updated cle_tr_notes", cle_complain_palpitations_yn: false, cle_heart_sounds_abnormal_yn: false, cle_s2_heart_sound: "some updated cle_s2_heart_sound", cle_temperature: "some updated cle_temperature", cle_mv_abnormal_yn: false, cle_s3_heart_sound_yn: false, cle_continuous_murmur: "some updated cle_continuous_murmur", cle_s1_heart_sound: "some updated cle_s1_heart_sound", cle_tr_sys_murmur_yn: false, cle_pv_dias_murmur_yn: false, cle_complain_dysp: "some updated cle_complain_dysp", cle_dt: ~D[2011-05-18], cle_mv_dias_murmur_grade: "some updated cle_mv_dias_murmur_grade", cle_av_sys_murmur_yn: false, cle_tr_dias_murmur_yn: false, cle_mv_sys_murmur_grade: "some updated cle_mv_sys_murmur_grade", cle_av_abnormal_yn: false, cle_mv_sys_murmur_yn: false, cle_av_dias_murmur_grade: "some updated cle_av_dias_murmur_grade", cle_av_prosthetic_sound_yn: false, cle_mv_dias_murmur_yn: false, cle_pv_notes: "some updated cle_pv_notes", cle_complain_cough_yn: false, cle_murmur_notes: "some updated cle_murmur_notes", cle_s4_heart_sound_yn: false, cle_av_sys_murmur_grade: "some updated cle_av_sys_murmur_grade", cle_mv_opening_snap_yn: false, cle_complain_yn: false, cle_av_dias_murmur_yn: false, cle_no_ejection_click_yn: false, cle_complain_notes: "some updated cle_complain_notes", cle_mv_notes: "some updated cle_mv_notes", cle_pv_sys_murmur_yn: false, cle_pv_abnormal_yn: false, cle_peri_rub_yn: false, cle_killip_class: "some updated cle_killip_class", cle_normal_yn: false, cle_pv_dias_murmur_grade: "some updated cle_pv_dias_murmur_grade", cle_tr_abnormal_yn: false, cle_mv_prosthetic_sound_yn: false}
  @invalid_attrs %{cle_sounds_notes: nil, cle_av_ejection_click_yn: nil, cle_pv_sys_murmur_grade: nil, cle_complain_chest_pain_yn: nil, cle_tm: nil, cle_tr_notes: nil, cle_complain_palpitations_yn: nil, cle_heart_sounds_abnormal_yn: nil, cle_s2_heart_sound: nil, cle_temperature: nil, cle_mv_abnormal_yn: nil, cle_s3_heart_sound_yn: nil, cle_continuous_murmur: nil, cle_s1_heart_sound: nil, cle_tr_sys_murmur_yn: nil, cle_pv_dias_murmur_yn: nil, cle_complain_dysp: nil, cle_dt: nil, cle_mv_dias_murmur_grade: nil, cle_av_sys_murmur_yn: nil, cle_tr_dias_murmur_yn: nil, cle_mv_sys_murmur_grade: nil, cle_av_abnormal_yn: nil, cle_mv_sys_murmur_yn: nil, cle_av_dias_murmur_grade: nil, cle_av_prosthetic_sound_yn: nil, cle_mv_dias_murmur_yn: nil, cle_pv_notes: nil, cle_complain_cough_yn: nil, cle_murmur_notes: nil, cle_s4_heart_sound_yn: nil, cle_av_sys_murmur_grade: nil, cle_mv_opening_snap_yn: nil, cle_complain_yn: nil, cle_av_dias_murmur_yn: nil, cle_no_ejection_click_yn: nil, cle_complain_notes: nil, cle_mv_notes: nil, cle_pv_sys_murmur_yn: nil, cle_pv_abnormal_yn: nil, cle_peri_rub_yn: nil, cle_killip_class: nil, cle_normal_yn: nil, cle_pv_dias_murmur_grade: nil, cle_tr_abnormal_yn: nil, cle_mv_prosthetic_sound_yn: nil}

  def fixture(:clinical_exam_cardio) do
    {:ok, clinical_exam_cardio} = Assements.create_clinical_exam_cardio(@create_attrs)
    clinical_exam_cardio
  end

  describe "index" do
    test "lists all clinical_exams_cardios", %{conn: conn} do
      conn = get(conn, Routes.clinical_exam_cardio_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clinical exams cardios"
    end
  end

  describe "new clinical_exam_cardio" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clinical_exam_cardio_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clinical exam cardio"
    end
  end

  describe "create clinical_exam_cardio" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clinical_exam_cardio_path(conn, :create), clinical_exam_cardio: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clinical_exam_cardio_path(conn, :show, id)

      conn = get(conn, Routes.clinical_exam_cardio_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clinical exam cardio"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clinical_exam_cardio_path(conn, :create), clinical_exam_cardio: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clinical exam cardio"
    end
  end

  describe "edit clinical_exam_cardio" do
    setup [:create_clinical_exam_cardio]

    test "renders form for editing chosen clinical_exam_cardio", %{conn: conn, clinical_exam_cardio: clinical_exam_cardio} do
      conn = get(conn, Routes.clinical_exam_cardio_path(conn, :edit, clinical_exam_cardio))
      assert html_response(conn, 200) =~ "Edit Clinical exam cardio"
    end
  end

  describe "update clinical_exam_cardio" do
    setup [:create_clinical_exam_cardio]

    test "redirects when data is valid", %{conn: conn, clinical_exam_cardio: clinical_exam_cardio} do
      conn = put(conn, Routes.clinical_exam_cardio_path(conn, :update, clinical_exam_cardio), clinical_exam_cardio: @update_attrs)
      assert redirected_to(conn) == Routes.clinical_exam_cardio_path(conn, :show, clinical_exam_cardio)

      conn = get(conn, Routes.clinical_exam_cardio_path(conn, :show, clinical_exam_cardio))
      assert html_response(conn, 200) =~ "some updated cle_sounds_notes"
    end

    test "renders errors when data is invalid", %{conn: conn, clinical_exam_cardio: clinical_exam_cardio} do
      conn = put(conn, Routes.clinical_exam_cardio_path(conn, :update, clinical_exam_cardio), clinical_exam_cardio: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clinical exam cardio"
    end
  end

  describe "delete clinical_exam_cardio" do
    setup [:create_clinical_exam_cardio]

    test "deletes chosen clinical_exam_cardio", %{conn: conn, clinical_exam_cardio: clinical_exam_cardio} do
      conn = delete(conn, Routes.clinical_exam_cardio_path(conn, :delete, clinical_exam_cardio))
      assert redirected_to(conn) == Routes.clinical_exam_cardio_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clinical_exam_cardio_path(conn, :show, clinical_exam_cardio))
      end
    end
  end

  defp create_clinical_exam_cardio(_) do
    clinical_exam_cardio = fixture(:clinical_exam_cardio)
    {:ok, clinical_exam_cardio: clinical_exam_cardio}
  end
end
