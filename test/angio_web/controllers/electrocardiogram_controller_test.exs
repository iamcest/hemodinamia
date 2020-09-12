defmodule AngioWeb.ElectrocardiogramControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Diagnostics

  @create_attrs %{ecg_av_conduction: "some ecg_av_conduction", ecg_dt: ~D[2010-04-17], ecg_epsilon_wave_yn: true, ecg_first_tm: ~T[14:00:00], ecg_heart_rate: "some ecg_heart_rate", ecg_infarct_pattern_location: "some ecg_infarct_pattern_location", ecg_infarct_pattern_yn: true, ecg_inverted_t_waves_yn: true, ecg_lbbb: "some ecg_lbbb", ecg_lv_hypertrophy: "some ecg_lv_hypertrophy", ecg_normal_yn: true, ecg_notes: "some ecg_notes", ecg_p_duration_val: "some ecg_p_duration_val", ecg_pathological_q_yn: true, ecg_pr_interval_val: "some ecg_pr_interval_val", ecg_qrs_duration_val: "some ecg_qrs_duration_val", ecg_qtc_long_yn: true, ecg_rbbb_yn: true, ecg_rhythm: "some ecg_rhythm", ecg_rv_hypertrophy_yn: true, ecg_st_depression_yn: true, ecg_st_elevation_yn: true, ecg_st_with_symptoms: "some ecg_st_with_symptoms", ecg_t_with_symptoms: "some ecg_t_with_symptoms", ecg_tm: ~T[14:00:00], ecg_with_symptoms_yn: true}
  @update_attrs %{ecg_av_conduction: "some updated ecg_av_conduction", ecg_dt: ~D[2011-05-18], ecg_epsilon_wave_yn: false, ecg_first_tm: ~T[15:01:01], ecg_heart_rate: "some updated ecg_heart_rate", ecg_infarct_pattern_location: "some updated ecg_infarct_pattern_location", ecg_infarct_pattern_yn: false, ecg_inverted_t_waves_yn: false, ecg_lbbb: "some updated ecg_lbbb", ecg_lv_hypertrophy: "some updated ecg_lv_hypertrophy", ecg_normal_yn: false, ecg_notes: "some updated ecg_notes", ecg_p_duration_val: "some updated ecg_p_duration_val", ecg_pathological_q_yn: false, ecg_pr_interval_val: "some updated ecg_pr_interval_val", ecg_qrs_duration_val: "some updated ecg_qrs_duration_val", ecg_qtc_long_yn: false, ecg_rbbb_yn: false, ecg_rhythm: "some updated ecg_rhythm", ecg_rv_hypertrophy_yn: false, ecg_st_depression_yn: false, ecg_st_elevation_yn: false, ecg_st_with_symptoms: "some updated ecg_st_with_symptoms", ecg_t_with_symptoms: "some updated ecg_t_with_symptoms", ecg_tm: ~T[15:01:01], ecg_with_symptoms_yn: false}
  @invalid_attrs %{ecg_av_conduction: nil, ecg_dt: nil, ecg_epsilon_wave_yn: nil, ecg_first_tm: nil, ecg_heart_rate: nil, ecg_infarct_pattern_location: nil, ecg_infarct_pattern_yn: nil, ecg_inverted_t_waves_yn: nil, ecg_lbbb: nil, ecg_lv_hypertrophy: nil, ecg_normal_yn: nil, ecg_notes: nil, ecg_p_duration_val: nil, ecg_pathological_q_yn: nil, ecg_pr_interval_val: nil, ecg_qrs_duration_val: nil, ecg_qtc_long_yn: nil, ecg_rbbb_yn: nil, ecg_rhythm: nil, ecg_rv_hypertrophy_yn: nil, ecg_st_depression_yn: nil, ecg_st_elevation_yn: nil, ecg_st_with_symptoms: nil, ecg_t_with_symptoms: nil, ecg_tm: nil, ecg_with_symptoms_yn: nil}

  def fixture(:electrocardiogram) do
    {:ok, electrocardiogram} = Diagnostics.create_electrocardiogram(@create_attrs)
    electrocardiogram
  end

  describe "index" do
    test "lists all electrocardiograms", %{conn: conn} do
      conn = get(conn, Routes.electrocardiogram_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Electrocardiograms"
    end
  end

  describe "new electrocardiogram" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.electrocardiogram_path(conn, :new))
      assert html_response(conn, 200) =~ "New Electrocardiogram"
    end
  end

  describe "create electrocardiogram" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.electrocardiogram_path(conn, :create), electrocardiogram: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.electrocardiogram_path(conn, :show, id)

      conn = get(conn, Routes.electrocardiogram_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Electrocardiogram"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.electrocardiogram_path(conn, :create), electrocardiogram: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Electrocardiogram"
    end
  end

  describe "edit electrocardiogram" do
    setup [:create_electrocardiogram]

    test "renders form for editing chosen electrocardiogram", %{conn: conn, electrocardiogram: electrocardiogram} do
      conn = get(conn, Routes.electrocardiogram_path(conn, :edit, electrocardiogram))
      assert html_response(conn, 200) =~ "Edit Electrocardiogram"
    end
  end

  describe "update electrocardiogram" do
    setup [:create_electrocardiogram]

    test "redirects when data is valid", %{conn: conn, electrocardiogram: electrocardiogram} do
      conn = put(conn, Routes.electrocardiogram_path(conn, :update, electrocardiogram), electrocardiogram: @update_attrs)
      assert redirected_to(conn) == Routes.electrocardiogram_path(conn, :show, electrocardiogram)

      conn = get(conn, Routes.electrocardiogram_path(conn, :show, electrocardiogram))
      assert html_response(conn, 200) =~ "some updated ecg_av_conduction"
    end

    test "renders errors when data is invalid", %{conn: conn, electrocardiogram: electrocardiogram} do
      conn = put(conn, Routes.electrocardiogram_path(conn, :update, electrocardiogram), electrocardiogram: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Electrocardiogram"
    end
  end

  describe "delete electrocardiogram" do
    setup [:create_electrocardiogram]

    test "deletes chosen electrocardiogram", %{conn: conn, electrocardiogram: electrocardiogram} do
      conn = delete(conn, Routes.electrocardiogram_path(conn, :delete, electrocardiogram))
      assert redirected_to(conn) == Routes.electrocardiogram_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.electrocardiogram_path(conn, :show, electrocardiogram))
      end
    end
  end

  defp create_electrocardiogram(_) do
    electrocardiogram = fixture(:electrocardiogram)
    {:ok, electrocardiogram: electrocardiogram}
  end
end
