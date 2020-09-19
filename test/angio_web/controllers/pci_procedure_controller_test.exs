defmodule AngioWeb.Pci_procedureControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{
    pci_proc_multivessel_result: "some pci_proc_multivessel_result",
    pci_proc_surg_consult: "some pci_proc_surg_consult",
    pci_proc_50pct_lad_yn: true,
    pci_proc_lab_num: "some pci_proc_lab_num",
    pci_proc_operator_fname: "some pci_proc_operator_fname",
    pci_proc_lab_arrive_dt: ~D[2010-04-17],
    pci_proc_success_yn: true,
    pci_proc_les_treated_num: "some pci_proc_les_treated_num",
    pci_proc_indication: "some pci_proc_indication",
    pci_proc_primary_transfer_yn: true,
    pci_proc_ballons_used_num: "some pci_proc_ballons_used_num",
    pci_proc_entry: "some pci_proc_entry",
    pci_proc_les_attempt_num: "some pci_proc_les_attempt_num",
    pci_proc_50pct_lcx_yn: true,
    pci_proc_machine_id: "some pci_proc_machine_id",
    pci_proc_operator_lname: "some pci_proc_operator_lname",
    pci_proc_status_acs: "some pci_proc_status_acs",
    pci_proc_device_first_activ_dt: ~D[2010-04-17],
    pci_proc_stemi_onset_tm: ~T[14:00:00],
    pci_proc_dev_first_activ_tm: ~T[14:00:00],
    pci_proc_stemi_onset_dt: ~D[2010-04-17],
    pci_proc_lv_ef_pre_na: true,
    pci_proc_fluoro_tm: "some pci_proc_fluoro_tm",
    pci_proc_status_stemi: "some pci_proc_status_stemi",
    pci_proc_50pct_graft_yn: true,
    pci_proc_lab_arrive_tm: ~T[14:00:00],
    pci_proc_closure_device: "some pci_proc_closure_device",
    pci_proc_stents_used_num: "some pci_proc_stents_used_num",
    pci_proc_multivessel_yn: true,
    pci_proc_surg_consult_yn: true,
    pci_proc_operator_npi: "some pci_proc_operator_npi",
    pci_proc_lv_ef_pre_val: "some pci_proc_lv_ef_pre_val",
    pci_proc_fluoro_dose: "some pci_proc_fluoro_dose",
    pci_proc_lab_out_tm: ~T[14:00:00],
    pci_proc_device_deployed_yn: true,
    pci_proc_50pct_lm_yn: true,
    pci_proc_contrast_volume: "some pci_proc_contrast_volume",
    pci_proc_stents_implanted_num: "some pci_proc_stents_implanted_num",
    pci_proc_status: "some pci_proc_status",
    pci_proc_operator_mname: "some pci_proc_operator_mname",
    pci_proc_50pct_rca_yn: true,
    pci_proc_notes: "some pci_proc_notes",
    pci_proc_syndax_score: "some pci_proc_syndax_score"
  }
  @update_attrs %{
    pci_proc_multivessel_result: "some updated pci_proc_multivessel_result",
    pci_proc_surg_consult: "some updated pci_proc_surg_consult",
    pci_proc_50pct_lad_yn: false,
    pci_proc_lab_num: "some updated pci_proc_lab_num",
    pci_proc_operator_fname: "some updated pci_proc_operator_fname",
    pci_proc_lab_arrive_dt: ~D[2011-05-18],
    pci_proc_success_yn: false,
    pci_proc_les_treated_num: "some updated pci_proc_les_treated_num",
    pci_proc_indication: "some updated pci_proc_indication",
    pci_proc_primary_transfer_yn: false,
    pci_proc_ballons_used_num: "some updated pci_proc_ballons_used_num",
    pci_proc_entry: "some updated pci_proc_entry",
    pci_proc_les_attempt_num: "some updated pci_proc_les_attempt_num",
    pci_proc_50pct_lcx_yn: false,
    pci_proc_machine_id: "some updated pci_proc_machine_id",
    pci_proc_operator_lname: "some updated pci_proc_operator_lname",
    pci_proc_status_acs: "some updated pci_proc_status_acs",
    pci_proc_device_first_activ_dt: ~D[2011-05-18],
    pci_proc_stemi_onset_tm: ~T[15:01:01],
    pci_proc_dev_first_activ_tm: ~T[15:01:01],
    pci_proc_stemi_onset_dt: ~D[2011-05-18],
    pci_proc_lv_ef_pre_na: false,
    pci_proc_fluoro_tm: "some updated pci_proc_fluoro_tm",
    pci_proc_status_stemi: "some updated pci_proc_status_stemi",
    pci_proc_50pct_graft_yn: false,
    pci_proc_lab_arrive_tm: ~T[15:01:01],
    pci_proc_closure_device: "some updated pci_proc_closure_device",
    pci_proc_stents_used_num: "some updated pci_proc_stents_used_num",
    pci_proc_multivessel_yn: false,
    pci_proc_surg_consult_yn: false,
    pci_proc_operator_npi: "some updated pci_proc_operator_npi",
    pci_proc_lv_ef_pre_val: "some updated pci_proc_lv_ef_pre_val",
    pci_proc_fluoro_dose: "some updated pci_proc_fluoro_dose",
    pci_proc_lab_out_tm: ~T[15:01:01],
    pci_proc_device_deployed_yn: false,
    pci_proc_50pct_lm_yn: false,
    pci_proc_contrast_volume: "some updated pci_proc_contrast_volume",
    pci_proc_stents_implanted_num: "some updated pci_proc_stents_implanted_num",
    pci_proc_status: "some updated pci_proc_status",
    pci_proc_operator_mname: "some updated pci_proc_operator_mname",
    pci_proc_50pct_rca_yn: false,
    pci_proc_notes: "some updated pci_proc_notes",
    pci_proc_syndax_score: "some updated pci_proc_syndax_score"
  }
  @invalid_attrs %{
    pci_proc_multivessel_result: nil,
    pci_proc_surg_consult: nil,
    pci_proc_50pct_lad_yn: nil,
    pci_proc_lab_num: nil,
    pci_proc_operator_fname: nil,
    pci_proc_lab_arrive_dt: nil,
    pci_proc_success_yn: nil,
    pci_proc_les_treated_num: nil,
    pci_proc_indication: nil,
    pci_proc_primary_transfer_yn: nil,
    pci_proc_ballons_used_num: nil,
    pci_proc_entry: nil,
    pci_proc_les_attempt_num: nil,
    pci_proc_50pct_lcx_yn: nil,
    pci_proc_machine_id: nil,
    pci_proc_operator_lname: nil,
    pci_proc_status_acs: nil,
    pci_proc_device_first_activ_dt: nil,
    pci_proc_stemi_onset_tm: nil,
    pci_proc_dev_first_activ_tm: nil,
    pci_proc_stemi_onset_dt: nil,
    pci_proc_lv_ef_pre_na: nil,
    pci_proc_fluoro_tm: nil,
    pci_proc_status_stemi: nil,
    pci_proc_50pct_graft_yn: nil,
    pci_proc_lab_arrive_tm: nil,
    pci_proc_closure_device: nil,
    pci_proc_stents_used_num: nil,
    pci_proc_multivessel_yn: nil,
    pci_proc_surg_consult_yn: nil,
    pci_proc_operator_npi: nil,
    pci_proc_lv_ef_pre_val: nil,
    pci_proc_fluoro_dose: nil,
    pci_proc_lab_out_tm: nil,
    pci_proc_device_deployed_yn: nil,
    pci_proc_50pct_lm_yn: nil,
    pci_proc_contrast_volume: nil,
    pci_proc_stents_implanted_num: nil,
    pci_proc_status: nil,
    pci_proc_operator_mname: nil,
    pci_proc_50pct_rca_yn: nil,
    pci_proc_notes: nil,
    pci_proc_syndax_score: nil
  }

  def fixture(:pci_procedure) do
    {:ok, pci_procedure} = Interventions.create_pci_procedure(@create_attrs)
    pci_procedure
  end

  describe "index" do
    test "lists all pci_procedures", %{conn: conn} do
      conn = get(conn, Routes.pci_procedure_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pci procedures"
    end
  end

  describe "new pci_procedure" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pci_procedure_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pci procedure"
    end
  end

  describe "create pci_procedure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pci_procedure_path(conn, :create), pci_procedure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pci_procedure_path(conn, :show, id)

      conn = get(conn, Routes.pci_procedure_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pci procedure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pci_procedure_path(conn, :create), pci_procedure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pci procedure"
    end
  end

  describe "edit pci_procedure" do
    setup [:create_pci_procedure]

    test "renders form for editing chosen pci_procedure", %{
      conn: conn,
      pci_procedure: pci_procedure
    } do
      conn = get(conn, Routes.pci_procedure_path(conn, :edit, pci_procedure))
      assert html_response(conn, 200) =~ "Edit Pci procedure"
    end
  end

  describe "update pci_procedure" do
    setup [:create_pci_procedure]

    test "redirects when data is valid", %{conn: conn, pci_procedure: pci_procedure} do
      conn =
        put(conn, Routes.pci_procedure_path(conn, :update, pci_procedure),
          pci_procedure: @update_attrs
        )

      assert redirected_to(conn) == Routes.pci_procedure_path(conn, :show, pci_procedure)

      conn = get(conn, Routes.pci_procedure_path(conn, :show, pci_procedure))
      assert html_response(conn, 200) =~ "some updated pci_proc_multivessel_result"
    end

    test "renders errors when data is invalid", %{conn: conn, pci_procedure: pci_procedure} do
      conn =
        put(conn, Routes.pci_procedure_path(conn, :update, pci_procedure),
          pci_procedure: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Pci procedure"
    end
  end

  describe "delete pci_procedure" do
    setup [:create_pci_procedure]

    test "deletes chosen pci_procedure", %{conn: conn, pci_procedure: pci_procedure} do
      conn = delete(conn, Routes.pci_procedure_path(conn, :delete, pci_procedure))
      assert redirected_to(conn) == Routes.pci_procedure_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.pci_procedure_path(conn, :show, pci_procedure))
      end)
    end
  end

  defp create_pci_procedure(_) do
    pci_procedure = fixture(:pci_procedure)
    {:ok, pci_procedure: pci_procedure}
  end
end
