defmodule AngioWeb.Chd_risk_factorControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Congenitals

  @create_attrs %{chd_arrhythmia_history: [], chd_cardiomyopathy_history: "some chd_cardiomyopathy_history", chd_cardiomyopathy_yn: true, chd_chronic_lung_disease_yn: true, chd_coagulation_disorder_yn: true, chd_diabetes_yn: true, chd_endocarditis_yn: true, chd_heart_transplant_yn: true, chd_hepatic_disease_yn: true, chd_hf_1_month_yn: true, chd_hyper_coagulable_state_yn: true, chd_hypo_coagulable_state_yn: true, chd_ischemic_heart_disease_yn: true, chd_kawasaki_yn: true, chd_nyha: "some chd_nyha", chd_renal_insufficiency_yn: true, chd_rheumatic_heart_disease_yn: true, chd_risk_factors_notes: "some chd_risk_factors_notes", chd_seizure_disorder_yn: true, chd_sickle_cell_anemia_yn: true, chd_stroke_prior_yn: true}
  @update_attrs %{chd_arrhythmia_history: [], chd_cardiomyopathy_history: "some updated chd_cardiomyopathy_history", chd_cardiomyopathy_yn: false, chd_chronic_lung_disease_yn: false, chd_coagulation_disorder_yn: false, chd_diabetes_yn: false, chd_endocarditis_yn: false, chd_heart_transplant_yn: false, chd_hepatic_disease_yn: false, chd_hf_1_month_yn: false, chd_hyper_coagulable_state_yn: false, chd_hypo_coagulable_state_yn: false, chd_ischemic_heart_disease_yn: false, chd_kawasaki_yn: false, chd_nyha: "some updated chd_nyha", chd_renal_insufficiency_yn: false, chd_rheumatic_heart_disease_yn: false, chd_risk_factors_notes: "some updated chd_risk_factors_notes", chd_seizure_disorder_yn: false, chd_sickle_cell_anemia_yn: false, chd_stroke_prior_yn: false}
  @invalid_attrs %{chd_arrhythmia_history: nil, chd_cardiomyopathy_history: nil, chd_cardiomyopathy_yn: nil, chd_chronic_lung_disease_yn: nil, chd_coagulation_disorder_yn: nil, chd_diabetes_yn: nil, chd_endocarditis_yn: nil, chd_heart_transplant_yn: nil, chd_hepatic_disease_yn: nil, chd_hf_1_month_yn: nil, chd_hyper_coagulable_state_yn: nil, chd_hypo_coagulable_state_yn: nil, chd_ischemic_heart_disease_yn: nil, chd_kawasaki_yn: nil, chd_nyha: nil, chd_renal_insufficiency_yn: nil, chd_rheumatic_heart_disease_yn: nil, chd_risk_factors_notes: nil, chd_seizure_disorder_yn: nil, chd_sickle_cell_anemia_yn: nil, chd_stroke_prior_yn: nil}

  def fixture(:chd_risk_factor) do
    {:ok, chd_risk_factor} = Congenitals.create_chd_risk_factor(@create_attrs)
    chd_risk_factor
  end

  describe "index" do
    test "lists all chd_risk_factors", %{conn: conn} do
      conn = get(conn, Routes.chd_risk_factor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chd risk factors"
    end
  end

  describe "new chd_risk_factor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chd_risk_factor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chd risk factor"
    end
  end

  describe "create chd_risk_factor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chd_risk_factor_path(conn, :create), chd_risk_factor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chd_risk_factor_path(conn, :show, id)

      conn = get(conn, Routes.chd_risk_factor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chd risk factor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chd_risk_factor_path(conn, :create), chd_risk_factor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chd risk factor"
    end
  end

  describe "edit chd_risk_factor" do
    setup [:create_chd_risk_factor]

    test "renders form for editing chosen chd_risk_factor", %{conn: conn, chd_risk_factor: chd_risk_factor} do
      conn = get(conn, Routes.chd_risk_factor_path(conn, :edit, chd_risk_factor))
      assert html_response(conn, 200) =~ "Edit Chd risk factor"
    end
  end

  describe "update chd_risk_factor" do
    setup [:create_chd_risk_factor]

    test "redirects when data is valid", %{conn: conn, chd_risk_factor: chd_risk_factor} do
      conn = put(conn, Routes.chd_risk_factor_path(conn, :update, chd_risk_factor), chd_risk_factor: @update_attrs)
      assert redirected_to(conn) == Routes.chd_risk_factor_path(conn, :show, chd_risk_factor)

      conn = get(conn, Routes.chd_risk_factor_path(conn, :show, chd_risk_factor))
      assert html_response(conn, 200) =~ ""
    end

    test "renders errors when data is invalid", %{conn: conn, chd_risk_factor: chd_risk_factor} do
      conn = put(conn, Routes.chd_risk_factor_path(conn, :update, chd_risk_factor), chd_risk_factor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chd risk factor"
    end
  end

  describe "delete chd_risk_factor" do
    setup [:create_chd_risk_factor]

    test "deletes chosen chd_risk_factor", %{conn: conn, chd_risk_factor: chd_risk_factor} do
      conn = delete(conn, Routes.chd_risk_factor_path(conn, :delete, chd_risk_factor))
      assert redirected_to(conn) == Routes.chd_risk_factor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.chd_risk_factor_path(conn, :show, chd_risk_factor))
      end
    end
  end

  defp create_chd_risk_factor(_) do
    chd_risk_factor = fixture(:chd_risk_factor)
    {:ok, chd_risk_factor: chd_risk_factor}
  end
end
