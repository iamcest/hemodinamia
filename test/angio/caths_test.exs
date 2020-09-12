defmodule Angio.CathsTest do
  use Angio.DataCase

  alias Angio.Caths

  describe "sat_pressures" do
    alias Angio.Caths.Sat_pressure

    @valid_attrs %{"\r": "some \r"}
    @update_attrs %{"\r": "some updated \r"}
    @invalid_attrs %{"\r": nil}

    def sat_pressure_fixture(attrs \\ %{}) do
      {:ok, sat_pressure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Caths.create_sat_pressure()

      sat_pressure
    end

    test "list_sat_pressures/0 returns all sat_pressures" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.list_sat_pressures() == [sat_pressure]
    end

    test "get_sat_pressure!/1 returns the sat_pressure with given id" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.get_sat_pressure!(sat_pressure.id) == sat_pressure
    end

    test "create_sat_pressure/1 with valid data creates a sat_pressure" do
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.create_sat_pressure(@valid_attrs)
      assert sat_pressure. == "some \r"
    end

    test "create_sat_pressure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Caths.create_sat_pressure(@invalid_attrs)
    end

    test "update_sat_pressure/2 with valid data updates the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.update_sat_pressure(sat_pressure, @update_attrs)
      assert sat_pressure. == "some updated \r"
    end

    test "update_sat_pressure/2 with invalid data returns error changeset" do
      sat_pressure = sat_pressure_fixture()
      assert {:error, %Ecto.Changeset{}} = Caths.update_sat_pressure(sat_pressure, @invalid_attrs)
      assert sat_pressure == Caths.get_sat_pressure!(sat_pressure.id)
    end

    test "delete_sat_pressure/1 deletes the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{}} = Caths.delete_sat_pressure(sat_pressure)
      assert_raise Ecto.NoResultsError, fn -> Caths.get_sat_pressure!(sat_pressure.id) end
    end

    test "change_sat_pressure/1 returns a sat_pressure changeset" do
      sat_pressure = sat_pressure_fixture()
      assert %Ecto.Changeset{} = Caths.change_sat_pressure(sat_pressure)
    end
  end

  describe "sat_pressures" do
    alias Angio.Caths.Sat_pressure

    @valid_attrs %{ventr_dias_fill_period: "some ventr_dias_fill_period", sao2_ivc: "some sao2_ivc", ra_pres_h: "some ra_pres_h", pa_pres_dias: "some pa_pres_dias", sao2_hepatic_veins: "some sao2_hepatic_veins", sao2_ra_mid: "some sao2_ra_mid", uni_qp_qs: "some uni_qp_qs", ra_pres_c: "some ra_pres_c", sao2_rv_apex: "some sao2_rv_apex", sat_pres_o2_inhalation: "some sat_pres_o2_inhalation", ra_pres_v: "some ra_pres_v", aortic_pres_mean: "some aortic_pres_mean", sao2_svc_low: "some sao2_svc_low", rv_pres_mean: "some rv_pres_mean", "": 42, pcw_pres_h: "some pcw_pres_h", pcw_pres_x: "some pcw_pres_x", pcw_pres_c: "some pcw_pres_c", sao2_pcw: "some sao2_pcw", lv_pres_sys: "some lv_pres_sys", sao2_ao_root: "some sao2_ao_root", pa_left_pres_dias: "some pa_left_pres_dias", pa_pres_sys_na: "some pa_pres_sys_na", rv_pres_dias: "some rv_pres_dias", pa_left_pres_sys: "some pa_left_pres_sys", sao2_rv: "some sao2_rv", patient_id: "some patient_id", sao2_ra_high: "some sao2_ra_high", ra_pres_mean: "some ra_pres_mean", pcw_pres_v: "some pcw_pres_v", sao2_svc_high: "some sao2_svc_high", ivc_pres_mean: "some ivc_pres_mean", info_coronary_id: "some info_coronary_id", lv_pres_end_dias: "some lv_pres_end_dias", ra_pres_z: "some ra_pres_z", sat_pres_oxygen_consumption: "some sat_pres_oxygen_consumption", sao2_pa_left: "some sao2_pa_left", sao2_lv: "some sao2_lv", sat_pulm_veins: "some sat_pulm_veins", pcw_pres_a: "some pcw_pres_a", ventr_sys_ejc_period: "some ventr_sys_ejc_period", sat_pres_hb: "some sat_pres_hb", pcw_pres_z: "some pcw_pres_z", sao2_ra_low: "some sao2_ra_low", sao2_rv_outflow: "some sao2_rv_outflow", sat_pres_meds: "some sat_pres_meds", sat_pres_end_tm: "some sat_pres_end_tm", ra_pres_sys: "some ra_pres_sys", aortic_pres_sys: "some aortic_pres_sys", sao2_pa_right: "some sao2_pa_right", ...}
    @update_attrs %{ventr_dias_fill_period: "some updated ventr_dias_fill_period", sao2_ivc: "some updated sao2_ivc", ra_pres_h: "some updated ra_pres_h", pa_pres_dias: "some updated pa_pres_dias", sao2_hepatic_veins: "some updated sao2_hepatic_veins", sao2_ra_mid: "some updated sao2_ra_mid", uni_qp_qs: "some updated uni_qp_qs", ra_pres_c: "some updated ra_pres_c", sao2_rv_apex: "some updated sao2_rv_apex", sat_pres_o2_inhalation: "some updated sat_pres_o2_inhalation", ra_pres_v: "some updated ra_pres_v", aortic_pres_mean: "some updated aortic_pres_mean", sao2_svc_low: "some updated sao2_svc_low", rv_pres_mean: "some updated rv_pres_mean", "": 43, pcw_pres_h: "some updated pcw_pres_h", pcw_pres_x: "some updated pcw_pres_x", pcw_pres_c: "some updated pcw_pres_c", sao2_pcw: "some updated sao2_pcw", lv_pres_sys: "some updated lv_pres_sys", sao2_ao_root: "some updated sao2_ao_root", pa_left_pres_dias: "some updated pa_left_pres_dias", pa_pres_sys_na: "some updated pa_pres_sys_na", rv_pres_dias: "some updated rv_pres_dias", pa_left_pres_sys: "some updated pa_left_pres_sys", sao2_rv: "some updated sao2_rv", patient_id: "some updated patient_id", sao2_ra_high: "some updated sao2_ra_high", ra_pres_mean: "some updated ra_pres_mean", pcw_pres_v: "some updated pcw_pres_v", sao2_svc_high: "some updated sao2_svc_high", ivc_pres_mean: "some updated ivc_pres_mean", info_coronary_id: "some updated info_coronary_id", lv_pres_end_dias: "some updated lv_pres_end_dias", ra_pres_z: "some updated ra_pres_z", sat_pres_oxygen_consumption: "some updated sat_pres_oxygen_consumption", sao2_pa_left: "some updated sao2_pa_left", sao2_lv: "some updated sao2_lv", sat_pulm_veins: "some updated sat_pulm_veins", pcw_pres_a: "some updated pcw_pres_a", ventr_sys_ejc_period: "some updated ventr_sys_ejc_period", sat_pres_hb: "some updated sat_pres_hb", pcw_pres_z: "some updated pcw_pres_z", sao2_ra_low: "some updated sao2_ra_low", sao2_rv_outflow: "some updated sao2_rv_outflow", sat_pres_meds: "some updated sat_pres_meds", sat_pres_end_tm: "some updated sat_pres_end_tm", ra_pres_sys: "some updated ra_pres_sys", aortic_pres_sys: "some updated aortic_pres_sys", sao2_pa_right: "some updated sao2_pa_right", ...}
    @invalid_attrs %{ventr_dias_fill_period: nil, sao2_ivc: nil, ra_pres_h: nil, pa_pres_dias: nil, sao2_hepatic_veins: nil, sao2_ra_mid: nil, uni_qp_qs: nil, ra_pres_c: nil, sao2_rv_apex: nil, sat_pres_o2_inhalation: nil, ra_pres_v: nil, aortic_pres_mean: nil, sao2_svc_low: nil, rv_pres_mean: nil, "": nil, pcw_pres_h: nil, pcw_pres_x: nil, pcw_pres_c: nil, sao2_pcw: nil, lv_pres_sys: nil, sao2_ao_root: nil, pa_left_pres_dias: nil, pa_pres_sys_na: nil, rv_pres_dias: nil, pa_left_pres_sys: nil, sao2_rv: nil, patient_id: nil, sao2_ra_high: nil, ra_pres_mean: nil, pcw_pres_v: nil, sao2_svc_high: nil, ivc_pres_mean: nil, info_coronary_id: nil, lv_pres_end_dias: nil, ra_pres_z: nil, sat_pres_oxygen_consumption: nil, sao2_pa_left: nil, sao2_lv: nil, sat_pulm_veins: nil, pcw_pres_a: nil, ventr_sys_ejc_period: nil, sat_pres_hb: nil, pcw_pres_z: nil, sao2_ra_low: nil, sao2_rv_outflow: nil, sat_pres_meds: nil, sat_pres_end_tm: nil, ra_pres_sys: nil, aortic_pres_sys: nil, sao2_pa_right: nil, ...}

    def sat_pressure_fixture(attrs \\ %{}) do
      {:ok, sat_pressure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Caths.create_sat_pressure()

      sat_pressure
    end

    test "list_sat_pressures/0 returns all sat_pressures" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.list_sat_pressures() == [sat_pressure]
    end

    test "get_sat_pressure!/1 returns the sat_pressure with given id" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.get_sat_pressure!(sat_pressure.id) == sat_pressure
    end

    test "create_sat_pressure/1 with valid data creates a sat_pressure" do
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.create_sat_pressure(@valid_attrs)
      assert sat_pressure.sao2_rv_mid == "some sao2_rv_mid"
      assert sat_pressure.ra_pres_a == "some ra_pres_a"
      assert sat_pressure.ra_pres_dias == "some ra_pres_dias"
      assert sat_pressure.ra_pres_y == "some ra_pres_y"
      assert sat_pressure.sat_pres_end_dt == "some sat_pres_end_dt"
      assert sat_pressure.ra_pres_x == "some ra_pres_x"
      assert sat_pressure.pcw_pres_sys == "some pcw_pres_sys"
      assert sat_pressure.sao2_pa == "some sao2_pa"
      assert sat_pressure.pcw_pres_y == "some pcw_pres_y"
      assert sat_pressure.sat_pres_start_dt == "some sat_pres_start_dt"
      assert sat_pressure.sat_pres_heart_rate == "some sat_pres_heart_rate"
      assert sat_pressure.sao2_ao_distal == "some sao2_ao_distal"
      assert sat_pressure.hepatic_veins_pres == "some hepatic_veins_pres"
      assert sat_pressure.pa_right_pres_dias == "some pa_right_pres_dias"
      assert sat_pressure.uni_bsa == "some uni_bsa"
      assert sat_pressure.ivc_pres_dias == "some ivc_pres_dias"
      assert sat_pressure.pcw_pres_mean == "some pcw_pres_mean"
      assert sat_pressure.pa_left_pres_mean == "some pa_left_pres_mean"
      assert sat_pressure.pcw_pres_dias == "some pcw_pres_dias"
      assert sat_pressure.ivc_pres_sys == "some ivc_pres_sys"
      assert sat_pressure.svc_pres_sys == "some svc_pres_sys"
      assert sat_pressure.sat_pres_start_tm == "some sat_pres_start_tm"
      assert sat_pressure.svc_pres_mean == "some svc_pres_mean"
      assert sat_pressure.rv_pres_sys == "some rv_pres_sys"
      assert sat_pressure.svc_pres_dias == "some svc_pres_dias"
      assert sat_pressure.pa_pres_mean == "some pa_pres_mean"
      assert sat_pressure.pa_pres_mean_na == "some pa_pres_mean_na"
      assert sat_pressure.aortic_pres_dias == "some aortic_pres_dias"
      assert sat_pressure.lv_pres_mean == "some lv_pres_mean"
      assert sat_pressure.pa_pres_sys == "some pa_pres_sys"
      assert sat_pressure.sat_pres_notes == "some sat_pres_notes"
      assert sat_pressure.pa_right_pres_sys == "some pa_right_pres_sys"
      assert sat_pressure.pa_right_pres_mean == "some pa_right_pres_mean"
      assert sat_pressure.sao2_pa_right == "some sao2_pa_right"
      assert sat_pressure.aortic_pres_sys == "some aortic_pres_sys"
      assert sat_pressure.ra_pres_sys == "some ra_pres_sys"
      assert sat_pressure.sat_pres_end_tm == "some sat_pres_end_tm"
      assert sat_pressure.sat_pres_meds == "some sat_pres_meds"
      assert sat_pressure.sao2_rv_outflow == "some sao2_rv_outflow"
      assert sat_pressure.sao2_ra_low == "some sao2_ra_low"
      assert sat_pressure.pcw_pres_z == "some pcw_pres_z"
      assert sat_pressure.sat_pres_hb == "some sat_pres_hb"
      assert sat_pressure.ventr_sys_ejc_period == "some ventr_sys_ejc_period"
      assert sat_pressure.pcw_pres_a == "some pcw_pres_a"
      assert sat_pressure.sat_pulm_veins == "some sat_pulm_veins"
      assert sat_pressure.sao2_lv == "some sao2_lv"
      assert sat_pressure.sao2_pa_left == "some sao2_pa_left"
      assert sat_pressure.sat_pres_oxygen_consumption == "some sat_pres_oxygen_consumption"
      assert sat_pressure.ra_pres_z == "some ra_pres_z"
      assert sat_pressure.lv_pres_end_dias == "some lv_pres_end_dias"
      assert sat_pressure.info_coronary_id == "some info_coronary_id"
      assert sat_pressure.ivc_pres_mean == "some ivc_pres_mean"
      assert sat_pressure.sao2_svc_high == "some sao2_svc_high"
      assert sat_pressure.pcw_pres_v == "some pcw_pres_v"
      assert sat_pressure.ra_pres_mean == "some ra_pres_mean"
      assert sat_pressure.sao2_ra_high == "some sao2_ra_high"
      assert sat_pressure.patient_id == "some patient_id"
      assert sat_pressure.sao2_rv == "some sao2_rv"
      assert sat_pressure.pa_left_pres_sys == "some pa_left_pres_sys"
      assert sat_pressure.rv_pres_dias == "some rv_pres_dias"
      assert sat_pressure.pa_pres_sys_na == "some pa_pres_sys_na"
      assert sat_pressure.pa_left_pres_dias == "some pa_left_pres_dias"
      assert sat_pressure.sao2_ao_root == "some sao2_ao_root"
      assert sat_pressure.lv_pres_sys == "some lv_pres_sys"
      assert sat_pressure.sao2_pcw == "some sao2_pcw"
      assert sat_pressure.pcw_pres_c == "some pcw_pres_c"
      assert sat_pressure.pcw_pres_x == "some pcw_pres_x"
      assert sat_pressure.pcw_pres_h == "some pcw_pres_h"
      assert sat_pressure. == 42
      assert sat_pressure.rv_pres_mean == "some rv_pres_mean"
      assert sat_pressure.sao2_svc_low == "some sao2_svc_low"
      assert sat_pressure.aortic_pres_mean == "some aortic_pres_mean"
      assert sat_pressure.ra_pres_v == "some ra_pres_v"
      assert sat_pressure.sat_pres_o2_inhalation == "some sat_pres_o2_inhalation"
      assert sat_pressure.sao2_rv_apex == "some sao2_rv_apex"
      assert sat_pressure.ra_pres_c == "some ra_pres_c"
      assert sat_pressure.uni_qp_qs == "some uni_qp_qs"
      assert sat_pressure.sao2_ra_mid == "some sao2_ra_mid"
      assert sat_pressure.sao2_hepatic_veins == "some sao2_hepatic_veins"
      assert sat_pressure.pa_pres_dias == "some pa_pres_dias"
      assert sat_pressure.ra_pres_h == "some ra_pres_h"
      assert sat_pressure.sao2_ivc == "some sao2_ivc"
      assert sat_pressure.ventr_dias_fill_period == "some ventr_dias_fill_period"
    end

    test "create_sat_pressure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Caths.create_sat_pressure(@invalid_attrs)
    end

    test "update_sat_pressure/2 with valid data updates the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.update_sat_pressure(sat_pressure, @update_attrs)
      assert sat_pressure.sao2_rv_mid == "some updated sao2_rv_mid"
      assert sat_pressure.ra_pres_a == "some updated ra_pres_a"
      assert sat_pressure.ra_pres_dias == "some updated ra_pres_dias"
      assert sat_pressure.ra_pres_y == "some updated ra_pres_y"
      assert sat_pressure.sat_pres_end_dt == "some updated sat_pres_end_dt"
      assert sat_pressure.ra_pres_x == "some updated ra_pres_x"
      assert sat_pressure.pcw_pres_sys == "some updated pcw_pres_sys"
      assert sat_pressure.sao2_pa == "some updated sao2_pa"
      assert sat_pressure.pcw_pres_y == "some updated pcw_pres_y"
      assert sat_pressure.sat_pres_start_dt == "some updated sat_pres_start_dt"
      assert sat_pressure.sat_pres_heart_rate == "some updated sat_pres_heart_rate"
      assert sat_pressure.sao2_ao_distal == "some updated sao2_ao_distal"
      assert sat_pressure.hepatic_veins_pres == "some updated hepatic_veins_pres"
      assert sat_pressure.pa_right_pres_dias == "some updated pa_right_pres_dias"
      assert sat_pressure.uni_bsa == "some updated uni_bsa"
      assert sat_pressure.ivc_pres_dias == "some updated ivc_pres_dias"
      assert sat_pressure.pcw_pres_mean == "some updated pcw_pres_mean"
      assert sat_pressure.pa_left_pres_mean == "some updated pa_left_pres_mean"
      assert sat_pressure.pcw_pres_dias == "some updated pcw_pres_dias"
      assert sat_pressure.ivc_pres_sys == "some updated ivc_pres_sys"
      assert sat_pressure.svc_pres_sys == "some updated svc_pres_sys"
      assert sat_pressure.sat_pres_start_tm == "some updated sat_pres_start_tm"
      assert sat_pressure.svc_pres_mean == "some updated svc_pres_mean"
      assert sat_pressure.rv_pres_sys == "some updated rv_pres_sys"
      assert sat_pressure.svc_pres_dias == "some updated svc_pres_dias"
      assert sat_pressure.pa_pres_mean == "some updated pa_pres_mean"
      assert sat_pressure.pa_pres_mean_na == "some updated pa_pres_mean_na"
      assert sat_pressure.aortic_pres_dias == "some updated aortic_pres_dias"
      assert sat_pressure.lv_pres_mean == "some updated lv_pres_mean"
      assert sat_pressure.pa_pres_sys == "some updated pa_pres_sys"
      assert sat_pressure.sat_pres_notes == "some updated sat_pres_notes"
      assert sat_pressure.pa_right_pres_sys == "some updated pa_right_pres_sys"
      assert sat_pressure.pa_right_pres_mean == "some updated pa_right_pres_mean"
      assert sat_pressure.sao2_pa_right == "some updated sao2_pa_right"
      assert sat_pressure.aortic_pres_sys == "some updated aortic_pres_sys"
      assert sat_pressure.ra_pres_sys == "some updated ra_pres_sys"
      assert sat_pressure.sat_pres_end_tm == "some updated sat_pres_end_tm"
      assert sat_pressure.sat_pres_meds == "some updated sat_pres_meds"
      assert sat_pressure.sao2_rv_outflow == "some updated sao2_rv_outflow"
      assert sat_pressure.sao2_ra_low == "some updated sao2_ra_low"
      assert sat_pressure.pcw_pres_z == "some updated pcw_pres_z"
      assert sat_pressure.sat_pres_hb == "some updated sat_pres_hb"
      assert sat_pressure.ventr_sys_ejc_period == "some updated ventr_sys_ejc_period"
      assert sat_pressure.pcw_pres_a == "some updated pcw_pres_a"
      assert sat_pressure.sat_pulm_veins == "some updated sat_pulm_veins"
      assert sat_pressure.sao2_lv == "some updated sao2_lv"
      assert sat_pressure.sao2_pa_left == "some updated sao2_pa_left"
      assert sat_pressure.sat_pres_oxygen_consumption == "some updated sat_pres_oxygen_consumption"
      assert sat_pressure.ra_pres_z == "some updated ra_pres_z"
      assert sat_pressure.lv_pres_end_dias == "some updated lv_pres_end_dias"
      assert sat_pressure.info_coronary_id == "some updated info_coronary_id"
      assert sat_pressure.ivc_pres_mean == "some updated ivc_pres_mean"
      assert sat_pressure.sao2_svc_high == "some updated sao2_svc_high"
      assert sat_pressure.pcw_pres_v == "some updated pcw_pres_v"
      assert sat_pressure.ra_pres_mean == "some updated ra_pres_mean"
      assert sat_pressure.sao2_ra_high == "some updated sao2_ra_high"
      assert sat_pressure.patient_id == "some updated patient_id"
      assert sat_pressure.sao2_rv == "some updated sao2_rv"
      assert sat_pressure.pa_left_pres_sys == "some updated pa_left_pres_sys"
      assert sat_pressure.rv_pres_dias == "some updated rv_pres_dias"
      assert sat_pressure.pa_pres_sys_na == "some updated pa_pres_sys_na"
      assert sat_pressure.pa_left_pres_dias == "some updated pa_left_pres_dias"
      assert sat_pressure.sao2_ao_root == "some updated sao2_ao_root"
      assert sat_pressure.lv_pres_sys == "some updated lv_pres_sys"
      assert sat_pressure.sao2_pcw == "some updated sao2_pcw"
      assert sat_pressure.pcw_pres_c == "some updated pcw_pres_c"
      assert sat_pressure.pcw_pres_x == "some updated pcw_pres_x"
      assert sat_pressure.pcw_pres_h == "some updated pcw_pres_h"
      assert sat_pressure. == 43
      assert sat_pressure.rv_pres_mean == "some updated rv_pres_mean"
      assert sat_pressure.sao2_svc_low == "some updated sao2_svc_low"
      assert sat_pressure.aortic_pres_mean == "some updated aortic_pres_mean"
      assert sat_pressure.ra_pres_v == "some updated ra_pres_v"
      assert sat_pressure.sat_pres_o2_inhalation == "some updated sat_pres_o2_inhalation"
      assert sat_pressure.sao2_rv_apex == "some updated sao2_rv_apex"
      assert sat_pressure.ra_pres_c == "some updated ra_pres_c"
      assert sat_pressure.uni_qp_qs == "some updated uni_qp_qs"
      assert sat_pressure.sao2_ra_mid == "some updated sao2_ra_mid"
      assert sat_pressure.sao2_hepatic_veins == "some updated sao2_hepatic_veins"
      assert sat_pressure.pa_pres_dias == "some updated pa_pres_dias"
      assert sat_pressure.ra_pres_h == "some updated ra_pres_h"
      assert sat_pressure.sao2_ivc == "some updated sao2_ivc"
      assert sat_pressure.ventr_dias_fill_period == "some updated ventr_dias_fill_period"
    end

    test "update_sat_pressure/2 with invalid data returns error changeset" do
      sat_pressure = sat_pressure_fixture()
      assert {:error, %Ecto.Changeset{}} = Caths.update_sat_pressure(sat_pressure, @invalid_attrs)
      assert sat_pressure == Caths.get_sat_pressure!(sat_pressure.id)
    end

    test "delete_sat_pressure/1 deletes the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{}} = Caths.delete_sat_pressure(sat_pressure)
      assert_raise Ecto.NoResultsError, fn -> Caths.get_sat_pressure!(sat_pressure.id) end
    end

    test "change_sat_pressure/1 returns a sat_pressure changeset" do
      sat_pressure = sat_pressure_fixture()
      assert %Ecto.Changeset{} = Caths.change_sat_pressure(sat_pressure)
    end
  end

  describe "sat_pressures" do
    alias Angio.Caths.Sat_pressure

    @valid_attrs %{ventr_dias_fill_period: "some ventr_dias_fill_period", sao2_ivc: "some sao2_ivc", ra_pres_h: "some ra_pres_h", pa_pres_dias: "some pa_pres_dias", sao2_hepatic_veins: "some sao2_hepatic_veins", sao2_ra_mid: "some sao2_ra_mid", uni_qp_qs: "some uni_qp_qs", ra_pres_c: "some ra_pres_c", sao2_rv_apex: "some sao2_rv_apex", sat_pres_o2_inhalation: "some sat_pres_o2_inhalation", ra_pres_v: "some ra_pres_v", aortic_pres_mean: "some aortic_pres_mean", sao2_svc_low: "some sao2_svc_low", rv_pres_mean: "some rv_pres_mean", pcw_pres_h: "some pcw_pres_h", pcw_pres_x: "some pcw_pres_x", pcw_pres_c: "some pcw_pres_c", sao2_pcw: "some sao2_pcw", lv_pres_sys: "some lv_pres_sys", sao2_ao_root: "some sao2_ao_root", pa_left_pres_dias: "some pa_left_pres_dias", pa_pres_sys_na: "some pa_pres_sys_na", rv_pres_dias: "some rv_pres_dias", pa_left_pres_sys: "some pa_left_pres_sys", sao2_rv: "some sao2_rv", patient_id: 42, sao2_ra_high: "some sao2_ra_high", ra_pres_mean: "some ra_pres_mean", pcw_pres_v: "some pcw_pres_v", sao2_svc_high: "some sao2_svc_high", ivc_pres_mean: "some ivc_pres_mean", info_coronary_id: 42, lv_pres_end_dias: "some lv_pres_end_dias", ra_pres_z: "some ra_pres_z", sat_pres_oxygen_consumption: "some sat_pres_oxygen_consumption", sao2_pa_left: "some sao2_pa_left", sao2_lv: "some sao2_lv", sat_pulm_veins: "some sat_pulm_veins", pcw_pres_a: "some pcw_pres_a", ventr_sys_ejc_period: "some ventr_sys_ejc_period", sat_pres_hb: "some sat_pres_hb", pcw_pres_z: "some pcw_pres_z", sao2_ra_low: "some sao2_ra_low", sao2_rv_outflow: "some sao2_rv_outflow", sat_pres_meds: "some sat_pres_meds", sat_pres_end_tm: ~T[14:00:00], ra_pres_sys: "some ra_pres_sys", aortic_pres_sys: "some aortic_pres_sys", sao2_pa_right: "some sao2_pa_right", pa_right_pres_mean: "some pa_right_pres_mean", ...}
    @update_attrs %{ventr_dias_fill_period: "some updated ventr_dias_fill_period", sao2_ivc: "some updated sao2_ivc", ra_pres_h: "some updated ra_pres_h", pa_pres_dias: "some updated pa_pres_dias", sao2_hepatic_veins: "some updated sao2_hepatic_veins", sao2_ra_mid: "some updated sao2_ra_mid", uni_qp_qs: "some updated uni_qp_qs", ra_pres_c: "some updated ra_pres_c", sao2_rv_apex: "some updated sao2_rv_apex", sat_pres_o2_inhalation: "some updated sat_pres_o2_inhalation", ra_pres_v: "some updated ra_pres_v", aortic_pres_mean: "some updated aortic_pres_mean", sao2_svc_low: "some updated sao2_svc_low", rv_pres_mean: "some updated rv_pres_mean", pcw_pres_h: "some updated pcw_pres_h", pcw_pres_x: "some updated pcw_pres_x", pcw_pres_c: "some updated pcw_pres_c", sao2_pcw: "some updated sao2_pcw", lv_pres_sys: "some updated lv_pres_sys", sao2_ao_root: "some updated sao2_ao_root", pa_left_pres_dias: "some updated pa_left_pres_dias", pa_pres_sys_na: "some updated pa_pres_sys_na", rv_pres_dias: "some updated rv_pres_dias", pa_left_pres_sys: "some updated pa_left_pres_sys", sao2_rv: "some updated sao2_rv", patient_id: 43, sao2_ra_high: "some updated sao2_ra_high", ra_pres_mean: "some updated ra_pres_mean", pcw_pres_v: "some updated pcw_pres_v", sao2_svc_high: "some updated sao2_svc_high", ivc_pres_mean: "some updated ivc_pres_mean", info_coronary_id: 43, lv_pres_end_dias: "some updated lv_pres_end_dias", ra_pres_z: "some updated ra_pres_z", sat_pres_oxygen_consumption: "some updated sat_pres_oxygen_consumption", sao2_pa_left: "some updated sao2_pa_left", sao2_lv: "some updated sao2_lv", sat_pulm_veins: "some updated sat_pulm_veins", pcw_pres_a: "some updated pcw_pres_a", ventr_sys_ejc_period: "some updated ventr_sys_ejc_period", sat_pres_hb: "some updated sat_pres_hb", pcw_pres_z: "some updated pcw_pres_z", sao2_ra_low: "some updated sao2_ra_low", sao2_rv_outflow: "some updated sao2_rv_outflow", sat_pres_meds: "some updated sat_pres_meds", sat_pres_end_tm: ~T[15:01:01], ra_pres_sys: "some updated ra_pres_sys", aortic_pres_sys: "some updated aortic_pres_sys", sao2_pa_right: "some updated sao2_pa_right", pa_right_pres_mean: "some updated pa_right_pres_mean", ...}
    @invalid_attrs %{ventr_dias_fill_period: nil, sao2_ivc: nil, ra_pres_h: nil, pa_pres_dias: nil, sao2_hepatic_veins: nil, sao2_ra_mid: nil, uni_qp_qs: nil, ra_pres_c: nil, sao2_rv_apex: nil, sat_pres_o2_inhalation: nil, ra_pres_v: nil, aortic_pres_mean: nil, sao2_svc_low: nil, rv_pres_mean: nil, pcw_pres_h: nil, pcw_pres_x: nil, pcw_pres_c: nil, sao2_pcw: nil, lv_pres_sys: nil, sao2_ao_root: nil, pa_left_pres_dias: nil, pa_pres_sys_na: nil, rv_pres_dias: nil, pa_left_pres_sys: nil, sao2_rv: nil, patient_id: nil, sao2_ra_high: nil, ra_pres_mean: nil, pcw_pres_v: nil, sao2_svc_high: nil, ivc_pres_mean: nil, info_coronary_id: nil, lv_pres_end_dias: nil, ra_pres_z: nil, sat_pres_oxygen_consumption: nil, sao2_pa_left: nil, sao2_lv: nil, sat_pulm_veins: nil, pcw_pres_a: nil, ventr_sys_ejc_period: nil, sat_pres_hb: nil, pcw_pres_z: nil, sao2_ra_low: nil, sao2_rv_outflow: nil, sat_pres_meds: nil, sat_pres_end_tm: nil, ra_pres_sys: nil, aortic_pres_sys: nil, sao2_pa_right: nil, pa_right_pres_mean: nil, ...}

    def sat_pressure_fixture(attrs \\ %{}) do
      {:ok, sat_pressure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Caths.create_sat_pressure()

      sat_pressure
    end

    test "list_sat_pressures/0 returns all sat_pressures" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.list_sat_pressures() == [sat_pressure]
    end

    test "get_sat_pressure!/1 returns the sat_pressure with given id" do
      sat_pressure = sat_pressure_fixture()
      assert Caths.get_sat_pressure!(sat_pressure.id) == sat_pressure
    end

    test "create_sat_pressure/1 with valid data creates a sat_pressure" do
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.create_sat_pressure(@valid_attrs)
      assert sat_pressure.sao2_rv_mid == "some sao2_rv_mid"
      assert sat_pressure.ra_pres_a == "some ra_pres_a"
      assert sat_pressure.ra_pres_dias == "some ra_pres_dias"
      assert sat_pressure.ra_pres_y == "some ra_pres_y"
      assert sat_pressure.sat_pres_end_dt == ~D[2010-04-17]
      assert sat_pressure.ra_pres_x == "some ra_pres_x"
      assert sat_pressure.pcw_pres_sys == "some pcw_pres_sys"
      assert sat_pressure.sao2_pa == "some sao2_pa"
      assert sat_pressure.pcw_pres_y == "some pcw_pres_y"
      assert sat_pressure.sat_pres_start_dt == ~D[2010-04-17]
      assert sat_pressure.sat_pres_heart_rate == "some sat_pres_heart_rate"
      assert sat_pressure.sao2_ao_distal == "some sao2_ao_distal"
      assert sat_pressure.hepatic_veins_pres == "some hepatic_veins_pres"
      assert sat_pressure.pa_right_pres_dias == "some pa_right_pres_dias"
      assert sat_pressure.uni_bsa == "some uni_bsa"
      assert sat_pressure.ivc_pres_dias == "some ivc_pres_dias"
      assert sat_pressure.pcw_pres_mean == "some pcw_pres_mean"
      assert sat_pressure.pa_left_pres_mean == "some pa_left_pres_mean"
      assert sat_pressure.pcw_pres_dias == "some pcw_pres_dias"
      assert sat_pressure.ivc_pres_sys == "some ivc_pres_sys"
      assert sat_pressure.svc_pres_sys == "some svc_pres_sys"
      assert sat_pressure.sat_pres_start_tm == ~T[14:00:00]
      assert sat_pressure.svc_pres_mean == "some svc_pres_mean"
      assert sat_pressure.rv_pres_sys == "some rv_pres_sys"
      assert sat_pressure.svc_pres_dias == "some svc_pres_dias"
      assert sat_pressure.pa_pres_mean == "some pa_pres_mean"
      assert sat_pressure.pa_pres_mean_na == "some pa_pres_mean_na"
      assert sat_pressure.aortic_pres_dias == "some aortic_pres_dias"
      assert sat_pressure.lv_pres_mean == "some lv_pres_mean"
      assert sat_pressure.pa_pres_sys == "some pa_pres_sys"
      assert sat_pressure.sat_pres_notes == "some sat_pres_notes"
      assert sat_pressure.pa_right_pres_sys == "some pa_right_pres_sys"
      assert sat_pressure.pa_right_pres_mean == "some pa_right_pres_mean"
      assert sat_pressure.sao2_pa_right == "some sao2_pa_right"
      assert sat_pressure.aortic_pres_sys == "some aortic_pres_sys"
      assert sat_pressure.ra_pres_sys == "some ra_pres_sys"
      assert sat_pressure.sat_pres_end_tm == ~T[14:00:00]
      assert sat_pressure.sat_pres_meds == "some sat_pres_meds"
      assert sat_pressure.sao2_rv_outflow == "some sao2_rv_outflow"
      assert sat_pressure.sao2_ra_low == "some sao2_ra_low"
      assert sat_pressure.pcw_pres_z == "some pcw_pres_z"
      assert sat_pressure.sat_pres_hb == "some sat_pres_hb"
      assert sat_pressure.ventr_sys_ejc_period == "some ventr_sys_ejc_period"
      assert sat_pressure.pcw_pres_a == "some pcw_pres_a"
      assert sat_pressure.sat_pulm_veins == "some sat_pulm_veins"
      assert sat_pressure.sao2_lv == "some sao2_lv"
      assert sat_pressure.sao2_pa_left == "some sao2_pa_left"
      assert sat_pressure.sat_pres_oxygen_consumption == "some sat_pres_oxygen_consumption"
      assert sat_pressure.ra_pres_z == "some ra_pres_z"
      assert sat_pressure.lv_pres_end_dias == "some lv_pres_end_dias"
      assert sat_pressure.info_coronary_id == 42
      assert sat_pressure.ivc_pres_mean == "some ivc_pres_mean"
      assert sat_pressure.sao2_svc_high == "some sao2_svc_high"
      assert sat_pressure.pcw_pres_v == "some pcw_pres_v"
      assert sat_pressure.ra_pres_mean == "some ra_pres_mean"
      assert sat_pressure.sao2_ra_high == "some sao2_ra_high"
      assert sat_pressure.patient_id == 42
      assert sat_pressure.sao2_rv == "some sao2_rv"
      assert sat_pressure.pa_left_pres_sys == "some pa_left_pres_sys"
      assert sat_pressure.rv_pres_dias == "some rv_pres_dias"
      assert sat_pressure.pa_pres_sys_na == "some pa_pres_sys_na"
      assert sat_pressure.pa_left_pres_dias == "some pa_left_pres_dias"
      assert sat_pressure.sao2_ao_root == "some sao2_ao_root"
      assert sat_pressure.lv_pres_sys == "some lv_pres_sys"
      assert sat_pressure.sao2_pcw == "some sao2_pcw"
      assert sat_pressure.pcw_pres_c == "some pcw_pres_c"
      assert sat_pressure.pcw_pres_x == "some pcw_pres_x"
      assert sat_pressure.pcw_pres_h == "some pcw_pres_h"
      assert sat_pressure.rv_pres_mean == "some rv_pres_mean"
      assert sat_pressure.sao2_svc_low == "some sao2_svc_low"
      assert sat_pressure.aortic_pres_mean == "some aortic_pres_mean"
      assert sat_pressure.ra_pres_v == "some ra_pres_v"
      assert sat_pressure.sat_pres_o2_inhalation == "some sat_pres_o2_inhalation"
      assert sat_pressure.sao2_rv_apex == "some sao2_rv_apex"
      assert sat_pressure.ra_pres_c == "some ra_pres_c"
      assert sat_pressure.uni_qp_qs == "some uni_qp_qs"
      assert sat_pressure.sao2_ra_mid == "some sao2_ra_mid"
      assert sat_pressure.sao2_hepatic_veins == "some sao2_hepatic_veins"
      assert sat_pressure.pa_pres_dias == "some pa_pres_dias"
      assert sat_pressure.ra_pres_h == "some ra_pres_h"
      assert sat_pressure.sao2_ivc == "some sao2_ivc"
      assert sat_pressure.ventr_dias_fill_period == "some ventr_dias_fill_period"
    end

    test "create_sat_pressure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Caths.create_sat_pressure(@invalid_attrs)
    end

    test "update_sat_pressure/2 with valid data updates the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{} = sat_pressure} = Caths.update_sat_pressure(sat_pressure, @update_attrs)
      assert sat_pressure.sao2_rv_mid == "some updated sao2_rv_mid"
      assert sat_pressure.ra_pres_a == "some updated ra_pres_a"
      assert sat_pressure.ra_pres_dias == "some updated ra_pres_dias"
      assert sat_pressure.ra_pres_y == "some updated ra_pres_y"
      assert sat_pressure.sat_pres_end_dt == ~D[2011-05-18]
      assert sat_pressure.ra_pres_x == "some updated ra_pres_x"
      assert sat_pressure.pcw_pres_sys == "some updated pcw_pres_sys"
      assert sat_pressure.sao2_pa == "some updated sao2_pa"
      assert sat_pressure.pcw_pres_y == "some updated pcw_pres_y"
      assert sat_pressure.sat_pres_start_dt == ~D[2011-05-18]
      assert sat_pressure.sat_pres_heart_rate == "some updated sat_pres_heart_rate"
      assert sat_pressure.sao2_ao_distal == "some updated sao2_ao_distal"
      assert sat_pressure.hepatic_veins_pres == "some updated hepatic_veins_pres"
      assert sat_pressure.pa_right_pres_dias == "some updated pa_right_pres_dias"
      assert sat_pressure.uni_bsa == "some updated uni_bsa"
      assert sat_pressure.ivc_pres_dias == "some updated ivc_pres_dias"
      assert sat_pressure.pcw_pres_mean == "some updated pcw_pres_mean"
      assert sat_pressure.pa_left_pres_mean == "some updated pa_left_pres_mean"
      assert sat_pressure.pcw_pres_dias == "some updated pcw_pres_dias"
      assert sat_pressure.ivc_pres_sys == "some updated ivc_pres_sys"
      assert sat_pressure.svc_pres_sys == "some updated svc_pres_sys"
      assert sat_pressure.sat_pres_start_tm == ~T[15:01:01]
      assert sat_pressure.svc_pres_mean == "some updated svc_pres_mean"
      assert sat_pressure.rv_pres_sys == "some updated rv_pres_sys"
      assert sat_pressure.svc_pres_dias == "some updated svc_pres_dias"
      assert sat_pressure.pa_pres_mean == "some updated pa_pres_mean"
      assert sat_pressure.pa_pres_mean_na == "some updated pa_pres_mean_na"
      assert sat_pressure.aortic_pres_dias == "some updated aortic_pres_dias"
      assert sat_pressure.lv_pres_mean == "some updated lv_pres_mean"
      assert sat_pressure.pa_pres_sys == "some updated pa_pres_sys"
      assert sat_pressure.sat_pres_notes == "some updated sat_pres_notes"
      assert sat_pressure.pa_right_pres_sys == "some updated pa_right_pres_sys"
      assert sat_pressure.pa_right_pres_mean == "some updated pa_right_pres_mean"
      assert sat_pressure.sao2_pa_right == "some updated sao2_pa_right"
      assert sat_pressure.aortic_pres_sys == "some updated aortic_pres_sys"
      assert sat_pressure.ra_pres_sys == "some updated ra_pres_sys"
      assert sat_pressure.sat_pres_end_tm == ~T[15:01:01]
      assert sat_pressure.sat_pres_meds == "some updated sat_pres_meds"
      assert sat_pressure.sao2_rv_outflow == "some updated sao2_rv_outflow"
      assert sat_pressure.sao2_ra_low == "some updated sao2_ra_low"
      assert sat_pressure.pcw_pres_z == "some updated pcw_pres_z"
      assert sat_pressure.sat_pres_hb == "some updated sat_pres_hb"
      assert sat_pressure.ventr_sys_ejc_period == "some updated ventr_sys_ejc_period"
      assert sat_pressure.pcw_pres_a == "some updated pcw_pres_a"
      assert sat_pressure.sat_pulm_veins == "some updated sat_pulm_veins"
      assert sat_pressure.sao2_lv == "some updated sao2_lv"
      assert sat_pressure.sao2_pa_left == "some updated sao2_pa_left"
      assert sat_pressure.sat_pres_oxygen_consumption == "some updated sat_pres_oxygen_consumption"
      assert sat_pressure.ra_pres_z == "some updated ra_pres_z"
      assert sat_pressure.lv_pres_end_dias == "some updated lv_pres_end_dias"
      assert sat_pressure.info_coronary_id == 43
      assert sat_pressure.ivc_pres_mean == "some updated ivc_pres_mean"
      assert sat_pressure.sao2_svc_high == "some updated sao2_svc_high"
      assert sat_pressure.pcw_pres_v == "some updated pcw_pres_v"
      assert sat_pressure.ra_pres_mean == "some updated ra_pres_mean"
      assert sat_pressure.sao2_ra_high == "some updated sao2_ra_high"
      assert sat_pressure.patient_id == 43
      assert sat_pressure.sao2_rv == "some updated sao2_rv"
      assert sat_pressure.pa_left_pres_sys == "some updated pa_left_pres_sys"
      assert sat_pressure.rv_pres_dias == "some updated rv_pres_dias"
      assert sat_pressure.pa_pres_sys_na == "some updated pa_pres_sys_na"
      assert sat_pressure.pa_left_pres_dias == "some updated pa_left_pres_dias"
      assert sat_pressure.sao2_ao_root == "some updated sao2_ao_root"
      assert sat_pressure.lv_pres_sys == "some updated lv_pres_sys"
      assert sat_pressure.sao2_pcw == "some updated sao2_pcw"
      assert sat_pressure.pcw_pres_c == "some updated pcw_pres_c"
      assert sat_pressure.pcw_pres_x == "some updated pcw_pres_x"
      assert sat_pressure.pcw_pres_h == "some updated pcw_pres_h"
      assert sat_pressure.rv_pres_mean == "some updated rv_pres_mean"
      assert sat_pressure.sao2_svc_low == "some updated sao2_svc_low"
      assert sat_pressure.aortic_pres_mean == "some updated aortic_pres_mean"
      assert sat_pressure.ra_pres_v == "some updated ra_pres_v"
      assert sat_pressure.sat_pres_o2_inhalation == "some updated sat_pres_o2_inhalation"
      assert sat_pressure.sao2_rv_apex == "some updated sao2_rv_apex"
      assert sat_pressure.ra_pres_c == "some updated ra_pres_c"
      assert sat_pressure.uni_qp_qs == "some updated uni_qp_qs"
      assert sat_pressure.sao2_ra_mid == "some updated sao2_ra_mid"
      assert sat_pressure.sao2_hepatic_veins == "some updated sao2_hepatic_veins"
      assert sat_pressure.pa_pres_dias == "some updated pa_pres_dias"
      assert sat_pressure.ra_pres_h == "some updated ra_pres_h"
      assert sat_pressure.sao2_ivc == "some updated sao2_ivc"
      assert sat_pressure.ventr_dias_fill_period == "some updated ventr_dias_fill_period"
    end

    test "update_sat_pressure/2 with invalid data returns error changeset" do
      sat_pressure = sat_pressure_fixture()
      assert {:error, %Ecto.Changeset{}} = Caths.update_sat_pressure(sat_pressure, @invalid_attrs)
      assert sat_pressure == Caths.get_sat_pressure!(sat_pressure.id)
    end

    test "delete_sat_pressure/1 deletes the sat_pressure" do
      sat_pressure = sat_pressure_fixture()
      assert {:ok, %Sat_pressure{}} = Caths.delete_sat_pressure(sat_pressure)
      assert_raise Ecto.NoResultsError, fn -> Caths.get_sat_pressure!(sat_pressure.id) end
    end

    test "change_sat_pressure/1 returns a sat_pressure changeset" do
      sat_pressure = sat_pressure_fixture()
      assert %Ecto.Changeset{} = Caths.change_sat_pressure(sat_pressure)
    end
  end

  describe "sats_pressures" do
    alias Angio.Caths.Sats_pressure

    @valid_attrs %{ventr_dias_fill_period: "some ventr_dias_fill_period", sao2_ivc: "some sao2_ivc", ra_pres_h: "some ra_pres_h", pa_pres_dias: "some pa_pres_dias", sao2_hepatic_veins: "some sao2_hepatic_veins", sao2_ra_mid: "some sao2_ra_mid", uni_qp_qs: "some uni_qp_qs", ra_pres_c: "some ra_pres_c", sao2_rv_apex: "some sao2_rv_apex", sat_pres_o2_inhalation: "some sat_pres_o2_inhalation", ra_pres_v: "some ra_pres_v", aortic_pres_mean: "some aortic_pres_mean", sao2_svc_low: "some sao2_svc_low", rv_pres_mean: "some rv_pres_mean", pcw_pres_h: "some pcw_pres_h", pcw_pres_x: "some pcw_pres_x", pcw_pres_c: "some pcw_pres_c", sao2_pcw: "some sao2_pcw", lv_pres_sys: "some lv_pres_sys", sao2_ao_root: "some sao2_ao_root", pa_left_pres_dias: "some pa_left_pres_dias", pa_pres_sys_na: "some pa_pres_sys_na", rv_pres_dias: "some rv_pres_dias", pa_left_pres_sys: "some pa_left_pres_sys", sao2_rv: "some sao2_rv", patient_id: 42, sao2_ra_high: "some sao2_ra_high", ra_pres_mean: "some ra_pres_mean", pcw_pres_v: "some pcw_pres_v", sao2_svc_high: "some sao2_svc_high", ivc_pres_mean: "some ivc_pres_mean", info_coronary_id: 42, lv_pres_end_dias: "some lv_pres_end_dias", ra_pres_z: "some ra_pres_z", sat_pres_oxygen_consumption: "some sat_pres_oxygen_consumption", sao2_pa_left: "some sao2_pa_left", sao2_lv: "some sao2_lv", sat_pulm_veins: "some sat_pulm_veins", pcw_pres_a: "some pcw_pres_a", ventr_sys_ejc_period: "some ventr_sys_ejc_period", sat_pres_hb: "some sat_pres_hb", pcw_pres_z: "some pcw_pres_z", sao2_ra_low: "some sao2_ra_low", sao2_rv_outflow: "some sao2_rv_outflow", sat_pres_meds: "some sat_pres_meds", sat_pres_end_tm: ~T[14:00:00], ra_pres_sys: "some ra_pres_sys", aortic_pres_sys: "some aortic_pres_sys", sao2_pa_right: "some sao2_pa_right", pa_right_pres_mean: "some pa_right_pres_mean", ...}
    @update_attrs %{ventr_dias_fill_period: "some updated ventr_dias_fill_period", sao2_ivc: "some updated sao2_ivc", ra_pres_h: "some updated ra_pres_h", pa_pres_dias: "some updated pa_pres_dias", sao2_hepatic_veins: "some updated sao2_hepatic_veins", sao2_ra_mid: "some updated sao2_ra_mid", uni_qp_qs: "some updated uni_qp_qs", ra_pres_c: "some updated ra_pres_c", sao2_rv_apex: "some updated sao2_rv_apex", sat_pres_o2_inhalation: "some updated sat_pres_o2_inhalation", ra_pres_v: "some updated ra_pres_v", aortic_pres_mean: "some updated aortic_pres_mean", sao2_svc_low: "some updated sao2_svc_low", rv_pres_mean: "some updated rv_pres_mean", pcw_pres_h: "some updated pcw_pres_h", pcw_pres_x: "some updated pcw_pres_x", pcw_pres_c: "some updated pcw_pres_c", sao2_pcw: "some updated sao2_pcw", lv_pres_sys: "some updated lv_pres_sys", sao2_ao_root: "some updated sao2_ao_root", pa_left_pres_dias: "some updated pa_left_pres_dias", pa_pres_sys_na: "some updated pa_pres_sys_na", rv_pres_dias: "some updated rv_pres_dias", pa_left_pres_sys: "some updated pa_left_pres_sys", sao2_rv: "some updated sao2_rv", patient_id: 43, sao2_ra_high: "some updated sao2_ra_high", ra_pres_mean: "some updated ra_pres_mean", pcw_pres_v: "some updated pcw_pres_v", sao2_svc_high: "some updated sao2_svc_high", ivc_pres_mean: "some updated ivc_pres_mean", info_coronary_id: 43, lv_pres_end_dias: "some updated lv_pres_end_dias", ra_pres_z: "some updated ra_pres_z", sat_pres_oxygen_consumption: "some updated sat_pres_oxygen_consumption", sao2_pa_left: "some updated sao2_pa_left", sao2_lv: "some updated sao2_lv", sat_pulm_veins: "some updated sat_pulm_veins", pcw_pres_a: "some updated pcw_pres_a", ventr_sys_ejc_period: "some updated ventr_sys_ejc_period", sat_pres_hb: "some updated sat_pres_hb", pcw_pres_z: "some updated pcw_pres_z", sao2_ra_low: "some updated sao2_ra_low", sao2_rv_outflow: "some updated sao2_rv_outflow", sat_pres_meds: "some updated sat_pres_meds", sat_pres_end_tm: ~T[15:01:01], ra_pres_sys: "some updated ra_pres_sys", aortic_pres_sys: "some updated aortic_pres_sys", sao2_pa_right: "some updated sao2_pa_right", pa_right_pres_mean: "some updated pa_right_pres_mean", ...}
    @invalid_attrs %{ventr_dias_fill_period: nil, sao2_ivc: nil, ra_pres_h: nil, pa_pres_dias: nil, sao2_hepatic_veins: nil, sao2_ra_mid: nil, uni_qp_qs: nil, ra_pres_c: nil, sao2_rv_apex: nil, sat_pres_o2_inhalation: nil, ra_pres_v: nil, aortic_pres_mean: nil, sao2_svc_low: nil, rv_pres_mean: nil, pcw_pres_h: nil, pcw_pres_x: nil, pcw_pres_c: nil, sao2_pcw: nil, lv_pres_sys: nil, sao2_ao_root: nil, pa_left_pres_dias: nil, pa_pres_sys_na: nil, rv_pres_dias: nil, pa_left_pres_sys: nil, sao2_rv: nil, patient_id: nil, sao2_ra_high: nil, ra_pres_mean: nil, pcw_pres_v: nil, sao2_svc_high: nil, ivc_pres_mean: nil, info_coronary_id: nil, lv_pres_end_dias: nil, ra_pres_z: nil, sat_pres_oxygen_consumption: nil, sao2_pa_left: nil, sao2_lv: nil, sat_pulm_veins: nil, pcw_pres_a: nil, ventr_sys_ejc_period: nil, sat_pres_hb: nil, pcw_pres_z: nil, sao2_ra_low: nil, sao2_rv_outflow: nil, sat_pres_meds: nil, sat_pres_end_tm: nil, ra_pres_sys: nil, aortic_pres_sys: nil, sao2_pa_right: nil, pa_right_pres_mean: nil, ...}

    def sats_pressure_fixture(attrs \\ %{}) do
      {:ok, sats_pressure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Caths.create_sats_pressure()

      sats_pressure
    end

    test "list_sats_pressures/0 returns all sats_pressures" do
      sats_pressure = sats_pressure_fixture()
      assert Caths.list_sats_pressures() == [sats_pressure]
    end

    test "get_sats_pressure!/1 returns the sats_pressure with given id" do
      sats_pressure = sats_pressure_fixture()
      assert Caths.get_sats_pressure!(sats_pressure.id) == sats_pressure
    end

    test "create_sats_pressure/1 with valid data creates a sats_pressure" do
      assert {:ok, %Sats_pressure{} = sats_pressure} = Caths.create_sats_pressure(@valid_attrs)
      assert sats_pressure.sao2_rv_mid == "some sao2_rv_mid"
      assert sats_pressure.ra_pres_a == "some ra_pres_a"
      assert sats_pressure.ra_pres_dias == "some ra_pres_dias"
      assert sats_pressure.ra_pres_y == "some ra_pres_y"
      assert sats_pressure.sat_pres_end_dt == ~D[2010-04-17]
      assert sats_pressure.ra_pres_x == "some ra_pres_x"
      assert sats_pressure.pcw_pres_sys == "some pcw_pres_sys"
      assert sats_pressure.sao2_pa == "some sao2_pa"
      assert sats_pressure.pcw_pres_y == "some pcw_pres_y"
      assert sats_pressure.sat_pres_start_dt == ~D[2010-04-17]
      assert sats_pressure.sat_pres_heart_rate == "some sat_pres_heart_rate"
      assert sats_pressure.sao2_ao_distal == "some sao2_ao_distal"
      assert sats_pressure.hepatic_veins_pres == "some hepatic_veins_pres"
      assert sats_pressure.pa_right_pres_dias == "some pa_right_pres_dias"
      assert sats_pressure.uni_bsa == "some uni_bsa"
      assert sats_pressure.ivc_pres_dias == "some ivc_pres_dias"
      assert sats_pressure.pcw_pres_mean == "some pcw_pres_mean"
      assert sats_pressure.pa_left_pres_mean == "some pa_left_pres_mean"
      assert sats_pressure.pcw_pres_dias == "some pcw_pres_dias"
      assert sats_pressure.ivc_pres_sys == "some ivc_pres_sys"
      assert sats_pressure.svc_pres_sys == "some svc_pres_sys"
      assert sats_pressure.sat_pres_start_tm == ~T[14:00:00]
      assert sats_pressure.svc_pres_mean == "some svc_pres_mean"
      assert sats_pressure.rv_pres_sys == "some rv_pres_sys"
      assert sats_pressure.svc_pres_dias == "some svc_pres_dias"
      assert sats_pressure.pa_pres_mean == "some pa_pres_mean"
      assert sats_pressure.pa_pres_mean_na == "some pa_pres_mean_na"
      assert sats_pressure.aortic_pres_dias == "some aortic_pres_dias"
      assert sats_pressure.lv_pres_mean == "some lv_pres_mean"
      assert sats_pressure.pa_pres_sys == "some pa_pres_sys"
      assert sats_pressure.sat_pres_notes == "some sat_pres_notes"
      assert sats_pressure.pa_right_pres_sys == "some pa_right_pres_sys"
      assert sats_pressure.pa_right_pres_mean == "some pa_right_pres_mean"
      assert sats_pressure.sao2_pa_right == "some sao2_pa_right"
      assert sats_pressure.aortic_pres_sys == "some aortic_pres_sys"
      assert sats_pressure.ra_pres_sys == "some ra_pres_sys"
      assert sats_pressure.sat_pres_end_tm == ~T[14:00:00]
      assert sats_pressure.sat_pres_meds == "some sat_pres_meds"
      assert sats_pressure.sao2_rv_outflow == "some sao2_rv_outflow"
      assert sats_pressure.sao2_ra_low == "some sao2_ra_low"
      assert sats_pressure.pcw_pres_z == "some pcw_pres_z"
      assert sats_pressure.sat_pres_hb == "some sat_pres_hb"
      assert sats_pressure.ventr_sys_ejc_period == "some ventr_sys_ejc_period"
      assert sats_pressure.pcw_pres_a == "some pcw_pres_a"
      assert sats_pressure.sat_pulm_veins == "some sat_pulm_veins"
      assert sats_pressure.sao2_lv == "some sao2_lv"
      assert sats_pressure.sao2_pa_left == "some sao2_pa_left"
      assert sats_pressure.sat_pres_oxygen_consumption == "some sat_pres_oxygen_consumption"
      assert sats_pressure.ra_pres_z == "some ra_pres_z"
      assert sats_pressure.lv_pres_end_dias == "some lv_pres_end_dias"
      assert sats_pressure.info_coronary_id == 42
      assert sats_pressure.ivc_pres_mean == "some ivc_pres_mean"
      assert sats_pressure.sao2_svc_high == "some sao2_svc_high"
      assert sats_pressure.pcw_pres_v == "some pcw_pres_v"
      assert sats_pressure.ra_pres_mean == "some ra_pres_mean"
      assert sats_pressure.sao2_ra_high == "some sao2_ra_high"
      assert sats_pressure.patient_id == 42
      assert sats_pressure.sao2_rv == "some sao2_rv"
      assert sats_pressure.pa_left_pres_sys == "some pa_left_pres_sys"
      assert sats_pressure.rv_pres_dias == "some rv_pres_dias"
      assert sats_pressure.pa_pres_sys_na == "some pa_pres_sys_na"
      assert sats_pressure.pa_left_pres_dias == "some pa_left_pres_dias"
      assert sats_pressure.sao2_ao_root == "some sao2_ao_root"
      assert sats_pressure.lv_pres_sys == "some lv_pres_sys"
      assert sats_pressure.sao2_pcw == "some sao2_pcw"
      assert sats_pressure.pcw_pres_c == "some pcw_pres_c"
      assert sats_pressure.pcw_pres_x == "some pcw_pres_x"
      assert sats_pressure.pcw_pres_h == "some pcw_pres_h"
      assert sats_pressure.rv_pres_mean == "some rv_pres_mean"
      assert sats_pressure.sao2_svc_low == "some sao2_svc_low"
      assert sats_pressure.aortic_pres_mean == "some aortic_pres_mean"
      assert sats_pressure.ra_pres_v == "some ra_pres_v"
      assert sats_pressure.sat_pres_o2_inhalation == "some sat_pres_o2_inhalation"
      assert sats_pressure.sao2_rv_apex == "some sao2_rv_apex"
      assert sats_pressure.ra_pres_c == "some ra_pres_c"
      assert sats_pressure.uni_qp_qs == "some uni_qp_qs"
      assert sats_pressure.sao2_ra_mid == "some sao2_ra_mid"
      assert sats_pressure.sao2_hepatic_veins == "some sao2_hepatic_veins"
      assert sats_pressure.pa_pres_dias == "some pa_pres_dias"
      assert sats_pressure.ra_pres_h == "some ra_pres_h"
      assert sats_pressure.sao2_ivc == "some sao2_ivc"
      assert sats_pressure.ventr_dias_fill_period == "some ventr_dias_fill_period"
    end

    test "create_sats_pressure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Caths.create_sats_pressure(@invalid_attrs)
    end

    test "update_sats_pressure/2 with valid data updates the sats_pressure" do
      sats_pressure = sats_pressure_fixture()
      assert {:ok, %Sats_pressure{} = sats_pressure} = Caths.update_sats_pressure(sats_pressure, @update_attrs)
      assert sats_pressure.sao2_rv_mid == "some updated sao2_rv_mid"
      assert sats_pressure.ra_pres_a == "some updated ra_pres_a"
      assert sats_pressure.ra_pres_dias == "some updated ra_pres_dias"
      assert sats_pressure.ra_pres_y == "some updated ra_pres_y"
      assert sats_pressure.sat_pres_end_dt == ~D[2011-05-18]
      assert sats_pressure.ra_pres_x == "some updated ra_pres_x"
      assert sats_pressure.pcw_pres_sys == "some updated pcw_pres_sys"
      assert sats_pressure.sao2_pa == "some updated sao2_pa"
      assert sats_pressure.pcw_pres_y == "some updated pcw_pres_y"
      assert sats_pressure.sat_pres_start_dt == ~D[2011-05-18]
      assert sats_pressure.sat_pres_heart_rate == "some updated sat_pres_heart_rate"
      assert sats_pressure.sao2_ao_distal == "some updated sao2_ao_distal"
      assert sats_pressure.hepatic_veins_pres == "some updated hepatic_veins_pres"
      assert sats_pressure.pa_right_pres_dias == "some updated pa_right_pres_dias"
      assert sats_pressure.uni_bsa == "some updated uni_bsa"
      assert sats_pressure.ivc_pres_dias == "some updated ivc_pres_dias"
      assert sats_pressure.pcw_pres_mean == "some updated pcw_pres_mean"
      assert sats_pressure.pa_left_pres_mean == "some updated pa_left_pres_mean"
      assert sats_pressure.pcw_pres_dias == "some updated pcw_pres_dias"
      assert sats_pressure.ivc_pres_sys == "some updated ivc_pres_sys"
      assert sats_pressure.svc_pres_sys == "some updated svc_pres_sys"
      assert sats_pressure.sat_pres_start_tm == ~T[15:01:01]
      assert sats_pressure.svc_pres_mean == "some updated svc_pres_mean"
      assert sats_pressure.rv_pres_sys == "some updated rv_pres_sys"
      assert sats_pressure.svc_pres_dias == "some updated svc_pres_dias"
      assert sats_pressure.pa_pres_mean == "some updated pa_pres_mean"
      assert sats_pressure.pa_pres_mean_na == "some updated pa_pres_mean_na"
      assert sats_pressure.aortic_pres_dias == "some updated aortic_pres_dias"
      assert sats_pressure.lv_pres_mean == "some updated lv_pres_mean"
      assert sats_pressure.pa_pres_sys == "some updated pa_pres_sys"
      assert sats_pressure.sat_pres_notes == "some updated sat_pres_notes"
      assert sats_pressure.pa_right_pres_sys == "some updated pa_right_pres_sys"
      assert sats_pressure.pa_right_pres_mean == "some updated pa_right_pres_mean"
      assert sats_pressure.sao2_pa_right == "some updated sao2_pa_right"
      assert sats_pressure.aortic_pres_sys == "some updated aortic_pres_sys"
      assert sats_pressure.ra_pres_sys == "some updated ra_pres_sys"
      assert sats_pressure.sat_pres_end_tm == ~T[15:01:01]
      assert sats_pressure.sat_pres_meds == "some updated sat_pres_meds"
      assert sats_pressure.sao2_rv_outflow == "some updated sao2_rv_outflow"
      assert sats_pressure.sao2_ra_low == "some updated sao2_ra_low"
      assert sats_pressure.pcw_pres_z == "some updated pcw_pres_z"
      assert sats_pressure.sat_pres_hb == "some updated sat_pres_hb"
      assert sats_pressure.ventr_sys_ejc_period == "some updated ventr_sys_ejc_period"
      assert sats_pressure.pcw_pres_a == "some updated pcw_pres_a"
      assert sats_pressure.sat_pulm_veins == "some updated sat_pulm_veins"
      assert sats_pressure.sao2_lv == "some updated sao2_lv"
      assert sats_pressure.sao2_pa_left == "some updated sao2_pa_left"
      assert sats_pressure.sat_pres_oxygen_consumption == "some updated sat_pres_oxygen_consumption"
      assert sats_pressure.ra_pres_z == "some updated ra_pres_z"
      assert sats_pressure.lv_pres_end_dias == "some updated lv_pres_end_dias"
      assert sats_pressure.info_coronary_id == 43
      assert sats_pressure.ivc_pres_mean == "some updated ivc_pres_mean"
      assert sats_pressure.sao2_svc_high == "some updated sao2_svc_high"
      assert sats_pressure.pcw_pres_v == "some updated pcw_pres_v"
      assert sats_pressure.ra_pres_mean == "some updated ra_pres_mean"
      assert sats_pressure.sao2_ra_high == "some updated sao2_ra_high"
      assert sats_pressure.patient_id == 43
      assert sats_pressure.sao2_rv == "some updated sao2_rv"
      assert sats_pressure.pa_left_pres_sys == "some updated pa_left_pres_sys"
      assert sats_pressure.rv_pres_dias == "some updated rv_pres_dias"
      assert sats_pressure.pa_pres_sys_na == "some updated pa_pres_sys_na"
      assert sats_pressure.pa_left_pres_dias == "some updated pa_left_pres_dias"
      assert sats_pressure.sao2_ao_root == "some updated sao2_ao_root"
      assert sats_pressure.lv_pres_sys == "some updated lv_pres_sys"
      assert sats_pressure.sao2_pcw == "some updated sao2_pcw"
      assert sats_pressure.pcw_pres_c == "some updated pcw_pres_c"
      assert sats_pressure.pcw_pres_x == "some updated pcw_pres_x"
      assert sats_pressure.pcw_pres_h == "some updated pcw_pres_h"
      assert sats_pressure.rv_pres_mean == "some updated rv_pres_mean"
      assert sats_pressure.sao2_svc_low == "some updated sao2_svc_low"
      assert sats_pressure.aortic_pres_mean == "some updated aortic_pres_mean"
      assert sats_pressure.ra_pres_v == "some updated ra_pres_v"
      assert sats_pressure.sat_pres_o2_inhalation == "some updated sat_pres_o2_inhalation"
      assert sats_pressure.sao2_rv_apex == "some updated sao2_rv_apex"
      assert sats_pressure.ra_pres_c == "some updated ra_pres_c"
      assert sats_pressure.uni_qp_qs == "some updated uni_qp_qs"
      assert sats_pressure.sao2_ra_mid == "some updated sao2_ra_mid"
      assert sats_pressure.sao2_hepatic_veins == "some updated sao2_hepatic_veins"
      assert sats_pressure.pa_pres_dias == "some updated pa_pres_dias"
      assert sats_pressure.ra_pres_h == "some updated ra_pres_h"
      assert sats_pressure.sao2_ivc == "some updated sao2_ivc"
      assert sats_pressure.ventr_dias_fill_period == "some updated ventr_dias_fill_period"
    end

    test "update_sats_pressure/2 with invalid data returns error changeset" do
      sats_pressure = sats_pressure_fixture()
      assert {:error, %Ecto.Changeset{}} = Caths.update_sats_pressure(sats_pressure, @invalid_attrs)
      assert sats_pressure == Caths.get_sats_pressure!(sats_pressure.id)
    end

    test "delete_sats_pressure/1 deletes the sats_pressure" do
      sats_pressure = sats_pressure_fixture()
      assert {:ok, %Sats_pressure{}} = Caths.delete_sats_pressure(sats_pressure)
      assert_raise Ecto.NoResultsError, fn -> Caths.get_sats_pressure!(sats_pressure.id) end
    end

    test "change_sats_pressure/1 returns a sats_pressure changeset" do
      sats_pressure = sats_pressure_fixture()
      assert %Ecto.Changeset{} = Caths.change_sats_pressure(sats_pressure)
    end
  end

  describe "cath_labs" do
    alias Angio.Caths.Cath_lab

    @valid_attrs %{cath_biomarker_positive_post_yn: true, cath_ck_post_normal_ckmb_na: true, cath_ck_pre_normal_ckmb_pre_na: true, cath_ckmb_peak_post_na: true, cath_ckmb_post_val: "some cath_ckmb_post_val", cath_ckmb_pre_na: true, cath_ckmb_pre_val: "some cath_ckmb_pre_val", cath_creatinine_highest_na: true, cath_creatinine_highest_val: "some cath_creatinine_highest_val", cath_creatinine_post_na: true, cath_creatinine_post_val: "some cath_creatinine_post_val", cath_creatinine_pre_discharge: "some cath_creatinine_pre_discharge", cath_creatinine_pre_discharge_na: true, cath_creatinine_pre_na: true, cath_creatinine_pre_val: "some cath_creatinine_pre_val", cath_hb_post_lowest_val: "some cath_hb_post_lowest_val", cath_hb_post_na: true, cath_hb_post_val: "some cath_hb_post_val", cath_hb_pre_na: true, cath_hb_pre_val: "some cath_hb_pre_val", cath_tropo_i_peak_post_na: true, cath_tropo_i_peak_post_val: "some cath_tropo_i_peak_post_val", cath_tropo_i_pre_na: true, cath_tropo_i_pre_val: "some cath_tropo_i_pre_val", cath_tropo_t_peak_post_na: true, cath_tropo_t_peak_post_val: "some cath_tropo_t_peak_post_val", cath_tropo_t_pre_na: true, cath_tropo_t_pre_val: "some cath_tropo_t_pre_val"}
    @update_attrs %{cath_biomarker_positive_post_yn: false, cath_ck_post_normal_ckmb_na: false, cath_ck_pre_normal_ckmb_pre_na: false, cath_ckmb_peak_post_na: false, cath_ckmb_post_val: "some updated cath_ckmb_post_val", cath_ckmb_pre_na: false, cath_ckmb_pre_val: "some updated cath_ckmb_pre_val", cath_creatinine_highest_na: false, cath_creatinine_highest_val: "some updated cath_creatinine_highest_val", cath_creatinine_post_na: false, cath_creatinine_post_val: "some updated cath_creatinine_post_val", cath_creatinine_pre_discharge: "some updated cath_creatinine_pre_discharge", cath_creatinine_pre_discharge_na: false, cath_creatinine_pre_na: false, cath_creatinine_pre_val: "some updated cath_creatinine_pre_val", cath_hb_post_lowest_val: "some updated cath_hb_post_lowest_val", cath_hb_post_na: false, cath_hb_post_val: "some updated cath_hb_post_val", cath_hb_pre_na: false, cath_hb_pre_val: "some updated cath_hb_pre_val", cath_tropo_i_peak_post_na: false, cath_tropo_i_peak_post_val: "some updated cath_tropo_i_peak_post_val", cath_tropo_i_pre_na: false, cath_tropo_i_pre_val: "some updated cath_tropo_i_pre_val", cath_tropo_t_peak_post_na: false, cath_tropo_t_peak_post_val: "some updated cath_tropo_t_peak_post_val", cath_tropo_t_pre_na: false, cath_tropo_t_pre_val: "some updated cath_tropo_t_pre_val"}
    @invalid_attrs %{cath_biomarker_positive_post_yn: nil, cath_ck_post_normal_ckmb_na: nil, cath_ck_pre_normal_ckmb_pre_na: nil, cath_ckmb_peak_post_na: nil, cath_ckmb_post_val: nil, cath_ckmb_pre_na: nil, cath_ckmb_pre_val: nil, cath_creatinine_highest_na: nil, cath_creatinine_highest_val: nil, cath_creatinine_post_na: nil, cath_creatinine_post_val: nil, cath_creatinine_pre_discharge: nil, cath_creatinine_pre_discharge_na: nil, cath_creatinine_pre_na: nil, cath_creatinine_pre_val: nil, cath_hb_post_lowest_val: nil, cath_hb_post_na: nil, cath_hb_post_val: nil, cath_hb_pre_na: nil, cath_hb_pre_val: nil, cath_tropo_i_peak_post_na: nil, cath_tropo_i_peak_post_val: nil, cath_tropo_i_pre_na: nil, cath_tropo_i_pre_val: nil, cath_tropo_t_peak_post_na: nil, cath_tropo_t_peak_post_val: nil, cath_tropo_t_pre_na: nil, cath_tropo_t_pre_val: nil}

    def cath_lab_fixture(attrs \\ %{}) do
      {:ok, cath_lab} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Caths.create_cath_lab()

      cath_lab
    end

    test "list_cath_labs/0 returns all cath_labs" do
      cath_lab = cath_lab_fixture()
      assert Caths.list_cath_labs() == [cath_lab]
    end

    test "get_cath_lab!/1 returns the cath_lab with given id" do
      cath_lab = cath_lab_fixture()
      assert Caths.get_cath_lab!(cath_lab.id) == cath_lab
    end

    test "create_cath_lab/1 with valid data creates a cath_lab" do
      assert {:ok, %Cath_lab{} = cath_lab} = Caths.create_cath_lab(@valid_attrs)
      assert cath_lab.cath_biomarker_positive_post_yn == true
      assert cath_lab.cath_ck_post_normal_ckmb_na == true
      assert cath_lab.cath_ck_pre_normal_ckmb_pre_na == true
      assert cath_lab.cath_ckmb_peak_post_na == true
      assert cath_lab.cath_ckmb_post_val == "some cath_ckmb_post_val"
      assert cath_lab.cath_ckmb_pre_na == true
      assert cath_lab.cath_ckmb_pre_val == "some cath_ckmb_pre_val"
      assert cath_lab.cath_creatinine_highest_na == true
      assert cath_lab.cath_creatinine_highest_val == "some cath_creatinine_highest_val"
      assert cath_lab.cath_creatinine_post_na == true
      assert cath_lab.cath_creatinine_post_val == "some cath_creatinine_post_val"
      assert cath_lab.cath_creatinine_pre_discharge == "some cath_creatinine_pre_discharge"
      assert cath_lab.cath_creatinine_pre_discharge_na == true
      assert cath_lab.cath_creatinine_pre_na == true
      assert cath_lab.cath_creatinine_pre_val == "some cath_creatinine_pre_val"
      assert cath_lab.cath_hb_post_lowest_val == "some cath_hb_post_lowest_val"
      assert cath_lab.cath_hb_post_na == true
      assert cath_lab.cath_hb_post_val == "some cath_hb_post_val"
      assert cath_lab.cath_hb_pre_na == true
      assert cath_lab.cath_hb_pre_val == "some cath_hb_pre_val"
      assert cath_lab.cath_tropo_i_peak_post_na == true
      assert cath_lab.cath_tropo_i_peak_post_val == "some cath_tropo_i_peak_post_val"
      assert cath_lab.cath_tropo_i_pre_na == true
      assert cath_lab.cath_tropo_i_pre_val == "some cath_tropo_i_pre_val"
      assert cath_lab.cath_tropo_t_peak_post_na == true
      assert cath_lab.cath_tropo_t_peak_post_val == "some cath_tropo_t_peak_post_val"
      assert cath_lab.cath_tropo_t_pre_na == true
      assert cath_lab.cath_tropo_t_pre_val == "some cath_tropo_t_pre_val"
    end

    test "create_cath_lab/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Caths.create_cath_lab(@invalid_attrs)
    end

    test "update_cath_lab/2 with valid data updates the cath_lab" do
      cath_lab = cath_lab_fixture()
      assert {:ok, %Cath_lab{} = cath_lab} = Caths.update_cath_lab(cath_lab, @update_attrs)
      assert cath_lab.cath_biomarker_positive_post_yn == false
      assert cath_lab.cath_ck_post_normal_ckmb_na == false
      assert cath_lab.cath_ck_pre_normal_ckmb_pre_na == false
      assert cath_lab.cath_ckmb_peak_post_na == false
      assert cath_lab.cath_ckmb_post_val == "some updated cath_ckmb_post_val"
      assert cath_lab.cath_ckmb_pre_na == false
      assert cath_lab.cath_ckmb_pre_val == "some updated cath_ckmb_pre_val"
      assert cath_lab.cath_creatinine_highest_na == false
      assert cath_lab.cath_creatinine_highest_val == "some updated cath_creatinine_highest_val"
      assert cath_lab.cath_creatinine_post_na == false
      assert cath_lab.cath_creatinine_post_val == "some updated cath_creatinine_post_val"
      assert cath_lab.cath_creatinine_pre_discharge == "some updated cath_creatinine_pre_discharge"
      assert cath_lab.cath_creatinine_pre_discharge_na == false
      assert cath_lab.cath_creatinine_pre_na == false
      assert cath_lab.cath_creatinine_pre_val == "some updated cath_creatinine_pre_val"
      assert cath_lab.cath_hb_post_lowest_val == "some updated cath_hb_post_lowest_val"
      assert cath_lab.cath_hb_post_na == false
      assert cath_lab.cath_hb_post_val == "some updated cath_hb_post_val"
      assert cath_lab.cath_hb_pre_na == false
      assert cath_lab.cath_hb_pre_val == "some updated cath_hb_pre_val"
      assert cath_lab.cath_tropo_i_peak_post_na == false
      assert cath_lab.cath_tropo_i_peak_post_val == "some updated cath_tropo_i_peak_post_val"
      assert cath_lab.cath_tropo_i_pre_na == false
      assert cath_lab.cath_tropo_i_pre_val == "some updated cath_tropo_i_pre_val"
      assert cath_lab.cath_tropo_t_peak_post_na == false
      assert cath_lab.cath_tropo_t_peak_post_val == "some updated cath_tropo_t_peak_post_val"
      assert cath_lab.cath_tropo_t_pre_na == false
      assert cath_lab.cath_tropo_t_pre_val == "some updated cath_tropo_t_pre_val"
    end

    test "update_cath_lab/2 with invalid data returns error changeset" do
      cath_lab = cath_lab_fixture()
      assert {:error, %Ecto.Changeset{}} = Caths.update_cath_lab(cath_lab, @invalid_attrs)
      assert cath_lab == Caths.get_cath_lab!(cath_lab.id)
    end

    test "delete_cath_lab/1 deletes the cath_lab" do
      cath_lab = cath_lab_fixture()
      assert {:ok, %Cath_lab{}} = Caths.delete_cath_lab(cath_lab)
      assert_raise Ecto.NoResultsError, fn -> Caths.get_cath_lab!(cath_lab.id) end
    end

    test "change_cath_lab/1 returns a cath_lab changeset" do
      cath_lab = cath_lab_fixture()
      assert %Ecto.Changeset{} = Caths.change_cath_lab(cath_lab)
    end
  end
end
