defmodule AngioWeb.Sats_pressureControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{ventr_dias_fill_period: "some ventr_dias_fill_period", sao2_ivc: "some sao2_ivc", ra_pres_h: "some ra_pres_h", pa_pres_dias: "some pa_pres_dias", sao2_hepatic_veins: "some sao2_hepatic_veins", sao2_ra_mid: "some sao2_ra_mid", uni_qp_qs: "some uni_qp_qs", ra_pres_c: "some ra_pres_c", sao2_rv_apex: "some sao2_rv_apex", sat_pres_o2_inhalation: "some sat_pres_o2_inhalation", ra_pres_v: "some ra_pres_v", aortic_pres_mean: "some aortic_pres_mean", sao2_svc_low: "some sao2_svc_low", rv_pres_mean: "some rv_pres_mean", pcw_pres_h: "some pcw_pres_h", pcw_pres_x: "some pcw_pres_x", pcw_pres_c: "some pcw_pres_c", sao2_pcw: "some sao2_pcw", lv_pres_sys: "some lv_pres_sys", sao2_ao_root: "some sao2_ao_root", pa_left_pres_dias: "some pa_left_pres_dias", pa_pres_sys_na: "some pa_pres_sys_na", rv_pres_dias: "some rv_pres_dias", pa_left_pres_sys: "some pa_left_pres_sys", sao2_rv: "some sao2_rv", patient_id: 42, sao2_ra_high: "some sao2_ra_high", ra_pres_mean: "some ra_pres_mean", pcw_pres_v: "some pcw_pres_v", sao2_svc_high: "some sao2_svc_high", ivc_pres_mean: "some ivc_pres_mean", info_coronary_id: 42, lv_pres_end_dias: "some lv_pres_end_dias", ra_pres_z: "some ra_pres_z", sat_pres_oxygen_consumption: "some sat_pres_oxygen_consumption", sao2_pa_left: "some sao2_pa_left", sao2_lv: "some sao2_lv", sat_pulm_veins: "some sat_pulm_veins", pcw_pres_a: "some pcw_pres_a", ventr_sys_ejc_period: "some ventr_sys_ejc_period", sat_pres_hb: "some sat_pres_hb", pcw_pres_z: "some pcw_pres_z", sao2_ra_low: "some sao2_ra_low", sao2_rv_outflow: "some sao2_rv_outflow", sat_pres_meds: "some sat_pres_meds", sat_pres_end_tm: ~T[14:00:00], ra_pres_sys: "some ra_pres_sys", aortic_pres_sys: "some aortic_pres_sys", sao2_pa_right: "some sao2_pa_right", pa_right_pres_mean: "some pa_right_pres_mean", ...}
  @update_attrs %{ventr_dias_fill_period: "some updated ventr_dias_fill_period", sao2_ivc: "some updated sao2_ivc", ra_pres_h: "some updated ra_pres_h", pa_pres_dias: "some updated pa_pres_dias", sao2_hepatic_veins: "some updated sao2_hepatic_veins", sao2_ra_mid: "some updated sao2_ra_mid", uni_qp_qs: "some updated uni_qp_qs", ra_pres_c: "some updated ra_pres_c", sao2_rv_apex: "some updated sao2_rv_apex", sat_pres_o2_inhalation: "some updated sat_pres_o2_inhalation", ra_pres_v: "some updated ra_pres_v", aortic_pres_mean: "some updated aortic_pres_mean", sao2_svc_low: "some updated sao2_svc_low", rv_pres_mean: "some updated rv_pres_mean", pcw_pres_h: "some updated pcw_pres_h", pcw_pres_x: "some updated pcw_pres_x", pcw_pres_c: "some updated pcw_pres_c", sao2_pcw: "some updated sao2_pcw", lv_pres_sys: "some updated lv_pres_sys", sao2_ao_root: "some updated sao2_ao_root", pa_left_pres_dias: "some updated pa_left_pres_dias", pa_pres_sys_na: "some updated pa_pres_sys_na", rv_pres_dias: "some updated rv_pres_dias", pa_left_pres_sys: "some updated pa_left_pres_sys", sao2_rv: "some updated sao2_rv", patient_id: 43, sao2_ra_high: "some updated sao2_ra_high", ra_pres_mean: "some updated ra_pres_mean", pcw_pres_v: "some updated pcw_pres_v", sao2_svc_high: "some updated sao2_svc_high", ivc_pres_mean: "some updated ivc_pres_mean", info_coronary_id: 43, lv_pres_end_dias: "some updated lv_pres_end_dias", ra_pres_z: "some updated ra_pres_z", sat_pres_oxygen_consumption: "some updated sat_pres_oxygen_consumption", sao2_pa_left: "some updated sao2_pa_left", sao2_lv: "some updated sao2_lv", sat_pulm_veins: "some updated sat_pulm_veins", pcw_pres_a: "some updated pcw_pres_a", ventr_sys_ejc_period: "some updated ventr_sys_ejc_period", sat_pres_hb: "some updated sat_pres_hb", pcw_pres_z: "some updated pcw_pres_z", sao2_ra_low: "some updated sao2_ra_low", sao2_rv_outflow: "some updated sao2_rv_outflow", sat_pres_meds: "some updated sat_pres_meds", sat_pres_end_tm: ~T[15:01:01], ra_pres_sys: "some updated ra_pres_sys", aortic_pres_sys: "some updated aortic_pres_sys", sao2_pa_right: "some updated sao2_pa_right", pa_right_pres_mean: "some updated pa_right_pres_mean", ...}
  @invalid_attrs %{ventr_dias_fill_period: nil, sao2_ivc: nil, ra_pres_h: nil, pa_pres_dias: nil, sao2_hepatic_veins: nil, sao2_ra_mid: nil, uni_qp_qs: nil, ra_pres_c: nil, sao2_rv_apex: nil, sat_pres_o2_inhalation: nil, ra_pres_v: nil, aortic_pres_mean: nil, sao2_svc_low: nil, rv_pres_mean: nil, pcw_pres_h: nil, pcw_pres_x: nil, pcw_pres_c: nil, sao2_pcw: nil, lv_pres_sys: nil, sao2_ao_root: nil, pa_left_pres_dias: nil, pa_pres_sys_na: nil, rv_pres_dias: nil, pa_left_pres_sys: nil, sao2_rv: nil, patient_id: nil, sao2_ra_high: nil, ra_pres_mean: nil, pcw_pres_v: nil, sao2_svc_high: nil, ivc_pres_mean: nil, info_coronary_id: nil, lv_pres_end_dias: nil, ra_pres_z: nil, sat_pres_oxygen_consumption: nil, sao2_pa_left: nil, sao2_lv: nil, sat_pulm_veins: nil, pcw_pres_a: nil, ventr_sys_ejc_period: nil, sat_pres_hb: nil, pcw_pres_z: nil, sao2_ra_low: nil, sao2_rv_outflow: nil, sat_pres_meds: nil, sat_pres_end_tm: nil, ra_pres_sys: nil, aortic_pres_sys: nil, sao2_pa_right: nil, pa_right_pres_mean: nil, ...}

  def fixture(:sats_pressure) do
    {:ok, sats_pressure} = Caths.create_sats_pressure(@create_attrs)
    sats_pressure
  end

  describe "index" do
    test "lists all sats_pressures", %{conn: conn} do
      conn = get(conn, Routes.sats_pressure_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sats pressures"
    end
  end

  describe "new sats_pressure" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sats_pressure_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sats pressure"
    end
  end

  describe "create sats_pressure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sats_pressure_path(conn, :create), sats_pressure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sats_pressure_path(conn, :show, id)

      conn = get(conn, Routes.sats_pressure_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sats pressure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sats_pressure_path(conn, :create), sats_pressure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sats pressure"
    end
  end

  describe "edit sats_pressure" do
    setup [:create_sats_pressure]

    test "renders form for editing chosen sats_pressure", %{conn: conn, sats_pressure: sats_pressure} do
      conn = get(conn, Routes.sats_pressure_path(conn, :edit, sats_pressure))
      assert html_response(conn, 200) =~ "Edit Sats pressure"
    end
  end

  describe "update sats_pressure" do
    setup [:create_sats_pressure]

    test "redirects when data is valid", %{conn: conn, sats_pressure: sats_pressure} do
      conn = put(conn, Routes.sats_pressure_path(conn, :update, sats_pressure), sats_pressure: @update_attrs)
      assert redirected_to(conn) == Routes.sats_pressure_path(conn, :show, sats_pressure)

      conn = get(conn, Routes.sats_pressure_path(conn, :show, sats_pressure))
      assert html_response(conn, 200) =~ "some updated ventr_dias_fill_period"
    end

    test "renders errors when data is invalid", %{conn: conn, sats_pressure: sats_pressure} do
      conn = put(conn, Routes.sats_pressure_path(conn, :update, sats_pressure), sats_pressure: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sats pressure"
    end
  end

  describe "delete sats_pressure" do
    setup [:create_sats_pressure]

    test "deletes chosen sats_pressure", %{conn: conn, sats_pressure: sats_pressure} do
      conn = delete(conn, Routes.sats_pressure_path(conn, :delete, sats_pressure))
      assert redirected_to(conn) == Routes.sats_pressure_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sats_pressure_path(conn, :show, sats_pressure))
      end
    end
  end

  defp create_sats_pressure(_) do
    sats_pressure = fixture(:sats_pressure)
    {:ok, sats_pressure: sats_pressure}
  end
end
