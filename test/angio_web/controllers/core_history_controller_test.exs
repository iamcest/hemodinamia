defmodule AngioWeb.Core_historyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Histories

  @create_attrs %{
    coh_chf_symptom_duration: "some coh_chf_symptom_duration",
    coh_stroke_ischemic_yn: true,
    coh_mi_timeframe: "some coh_mi_timeframe",
    coh_angina_class: "some coh_angina_class",
    coh_family_cor_dis_yn: true,
    coh_dyslipidemia_yn: true,
    coh_cerebrovasc_dis_yn: true,
    coh_family_diabetes_yn: true,
    coh_chf_hosp_timeframe: "some coh_chf_hosp_timeframe",
    coh_copd_yn: true,
    coh_histories_notes: "some coh_histories_notes",
    coh_arrest_cardiac_yn: true,
    coh_prior_mi_yn: true,
    coh_angina_yn: true,
    coh_prior_afib_yn: true,
    coh_fatigue_yn: true,
    coh_cancer_history_yn: true,
    coh_renal_artery_dis_yn: true,
    coh_cancer_type: "some coh_cancer_type",
    coh_cur_on_dyalisis_yn: true,
    coh_cardiomyo: "some coh_cardiomyo",
    coh_arthritis_collagen_dis_yn: true,
    coh_diabetes_yn: true,
    coh_chf_prior_yn: true,
    coh_mascular_dis_yn: true,
    coh_tobacco_use: "some coh_tobacco_use",
    coh_prior_sten_50pct_yn: true,
    coh_contrast_allergy_yn: true,
    coh_chronic_kidney_dis: "some coh_chronic_kidney_dis",
    coh_peripheral_art_dis_yn: true,
    coh_diabetes_therapy: "some coh_diabetes_therapy",
    coh_tobacco_cigarette_amount: "some coh_tobacco_cigarette_amount",
    coh_chf_etiology: "some coh_chf_etiology",
    coh_hypertension_yn: true,
    coh_prior_cor_interv_yn: true,
    coh_tobacco_type: "some coh_tobacco_type"
  }
  @update_attrs %{
    coh_chf_symptom_duration: "some updated coh_chf_symptom_duration",
    coh_stroke_ischemic_yn: false,
    coh_mi_timeframe: "some updated coh_mi_timeframe",
    coh_angina_class: "some updated coh_angina_class",
    coh_family_cor_dis_yn: false,
    coh_dyslipidemia_yn: false,
    coh_cerebrovasc_dis_yn: false,
    coh_family_diabetes_yn: false,
    coh_chf_hosp_timeframe: "some updated coh_chf_hosp_timeframe",
    coh_copd_yn: false,
    coh_histories_notes: "some updated coh_histories_notes",
    coh_arrest_cardiac_yn: false,
    coh_prior_mi_yn: false,
    coh_angina_yn: false,
    coh_prior_afib_yn: false,
    coh_fatigue_yn: false,
    coh_cancer_history_yn: false,
    coh_renal_artery_dis_yn: false,
    coh_cancer_type: "some updated coh_cancer_type",
    coh_cur_on_dyalisis_yn: false,
    coh_cardiomyo: "some updated coh_cardiomyo",
    coh_arthritis_collagen_dis_yn: false,
    coh_diabetes_yn: false,
    coh_chf_prior_yn: false,
    coh_mascular_dis_yn: false,
    coh_tobacco_use: "some updated coh_tobacco_use",
    coh_prior_sten_50pct_yn: false,
    coh_contrast_allergy_yn: false,
    coh_chronic_kidney_dis: "some updated coh_chronic_kidney_dis",
    coh_peripheral_art_dis_yn: false,
    coh_diabetes_therapy: "some updated coh_diabetes_therapy",
    coh_tobacco_cigarette_amount: "some updated coh_tobacco_cigarette_amount",
    coh_chf_etiology: "some updated coh_chf_etiology",
    coh_hypertension_yn: false,
    coh_prior_cor_interv_yn: false,
    coh_tobacco_type: "some updated coh_tobacco_type"
  }
  @invalid_attrs %{
    coh_chf_symptom_duration: nil,
    coh_stroke_ischemic_yn: nil,
    coh_mi_timeframe: nil,
    coh_angina_class: nil,
    coh_family_cor_dis_yn: nil,
    coh_dyslipidemia_yn: nil,
    coh_cerebrovasc_dis_yn: nil,
    coh_family_diabetes_yn: nil,
    coh_chf_hosp_timeframe: nil,
    coh_copd_yn: nil,
    coh_histories_notes: nil,
    coh_arrest_cardiac_yn: nil,
    coh_prior_mi_yn: nil,
    coh_angina_yn: nil,
    coh_prior_afib_yn: nil,
    coh_fatigue_yn: nil,
    coh_cancer_history_yn: nil,
    coh_renal_artery_dis_yn: nil,
    coh_cancer_type: nil,
    coh_cur_on_dyalisis_yn: nil,
    coh_cardiomyo: nil,
    coh_arthritis_collagen_dis_yn: nil,
    coh_diabetes_yn: nil,
    coh_chf_prior_yn: nil,
    coh_mascular_dis_yn: nil,
    coh_tobacco_use: nil,
    coh_prior_sten_50pct_yn: nil,
    coh_contrast_allergy_yn: nil,
    coh_chronic_kidney_dis: nil,
    coh_peripheral_art_dis_yn: nil,
    coh_diabetes_therapy: nil,
    coh_tobacco_cigarette_amount: nil,
    coh_chf_etiology: nil,
    coh_hypertension_yn: nil,
    coh_prior_cor_interv_yn: nil,
    coh_tobacco_type: nil
  }

  def fixture(:core_history) do
    {:ok, core_history} = Histories.create_core_history(@create_attrs)
    core_history
  end

  describe "index" do
    test "lists all core_histories", %{conn: conn} do
      conn = get(conn, Routes.core_history_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Core histories"
    end
  end

  describe "new core_history" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.core_history_path(conn, :new))
      assert html_response(conn, 200) =~ "New Core history"
    end
  end

  describe "create core_history" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.core_history_path(conn, :create), core_history: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.core_history_path(conn, :show, id)

      conn = get(conn, Routes.core_history_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Core history"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.core_history_path(conn, :create), core_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Core history"
    end
  end

  describe "edit core_history" do
    setup [:create_core_history]

    test "renders form for editing chosen core_history", %{conn: conn, core_history: core_history} do
      conn = get(conn, Routes.core_history_path(conn, :edit, core_history))
      assert html_response(conn, 200) =~ "Edit Core history"
    end
  end

  describe "update core_history" do
    setup [:create_core_history]

    test "redirects when data is valid", %{conn: conn, core_history: core_history} do
      conn =
        put(conn, Routes.core_history_path(conn, :update, core_history),
          core_history: @update_attrs
        )

      assert redirected_to(conn) == Routes.core_history_path(conn, :show, core_history)

      conn = get(conn, Routes.core_history_path(conn, :show, core_history))
      assert html_response(conn, 200) =~ "some updated coh_chf_symptom_duration"
    end

    test "renders errors when data is invalid", %{conn: conn, core_history: core_history} do
      conn =
        put(conn, Routes.core_history_path(conn, :update, core_history),
          core_history: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Core history"
    end
  end

  describe "delete core_history" do
    setup [:create_core_history]

    test "deletes chosen core_history", %{conn: conn, core_history: core_history} do
      conn = delete(conn, Routes.core_history_path(conn, :delete, core_history))
      assert redirected_to(conn) == Routes.core_history_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.core_history_path(conn, :show, core_history))
      end)
    end
  end

  defp create_core_history(_) do
    core_history = fixture(:core_history)
    {:ok, core_history: core_history}
  end
end
