defmodule AngioWeb.Pci_fupControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Followups

  @create_attrs %{pfup_stroke_dt: ~D[2010-04-17], pfup_old_infarction_location: "some pfup_old_infarction_location", pfup_angina_duration: "some pfup_angina_duration", pfup_xa_inhibitors: "some pfup_xa_inhibitors", pfup_clinical_improvement_yn: true, pfup_reason: "some pfup_reason", pfup_diuretics_yn: true, pfup_notes: "some pfup_notes", pfup_complications_after_pci: true, pfup_stent_thrombosis_dt: ~D[2010-04-17], pfup_readmission_yn: true, pfup_prior_stent_type: "some pfup_prior_stent_type", pfup_angio_after_yn: true, pfup_readmission_dt: ~D[2010-04-17], pfup_infarction_notes: "some pfup_infarction_notes", pfup_arb_yn: true, pfup_stent_thrombosis_timing: "some pfup_stent_thrombosis_timing", pfup_beta_blocker_yn: true, pfup_angina_last_episode_dt: ~D[2010-04-17], pfup_survival_status: "some pfup_survival_status", pfup_assessment_dt: ~D[2010-04-17], pfup_pci_after_dt: ~D[2010-04-17], pfup_other_intevention_yn: true, pfup_thienopyridines_types: "some pfup_thienopyridines_types", pfup_nitrates_yn: true, pfup_no_statin_yn: true, pfup_angio_after_results: "some pfup_angio_after_results", pfup_cabage_notes: "some pfup_cabage_notes", pfup_angio_after_dt: ~D[2010-04-17], pfup_new_infarction_dt: ~D[2010-04-17], pfup_new_infarction_location: "some pfup_new_infarction_location", pfup_pci_after_yn: true, pfup_ace_yn: true, pfup_angina_class_canadian: "some pfup_angina_class_canadian", pfup_death_dt: ~D[2010-04-17], pfup_chest_pain: "some pfup_chest_pain", pfup_readmission_reason: "some pfup_readmission_reason", pfup_rehabilitation: "some pfup_rehabilitation", pfup_antiplatelet_yn: true, pfup_other_intevention_notes: "some pfup_other_intevention_notes", pfup_statin_yn: true, pfup_pci_location: [], pfup_primary_fup_method: "some pfup_primary_fup_method", pfup_infarction_yn: true, pfup_new_infarction_treatment: "some pfup_new_infarction_treatment", pfup_death_cause: "some pfup_death_cause", pfup_cabg_after_dt: ~D[2010-04-17], pfup_angina_total_num: "some pfup_angina_total_num", pfup_anticoagulant_yn: true, pfup_angina_type: "some pfup_angina_type", ...}
  @update_attrs %{pfup_stroke_dt: ~D[2011-05-18], pfup_old_infarction_location: "some updated pfup_old_infarction_location", pfup_angina_duration: "some updated pfup_angina_duration", pfup_xa_inhibitors: "some updated pfup_xa_inhibitors", pfup_clinical_improvement_yn: false, pfup_reason: "some updated pfup_reason", pfup_diuretics_yn: false, pfup_notes: "some updated pfup_notes", pfup_complications_after_pci: false, pfup_stent_thrombosis_dt: ~D[2011-05-18], pfup_readmission_yn: false, pfup_prior_stent_type: "some updated pfup_prior_stent_type", pfup_angio_after_yn: false, pfup_readmission_dt: ~D[2011-05-18], pfup_infarction_notes: "some updated pfup_infarction_notes", pfup_arb_yn: false, pfup_stent_thrombosis_timing: "some updated pfup_stent_thrombosis_timing", pfup_beta_blocker_yn: false, pfup_angina_last_episode_dt: ~D[2011-05-18], pfup_survival_status: "some updated pfup_survival_status", pfup_assessment_dt: ~D[2011-05-18], pfup_pci_after_dt: ~D[2011-05-18], pfup_other_intevention_yn: false, pfup_thienopyridines_types: "some updated pfup_thienopyridines_types", pfup_nitrates_yn: false, pfup_no_statin_yn: false, pfup_angio_after_results: "some updated pfup_angio_after_results", pfup_cabage_notes: "some updated pfup_cabage_notes", pfup_angio_after_dt: ~D[2011-05-18], pfup_new_infarction_dt: ~D[2011-05-18], pfup_new_infarction_location: "some updated pfup_new_infarction_location", pfup_pci_after_yn: false, pfup_ace_yn: false, pfup_angina_class_canadian: "some updated pfup_angina_class_canadian", pfup_death_dt: ~D[2011-05-18], pfup_chest_pain: "some updated pfup_chest_pain", pfup_readmission_reason: "some updated pfup_readmission_reason", pfup_rehabilitation: "some updated pfup_rehabilitation", pfup_antiplatelet_yn: false, pfup_other_intevention_notes: "some updated pfup_other_intevention_notes", pfup_statin_yn: false, pfup_pci_location: [], pfup_primary_fup_method: "some updated pfup_primary_fup_method", pfup_infarction_yn: false, pfup_new_infarction_treatment: "some updated pfup_new_infarction_treatment", pfup_death_cause: "some updated pfup_death_cause", pfup_cabg_after_dt: ~D[2011-05-18], pfup_angina_total_num: "some updated pfup_angina_total_num", pfup_anticoagulant_yn: false, pfup_angina_type: "some updated pfup_angina_type", ...}
  @invalid_attrs %{pfup_stroke_dt: nil, pfup_old_infarction_location: nil, pfup_angina_duration: nil, pfup_xa_inhibitors: nil, pfup_clinical_improvement_yn: nil, pfup_reason: nil, pfup_diuretics_yn: nil, pfup_notes: nil, pfup_complications_after_pci: nil, pfup_stent_thrombosis_dt: nil, pfup_readmission_yn: nil, pfup_prior_stent_type: nil, pfup_angio_after_yn: nil, pfup_readmission_dt: nil, pfup_infarction_notes: nil, pfup_arb_yn: nil, pfup_stent_thrombosis_timing: nil, pfup_beta_blocker_yn: nil, pfup_angina_last_episode_dt: nil, pfup_survival_status: nil, pfup_assessment_dt: nil, pfup_pci_after_dt: nil, pfup_other_intevention_yn: nil, pfup_thienopyridines_types: nil, pfup_nitrates_yn: nil, pfup_no_statin_yn: nil, pfup_angio_after_results: nil, pfup_cabage_notes: nil, pfup_angio_after_dt: nil, pfup_new_infarction_dt: nil, pfup_new_infarction_location: nil, pfup_pci_after_yn: nil, pfup_ace_yn: nil, pfup_angina_class_canadian: nil, pfup_death_dt: nil, pfup_chest_pain: nil, pfup_readmission_reason: nil, pfup_rehabilitation: nil, pfup_antiplatelet_yn: nil, pfup_other_intevention_notes: nil, pfup_statin_yn: nil, pfup_pci_location: nil, pfup_primary_fup_method: nil, pfup_infarction_yn: nil, pfup_new_infarction_treatment: nil, pfup_death_cause: nil, pfup_cabg_after_dt: nil, pfup_angina_total_num: nil, pfup_anticoagulant_yn: nil, pfup_angina_type: nil, ...}

  def fixture(:pci_fup) do
    {:ok, pci_fup} = Followups.create_pci_fup(@create_attrs)
    pci_fup
  end

  describe "index" do
    test "lists all pci_fups", %{conn: conn} do
      conn = get(conn, Routes.pci_fup_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pci fups"
    end
  end

  describe "new pci_fup" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pci_fup_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pci fup"
    end
  end

  describe "create pci_fup" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pci_fup_path(conn, :create), pci_fup: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pci_fup_path(conn, :show, id)

      conn = get(conn, Routes.pci_fup_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pci fup"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pci_fup_path(conn, :create), pci_fup: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pci fup"
    end
  end

  describe "edit pci_fup" do
    setup [:create_pci_fup]

    test "renders form for editing chosen pci_fup", %{conn: conn, pci_fup: pci_fup} do
      conn = get(conn, Routes.pci_fup_path(conn, :edit, pci_fup))
      assert html_response(conn, 200) =~ "Edit Pci fup"
    end
  end

  describe "update pci_fup" do
    setup [:create_pci_fup]

    test "redirects when data is valid", %{conn: conn, pci_fup: pci_fup} do
      conn = put(conn, Routes.pci_fup_path(conn, :update, pci_fup), pci_fup: @update_attrs)
      assert redirected_to(conn) == Routes.pci_fup_path(conn, :show, pci_fup)

      conn = get(conn, Routes.pci_fup_path(conn, :show, pci_fup))
      assert html_response(conn, 200) =~ "some updated pfup_old_infarction_location"
    end

    test "renders errors when data is invalid", %{conn: conn, pci_fup: pci_fup} do
      conn = put(conn, Routes.pci_fup_path(conn, :update, pci_fup), pci_fup: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pci fup"
    end
  end

  describe "delete pci_fup" do
    setup [:create_pci_fup]

    test "deletes chosen pci_fup", %{conn: conn, pci_fup: pci_fup} do
      conn = delete(conn, Routes.pci_fup_path(conn, :delete, pci_fup))
      assert redirected_to(conn) == Routes.pci_fup_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pci_fup_path(conn, :show, pci_fup))
      end
    end
  end

  defp create_pci_fup(_) do
    pci_fup = fixture(:pci_fup)
    {:ok, pci_fup: pci_fup}
  end
end
