defmodule AngioWeb.Cath_medControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    cmed_diuretics_yn: true,
    cmed_prostaglandins_yn: true,
    cmed_medications_other_yn: true,
    cmed_aspirin_yn: true,
    cmed_lytics_yn: true,
    cmed_antihypertensives_yn: true,
    cmed_ace_yn: true,
    cmed_xa_inhibitors: "some cmed_xa_inhibitors",
    cmed_arb_yn: true,
    cmed_notes: "some cmed_notes",
    cmed_antiplatelets_yn: true,
    cmed_lytics_bolus_dt: ~D[2010-04-17],
    cmed_vaso_dilators_yn: true,
    cmed_nitrates_long_act_yn: true,
    cmed_anti_anginal_yn: true,
    cmed_thienopyridines: "some cmed_thienopyridines",
    cmed_ufh_yn: true,
    cmed_no_statin_agent_yn: true,
    cmed_lytics_bolus_tm: ~T[14:00:00],
    cmed_ufh_dose: "some cmed_ufh_dose",
    cmed_anti_anginal_other_yn: true,
    cmed_anticoagulants_yn: true,
    cmed_direct_thrombin: "some cmed_direct_thrombin",
    cmed_pde_inhibitor_yn: true,
    cmed_lmwh_yn: true,
    cmed_statin_yn: true,
    cmed_bblocker_yn: true,
    cmed_inotrops_yn: true,
    cmed_ranolazine_yn: true,
    cmed_gp_iib_iiia_yn: true,
    cmed_ca_channel_pre_yn: true,
    cmed_antiarrhythmics_yn: true,
    cmed_atropine_yn: true
  }
  @update_attrs %{
    cmed_diuretics_yn: false,
    cmed_prostaglandins_yn: false,
    cmed_medications_other_yn: false,
    cmed_aspirin_yn: false,
    cmed_lytics_yn: false,
    cmed_antihypertensives_yn: false,
    cmed_ace_yn: false,
    cmed_xa_inhibitors: "some updated cmed_xa_inhibitors",
    cmed_arb_yn: false,
    cmed_notes: "some updated cmed_notes",
    cmed_antiplatelets_yn: false,
    cmed_lytics_bolus_dt: ~D[2011-05-18],
    cmed_vaso_dilators_yn: false,
    cmed_nitrates_long_act_yn: false,
    cmed_anti_anginal_yn: false,
    cmed_thienopyridines: "some updated cmed_thienopyridines",
    cmed_ufh_yn: false,
    cmed_no_statin_agent_yn: false,
    cmed_lytics_bolus_tm: ~T[15:01:01],
    cmed_ufh_dose: "some updated cmed_ufh_dose",
    cmed_anti_anginal_other_yn: false,
    cmed_anticoagulants_yn: false,
    cmed_direct_thrombin: "some updated cmed_direct_thrombin",
    cmed_pde_inhibitor_yn: false,
    cmed_lmwh_yn: false,
    cmed_statin_yn: false,
    cmed_bblocker_yn: false,
    cmed_inotrops_yn: false,
    cmed_ranolazine_yn: false,
    cmed_gp_iib_iiia_yn: false,
    cmed_ca_channel_pre_yn: false,
    cmed_antiarrhythmics_yn: false,
    cmed_atropine_yn: false
  }
  @invalid_attrs %{
    cmed_diuretics_yn: nil,
    cmed_prostaglandins_yn: nil,
    cmed_medications_other_yn: nil,
    cmed_aspirin_yn: nil,
    cmed_lytics_yn: nil,
    cmed_antihypertensives_yn: nil,
    cmed_ace_yn: nil,
    cmed_xa_inhibitors: nil,
    cmed_arb_yn: nil,
    cmed_notes: nil,
    cmed_antiplatelets_yn: nil,
    cmed_lytics_bolus_dt: nil,
    cmed_vaso_dilators_yn: nil,
    cmed_nitrates_long_act_yn: nil,
    cmed_anti_anginal_yn: nil,
    cmed_thienopyridines: nil,
    cmed_ufh_yn: nil,
    cmed_no_statin_agent_yn: nil,
    cmed_lytics_bolus_tm: nil,
    cmed_ufh_dose: nil,
    cmed_anti_anginal_other_yn: nil,
    cmed_anticoagulants_yn: nil,
    cmed_direct_thrombin: nil,
    cmed_pde_inhibitor_yn: nil,
    cmed_lmwh_yn: nil,
    cmed_statin_yn: nil,
    cmed_bblocker_yn: nil,
    cmed_inotrops_yn: nil,
    cmed_ranolazine_yn: nil,
    cmed_gp_iib_iiia_yn: nil,
    cmed_ca_channel_pre_yn: nil,
    cmed_antiarrhythmics_yn: nil,
    cmed_atropine_yn: nil
  }

  def fixture(:cath_med) do
    {:ok, cath_med} = Caths.create_cath_med(@create_attrs)
    cath_med
  end

  describe "index" do
    test "lists all cath_meds", %{conn: conn} do
      conn = get(conn, Routes.cath_med_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath meds"
    end
  end

  describe "new cath_med" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_med_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath med"
    end
  end

  describe "create cath_med" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_med_path(conn, :create), cath_med: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_med_path(conn, :show, id)

      conn = get(conn, Routes.cath_med_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath med"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_med_path(conn, :create), cath_med: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath med"
    end
  end

  describe "edit cath_med" do
    setup [:create_cath_med]

    test "renders form for editing chosen cath_med", %{conn: conn, cath_med: cath_med} do
      conn = get(conn, Routes.cath_med_path(conn, :edit, cath_med))
      assert html_response(conn, 200) =~ "Edit Cath med"
    end
  end

  describe "update cath_med" do
    setup [:create_cath_med]

    test "redirects when data is valid", %{conn: conn, cath_med: cath_med} do
      conn = put(conn, Routes.cath_med_path(conn, :update, cath_med), cath_med: @update_attrs)
      assert redirected_to(conn) == Routes.cath_med_path(conn, :show, cath_med)

      conn = get(conn, Routes.cath_med_path(conn, :show, cath_med))
      assert html_response(conn, 200) =~ "some updated cmed_xa_inhibitors"
    end

    test "renders errors when data is invalid", %{conn: conn, cath_med: cath_med} do
      conn = put(conn, Routes.cath_med_path(conn, :update, cath_med), cath_med: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cath med"
    end
  end

  describe "delete cath_med" do
    setup [:create_cath_med]

    test "deletes chosen cath_med", %{conn: conn, cath_med: cath_med} do
      conn = delete(conn, Routes.cath_med_path(conn, :delete, cath_med))
      assert redirected_to(conn) == Routes.cath_med_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cath_med_path(conn, :show, cath_med))
      end)
    end
  end

  defp create_cath_med(_) do
    cath_med = fixture(:cath_med)
    {:ok, cath_med: cath_med}
  end
end
