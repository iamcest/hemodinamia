defmodule AngioWeb.PatientControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Persons

  @create_attrs %{
    "": "some ",
    patient_other_id: "some patient_other_id",
    patnts_birth_dt: ~D[2010-04-17],
    patnts_deceased: true,
    patnts_ethnicity_hispanic: "some patnts_ethnicity_hispanic",
    patnts_father_name: "some patnts_father_name",
    patnts_first_name: "some patnts_first_name",
    patnts_gender: "some patnts_gender",
    patnts_language_preferred: "some patnts_language_preferred",
    patnts_last_name: "some patnts_last_name",
    patnts_middle_name: "some patnts_middle_name",
    patnts_mother_name: "some patnts_mother_name",
    patnts_notes: "some patnts_notes",
    patnts_race: "some patnts_race",
    patnts_record_active: true,
    patnts_ssn: "some patnts_ssn",
    patnts_ssn_na: true,
    patnts_uuid: "some patnts_uuid"
  }
  @update_attrs %{
    "": "some updated ",
    patient_other_id: "some updated patient_other_id",
    patnts_birth_dt: ~D[2011-05-18],
    patnts_deceased: false,
    patnts_ethnicity_hispanic: "some updated patnts_ethnicity_hispanic",
    patnts_father_name: "some updated patnts_father_name",
    patnts_first_name: "some updated patnts_first_name",
    patnts_gender: "some updated patnts_gender",
    patnts_language_preferred: "some updated patnts_language_preferred",
    patnts_last_name: "some updated patnts_last_name",
    patnts_middle_name: "some updated patnts_middle_name",
    patnts_mother_name: "some updated patnts_mother_name",
    patnts_notes: "some updated patnts_notes",
    patnts_race: "some updated patnts_race",
    patnts_record_active: false,
    patnts_ssn: "some updated patnts_ssn",
    patnts_ssn_na: false,
    patnts_uuid: "some updated patnts_uuid"
  }
  @invalid_attrs %{
    "": nil,
    patient_other_id: nil,
    patnts_birth_dt: nil,
    patnts_deceased: nil,
    patnts_ethnicity_hispanic: nil,
    patnts_father_name: nil,
    patnts_first_name: nil,
    patnts_gender: nil,
    patnts_language_preferred: nil,
    patnts_last_name: nil,
    patnts_middle_name: nil,
    patnts_mother_name: nil,
    patnts_notes: nil,
    patnts_race: nil,
    patnts_record_active: nil,
    patnts_ssn: nil,
    patnts_ssn_na: nil,
    patnts_uuid: nil
  }

  def fixture(:patient) do
    {:ok, patient} = Persons.create_patient(@create_attrs)
    patient
  end

  describe "index" do
    test "lists all patients", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Patients"
    end
  end

  describe "new patient" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :new))
      assert html_response(conn, 200) =~ "New Patient"
    end
  end

  describe "create patient" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.patient_path(conn, :show, id)

      conn = get(conn, Routes.patient_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Patient"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Patient"
    end
  end

  describe "edit patient" do
    setup [:create_patient]

    test "renders form for editing chosen patient", %{conn: conn, patient: patient} do
      conn = get(conn, Routes.patient_path(conn, :edit, patient))
      assert html_response(conn, 200) =~ "Edit Patient"
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "redirects when data is valid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @update_attrs)
      assert redirected_to(conn) == Routes.patient_path(conn, :show, patient)

      conn = get(conn, Routes.patient_path(conn, :show, patient))
      assert html_response(conn, 200) =~ "some updated "
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Patient"
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, Routes.patient_path(conn, :delete, patient))
      assert redirected_to(conn) == Routes.patient_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.patient_path(conn, :show, patient))
      end)
    end
  end

  defp create_patient(_) do
    patient = fixture(:patient)
    {:ok, patient: patient}
  end
end
