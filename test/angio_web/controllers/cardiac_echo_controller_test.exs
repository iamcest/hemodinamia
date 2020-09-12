defmodule AngioWeb.Cardiac_echoControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{echo_referring_doctor_2: "some echo_referring_doctor_2", echo_summary_report: "some echo_summary_report", echo_start_dt: ~D[2010-04-17], echo_reason: "some echo_reason", echo_start_tm: ~T[14:00:00], echo_maschine_type: "some echo_maschine_type", echo_study_protocole: "some echo_study_protocole", echo_lab_num: "some echo_lab_num", echo_doctor_reading: "some echo_doctor_reading", echo_patient_location: "some echo_patient_location", echo_study_location: "some echo_study_location", echo_priority: "some echo_priority", echo_performed_yn: true, sonographer_name: "some sonographer_name", echo_pt_height: "some echo_pt_height", echo_doctor_interpeting_group: "some echo_doctor_interpeting_group", echo_pt_weight: "some echo_pt_weight", echo_doctor_reading_npi: "some echo_doctor_reading_npi", echo_media_location: "some echo_media_location", echo_doctor_operator: "some echo_doctor_operator", echo_stop_tm: ~T[14:00:00], echo_requested_dt: ~D[2010-04-17], echo_heart_rate: "some echo_heart_rate", echo_blood_pressure_sys: "some echo_blood_pressure_sys", echo_idication_icd10cm: "some echo_idication_icd10cm", echo_consent_yn: true, echo_afib_yn: true, echo_lab_id: "some echo_lab_id", echo_bsa: "some echo_bsa", echo_referring_doctor_1: "some echo_referring_doctor_1", echo_lab_num_yr: "some echo_lab_num_yr", echo_indication: "some echo_indication", echo_blood_pressure_diast: "some echo_blood_pressure_diast"}
  @update_attrs %{echo_referring_doctor_2: "some updated echo_referring_doctor_2", echo_summary_report: "some updated echo_summary_report", echo_start_dt: ~D[2011-05-18], echo_reason: "some updated echo_reason", echo_start_tm: ~T[15:01:01], echo_maschine_type: "some updated echo_maschine_type", echo_study_protocole: "some updated echo_study_protocole", echo_lab_num: "some updated echo_lab_num", echo_doctor_reading: "some updated echo_doctor_reading", echo_patient_location: "some updated echo_patient_location", echo_study_location: "some updated echo_study_location", echo_priority: "some updated echo_priority", echo_performed_yn: false, sonographer_name: "some updated sonographer_name", echo_pt_height: "some updated echo_pt_height", echo_doctor_interpeting_group: "some updated echo_doctor_interpeting_group", echo_pt_weight: "some updated echo_pt_weight", echo_doctor_reading_npi: "some updated echo_doctor_reading_npi", echo_media_location: "some updated echo_media_location", echo_doctor_operator: "some updated echo_doctor_operator", echo_stop_tm: ~T[15:01:01], echo_requested_dt: ~D[2011-05-18], echo_heart_rate: "some updated echo_heart_rate", echo_blood_pressure_sys: "some updated echo_blood_pressure_sys", echo_idication_icd10cm: "some updated echo_idication_icd10cm", echo_consent_yn: false, echo_afib_yn: false, echo_lab_id: "some updated echo_lab_id", echo_bsa: "some updated echo_bsa", echo_referring_doctor_1: "some updated echo_referring_doctor_1", echo_lab_num_yr: "some updated echo_lab_num_yr", echo_indication: "some updated echo_indication", echo_blood_pressure_diast: "some updated echo_blood_pressure_diast"}
  @invalid_attrs %{echo_referring_doctor_2: nil, echo_summary_report: nil, echo_start_dt: nil, echo_reason: nil, echo_start_tm: nil, echo_maschine_type: nil, echo_study_protocole: nil, echo_lab_num: nil, echo_doctor_reading: nil, echo_patient_location: nil, echo_study_location: nil, echo_priority: nil, echo_performed_yn: nil, sonographer_name: nil, echo_pt_height: nil, echo_doctor_interpeting_group: nil, echo_pt_weight: nil, echo_doctor_reading_npi: nil, echo_media_location: nil, echo_doctor_operator: nil, echo_stop_tm: nil, echo_requested_dt: nil, echo_heart_rate: nil, echo_blood_pressure_sys: nil, echo_idication_icd10cm: nil, echo_consent_yn: nil, echo_afib_yn: nil, echo_lab_id: nil, echo_bsa: nil, echo_referring_doctor_1: nil, echo_lab_num_yr: nil, echo_indication: nil, echo_blood_pressure_diast: nil}

  def fixture(:cardiac_echo) do
    {:ok, cardiac_echo} = Ivestigations.create_cardiac_echo(@create_attrs)
    cardiac_echo
  end

  describe "index" do
    test "lists all cardiac_echoes", %{conn: conn} do
      conn = get(conn, Routes.cardiac_echo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cardiac echoes"
    end
  end

  describe "new cardiac_echo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cardiac_echo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cardiac echo"
    end
  end

  describe "create cardiac_echo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cardiac_echo_path(conn, :create), cardiac_echo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cardiac_echo_path(conn, :show, id)

      conn = get(conn, Routes.cardiac_echo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cardiac echo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cardiac_echo_path(conn, :create), cardiac_echo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cardiac echo"
    end
  end

  describe "edit cardiac_echo" do
    setup [:create_cardiac_echo]

    test "renders form for editing chosen cardiac_echo", %{conn: conn, cardiac_echo: cardiac_echo} do
      conn = get(conn, Routes.cardiac_echo_path(conn, :edit, cardiac_echo))
      assert html_response(conn, 200) =~ "Edit Cardiac echo"
    end
  end

  describe "update cardiac_echo" do
    setup [:create_cardiac_echo]

    test "redirects when data is valid", %{conn: conn, cardiac_echo: cardiac_echo} do
      conn = put(conn, Routes.cardiac_echo_path(conn, :update, cardiac_echo), cardiac_echo: @update_attrs)
      assert redirected_to(conn) == Routes.cardiac_echo_path(conn, :show, cardiac_echo)

      conn = get(conn, Routes.cardiac_echo_path(conn, :show, cardiac_echo))
      assert html_response(conn, 200) =~ "some updated echo_referring_doctor_2"
    end

    test "renders errors when data is invalid", %{conn: conn, cardiac_echo: cardiac_echo} do
      conn = put(conn, Routes.cardiac_echo_path(conn, :update, cardiac_echo), cardiac_echo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cardiac echo"
    end
  end

  describe "delete cardiac_echo" do
    setup [:create_cardiac_echo]

    test "deletes chosen cardiac_echo", %{conn: conn, cardiac_echo: cardiac_echo} do
      conn = delete(conn, Routes.cardiac_echo_path(conn, :delete, cardiac_echo))
      assert redirected_to(conn) == Routes.cardiac_echo_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cardiac_echo_path(conn, :show, cardiac_echo))
      end
    end
  end

  defp create_cardiac_echo(_) do
    cardiac_echo = fixture(:cardiac_echo)
    {:ok, cardiac_echo: cardiac_echo}
  end
end
