defmodule Angio.AssementsTest do
  use Angio.DataCase

  alias Angio.Assements

  describe "vital_signs" do
    alias Angio.Assements.Vital_sign

    @valid_attrs %{
      vital_sgns_bmi: "some vital_sgns_bmi",
      vital_sgns_body_temp: "some vital_sgns_body_temp",
      vital_sgns_bp_diast: "some vital_sgns_bp_diast",
      vital_sgns_bp_sys: "some vital_sgns_bp_sys",
      vital_sgns_dt: ~D[2010-04-17],
      vital_sgns_head_circumference: "some vital_sgns_head_circumference",
      vital_sgns_height: "some vital_sgns_height",
      vital_sgns_height_lying: "some vital_sgns_height_lying",
      vital_sgns_notes: "some vital_sgns_notes",
      vital_sgns_pulse_rate: "some vital_sgns_pulse_rate",
      vital_sgns_respiratory_rate: "some vital_sgns_respiratory_rate",
      vital_sgns_sat_val: "some vital_sgns_sat_val",
      vital_sgns_tm: ~T[14:00:00],
      vital_sgns_waist_val: "some vital_sgns_waist_val",
      vital_sgns_weight_val: "some vital_sgns_weight_val"
    }
    @update_attrs %{
      vital_sgns_bmi: "some updated vital_sgns_bmi",
      vital_sgns_body_temp: "some updated vital_sgns_body_temp",
      vital_sgns_bp_diast: "some updated vital_sgns_bp_diast",
      vital_sgns_bp_sys: "some updated vital_sgns_bp_sys",
      vital_sgns_dt: ~D[2011-05-18],
      vital_sgns_head_circumference: "some updated vital_sgns_head_circumference",
      vital_sgns_height: "some updated vital_sgns_height",
      vital_sgns_height_lying: "some updated vital_sgns_height_lying",
      vital_sgns_notes: "some updated vital_sgns_notes",
      vital_sgns_pulse_rate: "some updated vital_sgns_pulse_rate",
      vital_sgns_respiratory_rate: "some updated vital_sgns_respiratory_rate",
      vital_sgns_sat_val: "some updated vital_sgns_sat_val",
      vital_sgns_tm: ~T[15:01:01],
      vital_sgns_waist_val: "some updated vital_sgns_waist_val",
      vital_sgns_weight_val: "some updated vital_sgns_weight_val"
    }
    @invalid_attrs %{
      vital_sgns_bmi: nil,
      vital_sgns_body_temp: nil,
      vital_sgns_bp_diast: nil,
      vital_sgns_bp_sys: nil,
      vital_sgns_dt: nil,
      vital_sgns_head_circumference: nil,
      vital_sgns_height: nil,
      vital_sgns_height_lying: nil,
      vital_sgns_notes: nil,
      vital_sgns_pulse_rate: nil,
      vital_sgns_respiratory_rate: nil,
      vital_sgns_sat_val: nil,
      vital_sgns_tm: nil,
      vital_sgns_waist_val: nil,
      vital_sgns_weight_val: nil
    }

    def vital_sign_fixture(attrs \\ %{}) do
      {:ok, vital_sign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assements.create_vital_sign()

      vital_sign
    end

    test "list_vital_signs/0 returns all vital_signs" do
      vital_sign = vital_sign_fixture()
      assert Assements.list_vital_signs() == [vital_sign]
    end

    test "get_vital_sign!/1 returns the vital_sign with given id" do
      vital_sign = vital_sign_fixture()
      assert Assements.get_vital_sign!(vital_sign.id) == vital_sign
    end

    test "create_vital_sign/1 with valid data creates a vital_sign" do
      assert {:ok, %Vital_sign{} = vital_sign} = Assements.create_vital_sign(@valid_attrs)
      assert vital_sign.vital_sgns_bmi == "some vital_sgns_bmi"
      assert vital_sign.vital_sgns_body_temp == "some vital_sgns_body_temp"
      assert vital_sign.vital_sgns_bp_diast == "some vital_sgns_bp_diast"
      assert vital_sign.vital_sgns_bp_sys == "some vital_sgns_bp_sys"
      assert vital_sign.vital_sgns_dt == ~D[2010-04-17]
      assert vital_sign.vital_sgns_head_circumference == "some vital_sgns_head_circumference"
      assert vital_sign.vital_sgns_height == "some vital_sgns_height"
      assert vital_sign.vital_sgns_height_lying == "some vital_sgns_height_lying"
      assert vital_sign.vital_sgns_notes == "some vital_sgns_notes"
      assert vital_sign.vital_sgns_pulse_rate == "some vital_sgns_pulse_rate"
      assert vital_sign.vital_sgns_respiratory_rate == "some vital_sgns_respiratory_rate"
      assert vital_sign.vital_sgns_sat_val == "some vital_sgns_sat_val"
      assert vital_sign.vital_sgns_tm == ~T[14:00:00]
      assert vital_sign.vital_sgns_waist_val == "some vital_sgns_waist_val"
      assert vital_sign.vital_sgns_weight_val == "some vital_sgns_weight_val"
    end

    test "create_vital_sign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assements.create_vital_sign(@invalid_attrs)
    end

    test "update_vital_sign/2 with valid data updates the vital_sign" do
      vital_sign = vital_sign_fixture()

      assert {:ok, %Vital_sign{} = vital_sign} =
               Assements.update_vital_sign(vital_sign, @update_attrs)

      assert vital_sign.vital_sgns_bmi == "some updated vital_sgns_bmi"
      assert vital_sign.vital_sgns_body_temp == "some updated vital_sgns_body_temp"
      assert vital_sign.vital_sgns_bp_diast == "some updated vital_sgns_bp_diast"
      assert vital_sign.vital_sgns_bp_sys == "some updated vital_sgns_bp_sys"
      assert vital_sign.vital_sgns_dt == ~D[2011-05-18]

      assert vital_sign.vital_sgns_head_circumference ==
               "some updated vital_sgns_head_circumference"

      assert vital_sign.vital_sgns_height == "some updated vital_sgns_height"
      assert vital_sign.vital_sgns_height_lying == "some updated vital_sgns_height_lying"
      assert vital_sign.vital_sgns_notes == "some updated vital_sgns_notes"
      assert vital_sign.vital_sgns_pulse_rate == "some updated vital_sgns_pulse_rate"
      assert vital_sign.vital_sgns_respiratory_rate == "some updated vital_sgns_respiratory_rate"
      assert vital_sign.vital_sgns_sat_val == "some updated vital_sgns_sat_val"
      assert vital_sign.vital_sgns_tm == ~T[15:01:01]
      assert vital_sign.vital_sgns_waist_val == "some updated vital_sgns_waist_val"
      assert vital_sign.vital_sgns_weight_val == "some updated vital_sgns_weight_val"
    end

    test "update_vital_sign/2 with invalid data returns error changeset" do
      vital_sign = vital_sign_fixture()
      assert {:error, %Ecto.Changeset{}} = Assements.update_vital_sign(vital_sign, @invalid_attrs)
      assert vital_sign == Assements.get_vital_sign!(vital_sign.id)
    end

    test "delete_vital_sign/1 deletes the vital_sign" do
      vital_sign = vital_sign_fixture()
      assert {:ok, %Vital_sign{}} = Assements.delete_vital_sign(vital_sign)
      assert_raise Ecto.NoResultsError, fn -> Assements.get_vital_sign!(vital_sign.id) end
    end

    test "change_vital_sign/1 returns a vital_sign changeset" do
      vital_sign = vital_sign_fixture()
      assert %Ecto.Changeset{} = Assements.change_vital_sign(vital_sign)
    end
  end

  describe "functional_states" do
    alias Angio.Assements.Functional_state

    @valid_attrs %{funs_basic_adl: "some funs_basic_adl", funs_cognition_level: "some funs_cognition_level", funs_frailty_scale_csha: "some funs_frailty_scale_csha", funs_katz_index: "some funs_katz_index", funs_kccq12_score: "some funs_kccq12_score", funs_notes: "some funs_notes", funs_status_assess_dt: ~D[2010-04-17], funs_stroke_rankin_dt: ~D[2010-04-17], funs_stroke_rankin_modified: "some funs_stroke_rankin_modified", funs_walking_level: "some funs_walking_level"}
    @update_attrs %{funs_basic_adl: "some updated funs_basic_adl", funs_cognition_level: "some updated funs_cognition_level", funs_frailty_scale_csha: "some updated funs_frailty_scale_csha", funs_katz_index: "some updated funs_katz_index", funs_kccq12_score: "some updated funs_kccq12_score", funs_notes: "some updated funs_notes", funs_status_assess_dt: ~D[2011-05-18], funs_stroke_rankin_dt: ~D[2011-05-18], funs_stroke_rankin_modified: "some updated funs_stroke_rankin_modified", funs_walking_level: "some updated funs_walking_level"}
    @invalid_attrs %{funs_basic_adl: nil, funs_cognition_level: nil, funs_frailty_scale_csha: nil, funs_katz_index: nil, funs_kccq12_score: nil, funs_notes: nil, funs_status_assess_dt: nil, funs_stroke_rankin_dt: nil, funs_stroke_rankin_modified: nil, funs_walking_level: nil}

    def functional_state_fixture(attrs \\ %{}) do
      {:ok, functional_state} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assements.create_functional_state()

      functional_state
    end

    test "list_functional_states/0 returns all functional_states" do
      functional_state = functional_state_fixture()
      assert Assements.list_functional_states() == [functional_state]
    end

    test "get_functional_state!/1 returns the functional_state with given id" do
      functional_state = functional_state_fixture()
      assert Assements.get_functional_state!(functional_state.id) == functional_state
    end

    test "create_functional_state/1 with valid data creates a functional_state" do
      assert {:ok, %Functional_state{} = functional_state} = Assements.create_functional_state(@valid_attrs)
      assert functional_state.funs_basic_adl == "some funs_basic_adl"
      assert functional_state.funs_cognition_level == "some funs_cognition_level"
      assert functional_state.funs_frailty_scale_csha == "some funs_frailty_scale_csha"
      assert functional_state.funs_katz_index == "some funs_katz_index"
      assert functional_state.funs_kccq12_score == "some funs_kccq12_score"
      assert functional_state.funs_notes == "some funs_notes"
      assert functional_state.funs_status_assess_dt == ~D[2010-04-17]
      assert functional_state.funs_stroke_rankin_dt == ~D[2010-04-17]
      assert functional_state.funs_stroke_rankin_modified == "some funs_stroke_rankin_modified"
      assert functional_state.funs_walking_level == "some funs_walking_level"
    end

    test "create_functional_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assements.create_functional_state(@invalid_attrs)
    end

    test "update_functional_state/2 with valid data updates the functional_state" do
      functional_state = functional_state_fixture()
      assert {:ok, %Functional_state{} = functional_state} = Assements.update_functional_state(functional_state, @update_attrs)
      assert functional_state.funs_basic_adl == "some updated funs_basic_adl"
      assert functional_state.funs_cognition_level == "some updated funs_cognition_level"
      assert functional_state.funs_frailty_scale_csha == "some updated funs_frailty_scale_csha"
      assert functional_state.funs_katz_index == "some updated funs_katz_index"
      assert functional_state.funs_kccq12_score == "some updated funs_kccq12_score"
      assert functional_state.funs_notes == "some updated funs_notes"
      assert functional_state.funs_status_assess_dt == ~D[2011-05-18]
      assert functional_state.funs_stroke_rankin_dt == ~D[2011-05-18]
      assert functional_state.funs_stroke_rankin_modified == "some updated funs_stroke_rankin_modified"
      assert functional_state.funs_walking_level == "some updated funs_walking_level"
    end

    test "update_functional_state/2 with invalid data returns error changeset" do
      functional_state = functional_state_fixture()
      assert {:error, %Ecto.Changeset{}} = Assements.update_functional_state(functional_state, @invalid_attrs)
      assert functional_state == Assements.get_functional_state!(functional_state.id)
    end

    test "delete_functional_state/1 deletes the functional_state" do
      functional_state = functional_state_fixture()
      assert {:ok, %Functional_state{}} = Assements.delete_functional_state(functional_state)
      assert_raise Ecto.NoResultsError, fn -> Assements.get_functional_state!(functional_state.id) end
    end

    test "change_functional_state/1 returns a functional_state changeset" do
      functional_state = functional_state_fixture()
      assert %Ecto.Changeset{} = Assements.change_functional_state(functional_state)
    end
  end

  describe "clinical_exams_cardios" do
    alias Angio.Assements.Clinical_exam_cardio

    @valid_attrs %{cle_sounds_notes: "some cle_sounds_notes", cle_av_ejection_click_yn: true, cle_pv_sys_murmur_grade: "some cle_pv_sys_murmur_grade", cle_complain_chest_pain_yn: true, cle_tm: ~T[14:00:00], cle_tr_notes: "some cle_tr_notes", cle_complain_palpitations_yn: true, cle_heart_sounds_abnormal_yn: true, cle_s2_heart_sound: "some cle_s2_heart_sound", cle_temperature: "some cle_temperature", cle_mv_abnormal_yn: true, cle_s3_heart_sound_yn: true, cle_continuous_murmur: "some cle_continuous_murmur", cle_s1_heart_sound: "some cle_s1_heart_sound", cle_tr_sys_murmur_yn: true, cle_pv_dias_murmur_yn: true, cle_complain_dysp: "some cle_complain_dysp", cle_dt: ~D[2010-04-17], cle_mv_dias_murmur_grade: "some cle_mv_dias_murmur_grade", cle_av_sys_murmur_yn: true, cle_tr_dias_murmur_yn: true, cle_mv_sys_murmur_grade: "some cle_mv_sys_murmur_grade", cle_av_abnormal_yn: true, cle_mv_sys_murmur_yn: true, cle_av_dias_murmur_grade: "some cle_av_dias_murmur_grade", cle_av_prosthetic_sound_yn: true, cle_mv_dias_murmur_yn: true, cle_pv_notes: "some cle_pv_notes", cle_complain_cough_yn: true, cle_murmur_notes: "some cle_murmur_notes", cle_s4_heart_sound_yn: true, cle_av_sys_murmur_grade: "some cle_av_sys_murmur_grade", cle_mv_opening_snap_yn: true, cle_complain_yn: true, cle_av_dias_murmur_yn: true, cle_no_ejection_click_yn: true, cle_complain_notes: "some cle_complain_notes", cle_mv_notes: "some cle_mv_notes", cle_pv_sys_murmur_yn: true, cle_pv_abnormal_yn: true, cle_peri_rub_yn: true, cle_killip_class: "some cle_killip_class", cle_normal_yn: true, cle_pv_dias_murmur_grade: "some cle_pv_dias_murmur_grade", cle_tr_abnormal_yn: true, cle_mv_prosthetic_sound_yn: true}
    @update_attrs %{cle_sounds_notes: "some updated cle_sounds_notes", cle_av_ejection_click_yn: false, cle_pv_sys_murmur_grade: "some updated cle_pv_sys_murmur_grade", cle_complain_chest_pain_yn: false, cle_tm: ~T[15:01:01], cle_tr_notes: "some updated cle_tr_notes", cle_complain_palpitations_yn: false, cle_heart_sounds_abnormal_yn: false, cle_s2_heart_sound: "some updated cle_s2_heart_sound", cle_temperature: "some updated cle_temperature", cle_mv_abnormal_yn: false, cle_s3_heart_sound_yn: false, cle_continuous_murmur: "some updated cle_continuous_murmur", cle_s1_heart_sound: "some updated cle_s1_heart_sound", cle_tr_sys_murmur_yn: false, cle_pv_dias_murmur_yn: false, cle_complain_dysp: "some updated cle_complain_dysp", cle_dt: ~D[2011-05-18], cle_mv_dias_murmur_grade: "some updated cle_mv_dias_murmur_grade", cle_av_sys_murmur_yn: false, cle_tr_dias_murmur_yn: false, cle_mv_sys_murmur_grade: "some updated cle_mv_sys_murmur_grade", cle_av_abnormal_yn: false, cle_mv_sys_murmur_yn: false, cle_av_dias_murmur_grade: "some updated cle_av_dias_murmur_grade", cle_av_prosthetic_sound_yn: false, cle_mv_dias_murmur_yn: false, cle_pv_notes: "some updated cle_pv_notes", cle_complain_cough_yn: false, cle_murmur_notes: "some updated cle_murmur_notes", cle_s4_heart_sound_yn: false, cle_av_sys_murmur_grade: "some updated cle_av_sys_murmur_grade", cle_mv_opening_snap_yn: false, cle_complain_yn: false, cle_av_dias_murmur_yn: false, cle_no_ejection_click_yn: false, cle_complain_notes: "some updated cle_complain_notes", cle_mv_notes: "some updated cle_mv_notes", cle_pv_sys_murmur_yn: false, cle_pv_abnormal_yn: false, cle_peri_rub_yn: false, cle_killip_class: "some updated cle_killip_class", cle_normal_yn: false, cle_pv_dias_murmur_grade: "some updated cle_pv_dias_murmur_grade", cle_tr_abnormal_yn: false, cle_mv_prosthetic_sound_yn: false}
    @invalid_attrs %{cle_sounds_notes: nil, cle_av_ejection_click_yn: nil, cle_pv_sys_murmur_grade: nil, cle_complain_chest_pain_yn: nil, cle_tm: nil, cle_tr_notes: nil, cle_complain_palpitations_yn: nil, cle_heart_sounds_abnormal_yn: nil, cle_s2_heart_sound: nil, cle_temperature: nil, cle_mv_abnormal_yn: nil, cle_s3_heart_sound_yn: nil, cle_continuous_murmur: nil, cle_s1_heart_sound: nil, cle_tr_sys_murmur_yn: nil, cle_pv_dias_murmur_yn: nil, cle_complain_dysp: nil, cle_dt: nil, cle_mv_dias_murmur_grade: nil, cle_av_sys_murmur_yn: nil, cle_tr_dias_murmur_yn: nil, cle_mv_sys_murmur_grade: nil, cle_av_abnormal_yn: nil, cle_mv_sys_murmur_yn: nil, cle_av_dias_murmur_grade: nil, cle_av_prosthetic_sound_yn: nil, cle_mv_dias_murmur_yn: nil, cle_pv_notes: nil, cle_complain_cough_yn: nil, cle_murmur_notes: nil, cle_s4_heart_sound_yn: nil, cle_av_sys_murmur_grade: nil, cle_mv_opening_snap_yn: nil, cle_complain_yn: nil, cle_av_dias_murmur_yn: nil, cle_no_ejection_click_yn: nil, cle_complain_notes: nil, cle_mv_notes: nil, cle_pv_sys_murmur_yn: nil, cle_pv_abnormal_yn: nil, cle_peri_rub_yn: nil, cle_killip_class: nil, cle_normal_yn: nil, cle_pv_dias_murmur_grade: nil, cle_tr_abnormal_yn: nil, cle_mv_prosthetic_sound_yn: nil}

    def clinical_exam_cardio_fixture(attrs \\ %{}) do
      {:ok, clinical_exam_cardio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assements.create_clinical_exam_cardio()

      clinical_exam_cardio
    end

    test "list_clinical_exams_cardios/0 returns all clinical_exams_cardios" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert Assements.list_clinical_exams_cardios() == [clinical_exam_cardio]
    end

    test "get_clinical_exam_cardio!/1 returns the clinical_exam_cardio with given id" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert Assements.get_clinical_exam_cardio!(clinical_exam_cardio.id) == clinical_exam_cardio
    end

    test "create_clinical_exam_cardio/1 with valid data creates a clinical_exam_cardio" do
      assert {:ok, %Clinical_exam_cardio{} = clinical_exam_cardio} = Assements.create_clinical_exam_cardio(@valid_attrs)
      assert clinical_exam_cardio.cle_mv_prosthetic_sound_yn == true
      assert clinical_exam_cardio.cle_tr_abnormal_yn == true
      assert clinical_exam_cardio.cle_pv_dias_murmur_grade == "some cle_pv_dias_murmur_grade"
      assert clinical_exam_cardio.cle_normal_yn == true
      assert clinical_exam_cardio.cle_killip_class == "some cle_killip_class"
      assert clinical_exam_cardio.cle_peri_rub_yn == true
      assert clinical_exam_cardio.cle_pv_abnormal_yn == true
      assert clinical_exam_cardio.cle_pv_sys_murmur_yn == true
      assert clinical_exam_cardio.cle_mv_notes == "some cle_mv_notes"
      assert clinical_exam_cardio.cle_complain_notes == "some cle_complain_notes"
      assert clinical_exam_cardio.cle_no_ejection_click_yn == true
      assert clinical_exam_cardio.cle_av_dias_murmur_yn == true
      assert clinical_exam_cardio.cle_complain_yn == true
      assert clinical_exam_cardio.cle_mv_opening_snap_yn == true
      assert clinical_exam_cardio.cle_av_sys_murmur_grade == "some cle_av_sys_murmur_grade"
      assert clinical_exam_cardio.cle_s4_heart_sound_yn == true
      assert clinical_exam_cardio.cle_murmur_notes == "some cle_murmur_notes"
      assert clinical_exam_cardio.cle_complain_cough_yn == true
      assert clinical_exam_cardio.cle_pv_notes == "some cle_pv_notes"
      assert clinical_exam_cardio.cle_mv_dias_murmur_yn == true
      assert clinical_exam_cardio.cle_av_prosthetic_sound_yn == true
      assert clinical_exam_cardio.cle_av_dias_murmur_grade == "some cle_av_dias_murmur_grade"
      assert clinical_exam_cardio.cle_mv_sys_murmur_yn == true
      assert clinical_exam_cardio.cle_av_abnormal_yn == true
      assert clinical_exam_cardio.cle_mv_sys_murmur_grade == "some cle_mv_sys_murmur_grade"
      assert clinical_exam_cardio.cle_tr_dias_murmur_yn == true
      assert clinical_exam_cardio.cle_av_sys_murmur_yn == true
      assert clinical_exam_cardio.cle_mv_dias_murmur_grade == "some cle_mv_dias_murmur_grade"
      assert clinical_exam_cardio.cle_dt == ~D[2010-04-17]
      assert clinical_exam_cardio.cle_complain_dysp == "some cle_complain_dysp"
      assert clinical_exam_cardio.cle_pv_dias_murmur_yn == true
      assert clinical_exam_cardio.cle_tr_sys_murmur_yn == true
      assert clinical_exam_cardio.cle_s1_heart_sound == "some cle_s1_heart_sound"
      assert clinical_exam_cardio.cle_continuous_murmur == "some cle_continuous_murmur"
      assert clinical_exam_cardio.cle_s3_heart_sound_yn == true
      assert clinical_exam_cardio.cle_mv_abnormal_yn == true
      assert clinical_exam_cardio.cle_temperature == "some cle_temperature"
      assert clinical_exam_cardio.cle_s2_heart_sound == "some cle_s2_heart_sound"
      assert clinical_exam_cardio.cle_heart_sounds_abnormal_yn == true
      assert clinical_exam_cardio.cle_complain_palpitations_yn == true
      assert clinical_exam_cardio.cle_tr_notes == "some cle_tr_notes"
      assert clinical_exam_cardio.cle_tm == ~T[14:00:00]
      assert clinical_exam_cardio.cle_complain_chest_pain_yn == true
      assert clinical_exam_cardio.cle_pv_sys_murmur_grade == "some cle_pv_sys_murmur_grade"
      assert clinical_exam_cardio.cle_av_ejection_click_yn == true
      assert clinical_exam_cardio.cle_sounds_notes == "some cle_sounds_notes"
    end

    test "create_clinical_exam_cardio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assements.create_clinical_exam_cardio(@invalid_attrs)
    end

    test "update_clinical_exam_cardio/2 with valid data updates the clinical_exam_cardio" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert {:ok, %Clinical_exam_cardio{} = clinical_exam_cardio} = Assements.update_clinical_exam_cardio(clinical_exam_cardio, @update_attrs)
      assert clinical_exam_cardio.cle_mv_prosthetic_sound_yn == false
      assert clinical_exam_cardio.cle_tr_abnormal_yn == false
      assert clinical_exam_cardio.cle_pv_dias_murmur_grade == "some updated cle_pv_dias_murmur_grade"
      assert clinical_exam_cardio.cle_normal_yn == false
      assert clinical_exam_cardio.cle_killip_class == "some updated cle_killip_class"
      assert clinical_exam_cardio.cle_peri_rub_yn == false
      assert clinical_exam_cardio.cle_pv_abnormal_yn == false
      assert clinical_exam_cardio.cle_pv_sys_murmur_yn == false
      assert clinical_exam_cardio.cle_mv_notes == "some updated cle_mv_notes"
      assert clinical_exam_cardio.cle_complain_notes == "some updated cle_complain_notes"
      assert clinical_exam_cardio.cle_no_ejection_click_yn == false
      assert clinical_exam_cardio.cle_av_dias_murmur_yn == false
      assert clinical_exam_cardio.cle_complain_yn == false
      assert clinical_exam_cardio.cle_mv_opening_snap_yn == false
      assert clinical_exam_cardio.cle_av_sys_murmur_grade == "some updated cle_av_sys_murmur_grade"
      assert clinical_exam_cardio.cle_s4_heart_sound_yn == false
      assert clinical_exam_cardio.cle_murmur_notes == "some updated cle_murmur_notes"
      assert clinical_exam_cardio.cle_complain_cough_yn == false
      assert clinical_exam_cardio.cle_pv_notes == "some updated cle_pv_notes"
      assert clinical_exam_cardio.cle_mv_dias_murmur_yn == false
      assert clinical_exam_cardio.cle_av_prosthetic_sound_yn == false
      assert clinical_exam_cardio.cle_av_dias_murmur_grade == "some updated cle_av_dias_murmur_grade"
      assert clinical_exam_cardio.cle_mv_sys_murmur_yn == false
      assert clinical_exam_cardio.cle_av_abnormal_yn == false
      assert clinical_exam_cardio.cle_mv_sys_murmur_grade == "some updated cle_mv_sys_murmur_grade"
      assert clinical_exam_cardio.cle_tr_dias_murmur_yn == false
      assert clinical_exam_cardio.cle_av_sys_murmur_yn == false
      assert clinical_exam_cardio.cle_mv_dias_murmur_grade == "some updated cle_mv_dias_murmur_grade"
      assert clinical_exam_cardio.cle_dt == ~D[2011-05-18]
      assert clinical_exam_cardio.cle_complain_dysp == "some updated cle_complain_dysp"
      assert clinical_exam_cardio.cle_pv_dias_murmur_yn == false
      assert clinical_exam_cardio.cle_tr_sys_murmur_yn == false
      assert clinical_exam_cardio.cle_s1_heart_sound == "some updated cle_s1_heart_sound"
      assert clinical_exam_cardio.cle_continuous_murmur == "some updated cle_continuous_murmur"
      assert clinical_exam_cardio.cle_s3_heart_sound_yn == false
      assert clinical_exam_cardio.cle_mv_abnormal_yn == false
      assert clinical_exam_cardio.cle_temperature == "some updated cle_temperature"
      assert clinical_exam_cardio.cle_s2_heart_sound == "some updated cle_s2_heart_sound"
      assert clinical_exam_cardio.cle_heart_sounds_abnormal_yn == false
      assert clinical_exam_cardio.cle_complain_palpitations_yn == false
      assert clinical_exam_cardio.cle_tr_notes == "some updated cle_tr_notes"
      assert clinical_exam_cardio.cle_tm == ~T[15:01:01]
      assert clinical_exam_cardio.cle_complain_chest_pain_yn == false
      assert clinical_exam_cardio.cle_pv_sys_murmur_grade == "some updated cle_pv_sys_murmur_grade"
      assert clinical_exam_cardio.cle_av_ejection_click_yn == false
      assert clinical_exam_cardio.cle_sounds_notes == "some updated cle_sounds_notes"
    end

    test "update_clinical_exam_cardio/2 with invalid data returns error changeset" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert {:error, %Ecto.Changeset{}} = Assements.update_clinical_exam_cardio(clinical_exam_cardio, @invalid_attrs)
      assert clinical_exam_cardio == Assements.get_clinical_exam_cardio!(clinical_exam_cardio.id)
    end

    test "delete_clinical_exam_cardio/1 deletes the clinical_exam_cardio" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert {:ok, %Clinical_exam_cardio{}} = Assements.delete_clinical_exam_cardio(clinical_exam_cardio)
      assert_raise Ecto.NoResultsError, fn -> Assements.get_clinical_exam_cardio!(clinical_exam_cardio.id) end
    end

    test "change_clinical_exam_cardio/1 returns a clinical_exam_cardio changeset" do
      clinical_exam_cardio = clinical_exam_cardio_fixture()
      assert %Ecto.Changeset{} = Assements.change_clinical_exam_cardio(clinical_exam_cardio)
    end
  end
end
