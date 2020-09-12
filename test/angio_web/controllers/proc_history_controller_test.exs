defmodule AngioWeb.Proc_historyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Histories

  @create_attrs %{"": ~D[2010-04-17], proc_epis_request_dt: "some proc_epis_request_dt", proch_cabg_prior_dt: ~D[2010-04-17], proch_cabg_prior_yn: true, proch_cardiac_surg_other_yn: true, proch_carotid_surg_stent_dt: ~D[2010-04-17], proch_carotid_surg_stent_yn: true, proch_notes: "some proch_notes", proch_pacer_prior_dt: ~D[2010-04-17], proch_pacer_prior_yn: true, proch_pci_prior_dt: ~D[2010-04-17], proch_pci_prior_yn: true, proch_prior_icd_dt: ~D[2010-04-17], proch_prior_icd_yn: true, proch_prior_rv_biopsy_dt: ~D[2010-04-17], proch_prior_rv_biopsy_yn: true, proch_prior_valve_interv_dt: ~D[2010-04-17], proch_prior_valve_interv_yn: true, proch_transplant_prior_dt: ~D[2010-04-17], proch_transplant_prior_yn: true}
  @update_attrs %{"": ~D[2011-05-18], proc_epis_request_dt: "some updated proc_epis_request_dt", proch_cabg_prior_dt: ~D[2011-05-18], proch_cabg_prior_yn: false, proch_cardiac_surg_other_yn: false, proch_carotid_surg_stent_dt: ~D[2011-05-18], proch_carotid_surg_stent_yn: false, proch_notes: "some updated proch_notes", proch_pacer_prior_dt: ~D[2011-05-18], proch_pacer_prior_yn: false, proch_pci_prior_dt: ~D[2011-05-18], proch_pci_prior_yn: false, proch_prior_icd_dt: ~D[2011-05-18], proch_prior_icd_yn: false, proch_prior_rv_biopsy_dt: ~D[2011-05-18], proch_prior_rv_biopsy_yn: false, proch_prior_valve_interv_dt: ~D[2011-05-18], proch_prior_valve_interv_yn: false, proch_transplant_prior_dt: ~D[2011-05-18], proch_transplant_prior_yn: false}
  @invalid_attrs %{"": nil, proc_epis_request_dt: nil, proch_cabg_prior_dt: nil, proch_cabg_prior_yn: nil, proch_cardiac_surg_other_yn: nil, proch_carotid_surg_stent_dt: nil, proch_carotid_surg_stent_yn: nil, proch_notes: nil, proch_pacer_prior_dt: nil, proch_pacer_prior_yn: nil, proch_pci_prior_dt: nil, proch_pci_prior_yn: nil, proch_prior_icd_dt: nil, proch_prior_icd_yn: nil, proch_prior_rv_biopsy_dt: nil, proch_prior_rv_biopsy_yn: nil, proch_prior_valve_interv_dt: nil, proch_prior_valve_interv_yn: nil, proch_transplant_prior_dt: nil, proch_transplant_prior_yn: nil}

  def fixture(:proc_history) do
    {:ok, proc_history} = Histories.create_proc_history(@create_attrs)
    proc_history
  end

  describe "index" do
    test "lists all proc_histories", %{conn: conn} do
      conn = get(conn, Routes.proc_history_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Proc histories"
    end
  end

  describe "new proc_history" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.proc_history_path(conn, :new))
      assert html_response(conn, 200) =~ "New Proc history"
    end
  end

  describe "create proc_history" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proc_history_path(conn, :create), proc_history: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.proc_history_path(conn, :show, id)

      conn = get(conn, Routes.proc_history_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Proc history"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proc_history_path(conn, :create), proc_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Proc history"
    end
  end

  describe "edit proc_history" do
    setup [:create_proc_history]

    test "renders form for editing chosen proc_history", %{conn: conn, proc_history: proc_history} do
      conn = get(conn, Routes.proc_history_path(conn, :edit, proc_history))
      assert html_response(conn, 200) =~ "Edit Proc history"
    end
  end

  describe "update proc_history" do
    setup [:create_proc_history]

    test "redirects when data is valid", %{conn: conn, proc_history: proc_history} do
      conn = put(conn, Routes.proc_history_path(conn, :update, proc_history), proc_history: @update_attrs)
      assert redirected_to(conn) == Routes.proc_history_path(conn, :show, proc_history)

      conn = get(conn, Routes.proc_history_path(conn, :show, proc_history))
      assert html_response(conn, 200) =~ "some updated proc_epis_request_dt"
    end

    test "renders errors when data is invalid", %{conn: conn, proc_history: proc_history} do
      conn = put(conn, Routes.proc_history_path(conn, :update, proc_history), proc_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Proc history"
    end
  end

  describe "delete proc_history" do
    setup [:create_proc_history]

    test "deletes chosen proc_history", %{conn: conn, proc_history: proc_history} do
      conn = delete(conn, Routes.proc_history_path(conn, :delete, proc_history))
      assert redirected_to(conn) == Routes.proc_history_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.proc_history_path(conn, :show, proc_history))
      end
    end
  end

  defp create_proc_history(_) do
    proc_history = fixture(:proc_history)
    {:ok, proc_history: proc_history}
  end
end
