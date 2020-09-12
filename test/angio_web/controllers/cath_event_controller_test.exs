defmodule AngioWeb.Cath_eventControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{uni_cardiac_perforation_site: "some uni_cardiac_perforation_site", cath_ev_stroke_new_yn: true, cath_ev_bleed_access_yn: "some cath_ev_bleed_access_yn", cath_ev_prior_mi_yn: true, cath_ev_bleed_other_yn: true, cath_ev_cabg_tm: ~T[14:00:00], cath_ev_cor_vein_dissection_yn: true, cath_ev_hematoma_size: "some cath_ev_hematoma_size", cath_ev_cabg_location: "some cath_ev_cabg_location", cath_ev_cabg_dt_tm_utc: "2010-04-17T14:00:00Z", cath_ev_for_cabg_status: "some cath_ev_for_cabg_status", cath_ev_infarction_yn: true, "": true, cath_ev_bleed_tm: ~T[14:00:00], cath_ev_cardioversion_yn: true, cath_ev_bleed_retroperi_yn: "some cath_ev_bleed_retroperi_yn", cath_ev_vasc_limb_ischemia_yn: true, cath_ev_bleed_dt: ~D[2010-04-17], uni_bleed_barc_class: "some uni_bleed_barc_class", cath_ev_hematoma_at_access_yn: true, cath_ev_heart_block_yn: true, cath_ev_bleed_dt_tm_utc: "2010-04-17T14:00:00Z", cath_ev_bleed_gu_yn: true, cath_ev_vasc_dissection_yn: true, res_term_infarction_type: "some res_term_infarction_type", cath_ev_cor_art_perforation_yn: "some cath_ev_cor_art_perforation_yn", cath_ev_cabg_dt: ~D[2010-04-17], cath_ev_stroke_new_hemo_yn: true, cath_ev_stroke_new_24h_yn: true, cath_ev_header: "some cath_ev_header", cath_ev_bleed_yn: true, uni_dialysis_new_req_yn: true, cath_ev_hematoma_treat: "some cath_ev_hematoma_treat", cath_ev_hb_prior_transfer: true, cath_ev_cor_art_dissection_yn: true, cath_ev_vasc_pseudoaneurysm_yn: true, uni_dialysis_new_req_dt: ~D[2010-04-17], cath_ev_notes: "some cath_ev_notes", cath_ev_event_yn: true, cath_ev_death_at_proc_yn: true, cath_ev_cardiac_perforation_yn: true, cath_ev_cor_art_thrombus_yn: true, cath_ev_for_cabg_indication: "some cath_ev_for_cabg_indication", cath_ev_vasc_compl_yn: true, uni_currently_on_dialysis: true, cath_ev_blood_transfusion_yn: true, cath_ev_valve_injury_yn: true, cath_ev_shock_cath_induced_yn: true, cath_ev_av_fistula_yn: true, cath_ev_bleed_gi_yn: true, ...}
  @update_attrs %{uni_cardiac_perforation_site: "some updated uni_cardiac_perforation_site", cath_ev_stroke_new_yn: false, cath_ev_bleed_access_yn: "some updated cath_ev_bleed_access_yn", cath_ev_prior_mi_yn: false, cath_ev_bleed_other_yn: false, cath_ev_cabg_tm: ~T[15:01:01], cath_ev_cor_vein_dissection_yn: false, cath_ev_hematoma_size: "some updated cath_ev_hematoma_size", cath_ev_cabg_location: "some updated cath_ev_cabg_location", cath_ev_cabg_dt_tm_utc: "2011-05-18T15:01:01Z", cath_ev_for_cabg_status: "some updated cath_ev_for_cabg_status", cath_ev_infarction_yn: false, "": false, cath_ev_bleed_tm: ~T[15:01:01], cath_ev_cardioversion_yn: false, cath_ev_bleed_retroperi_yn: "some updated cath_ev_bleed_retroperi_yn", cath_ev_vasc_limb_ischemia_yn: false, cath_ev_bleed_dt: ~D[2011-05-18], uni_bleed_barc_class: "some updated uni_bleed_barc_class", cath_ev_hematoma_at_access_yn: false, cath_ev_heart_block_yn: false, cath_ev_bleed_dt_tm_utc: "2011-05-18T15:01:01Z", cath_ev_bleed_gu_yn: false, cath_ev_vasc_dissection_yn: false, res_term_infarction_type: "some updated res_term_infarction_type", cath_ev_cor_art_perforation_yn: "some updated cath_ev_cor_art_perforation_yn", cath_ev_cabg_dt: ~D[2011-05-18], cath_ev_stroke_new_hemo_yn: false, cath_ev_stroke_new_24h_yn: false, cath_ev_header: "some updated cath_ev_header", cath_ev_bleed_yn: false, uni_dialysis_new_req_yn: false, cath_ev_hematoma_treat: "some updated cath_ev_hematoma_treat", cath_ev_hb_prior_transfer: false, cath_ev_cor_art_dissection_yn: false, cath_ev_vasc_pseudoaneurysm_yn: false, uni_dialysis_new_req_dt: ~D[2011-05-18], cath_ev_notes: "some updated cath_ev_notes", cath_ev_event_yn: false, cath_ev_death_at_proc_yn: false, cath_ev_cardiac_perforation_yn: false, cath_ev_cor_art_thrombus_yn: false, cath_ev_for_cabg_indication: "some updated cath_ev_for_cabg_indication", cath_ev_vasc_compl_yn: false, uni_currently_on_dialysis: false, cath_ev_blood_transfusion_yn: false, cath_ev_valve_injury_yn: false, cath_ev_shock_cath_induced_yn: false, cath_ev_av_fistula_yn: false, cath_ev_bleed_gi_yn: false, ...}
  @invalid_attrs %{uni_cardiac_perforation_site: nil, cath_ev_stroke_new_yn: nil, cath_ev_bleed_access_yn: nil, cath_ev_prior_mi_yn: nil, cath_ev_bleed_other_yn: nil, cath_ev_cabg_tm: nil, cath_ev_cor_vein_dissection_yn: nil, cath_ev_hematoma_size: nil, cath_ev_cabg_location: nil, cath_ev_cabg_dt_tm_utc: nil, cath_ev_for_cabg_status: nil, cath_ev_infarction_yn: nil, "": nil, cath_ev_bleed_tm: nil, cath_ev_cardioversion_yn: nil, cath_ev_bleed_retroperi_yn: nil, cath_ev_vasc_limb_ischemia_yn: nil, cath_ev_bleed_dt: nil, uni_bleed_barc_class: nil, cath_ev_hematoma_at_access_yn: nil, cath_ev_heart_block_yn: nil, cath_ev_bleed_dt_tm_utc: nil, cath_ev_bleed_gu_yn: nil, cath_ev_vasc_dissection_yn: nil, res_term_infarction_type: nil, cath_ev_cor_art_perforation_yn: nil, cath_ev_cabg_dt: nil, cath_ev_stroke_new_hemo_yn: nil, cath_ev_stroke_new_24h_yn: nil, cath_ev_header: nil, cath_ev_bleed_yn: nil, uni_dialysis_new_req_yn: nil, cath_ev_hematoma_treat: nil, cath_ev_hb_prior_transfer: nil, cath_ev_cor_art_dissection_yn: nil, cath_ev_vasc_pseudoaneurysm_yn: nil, uni_dialysis_new_req_dt: nil, cath_ev_notes: nil, cath_ev_event_yn: nil, cath_ev_death_at_proc_yn: nil, cath_ev_cardiac_perforation_yn: nil, cath_ev_cor_art_thrombus_yn: nil, cath_ev_for_cabg_indication: nil, cath_ev_vasc_compl_yn: nil, uni_currently_on_dialysis: nil, cath_ev_blood_transfusion_yn: nil, cath_ev_valve_injury_yn: nil, cath_ev_shock_cath_induced_yn: nil, cath_ev_av_fistula_yn: nil, cath_ev_bleed_gi_yn: nil, ...}

  def fixture(:cath_event) do
    {:ok, cath_event} = Caths.create_cath_event(@create_attrs)
    cath_event
  end

  describe "index" do
    test "lists all cath_events", %{conn: conn} do
      conn = get(conn, Routes.cath_event_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath events"
    end
  end

  describe "new cath_event" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_event_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath event"
    end
  end

  describe "create cath_event" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_event_path(conn, :create), cath_event: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_event_path(conn, :show, id)

      conn = get(conn, Routes.cath_event_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath event"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_event_path(conn, :create), cath_event: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath event"
    end
  end

  describe "edit cath_event" do
    setup [:create_cath_event]

    test "renders form for editing chosen cath_event", %{conn: conn, cath_event: cath_event} do
      conn = get(conn, Routes.cath_event_path(conn, :edit, cath_event))
      assert html_response(conn, 200) =~ "Edit Cath event"
    end
  end

  describe "update cath_event" do
    setup [:create_cath_event]

    test "redirects when data is valid", %{conn: conn, cath_event: cath_event} do
      conn = put(conn, Routes.cath_event_path(conn, :update, cath_event), cath_event: @update_attrs)
      assert redirected_to(conn) == Routes.cath_event_path(conn, :show, cath_event)

      conn = get(conn, Routes.cath_event_path(conn, :show, cath_event))
      assert html_response(conn, 200) =~ "some updated uni_cardiac_perforation_site"
    end

    test "renders errors when data is invalid", %{conn: conn, cath_event: cath_event} do
      conn = put(conn, Routes.cath_event_path(conn, :update, cath_event), cath_event: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cath event"
    end
  end

  describe "delete cath_event" do
    setup [:create_cath_event]

    test "deletes chosen cath_event", %{conn: conn, cath_event: cath_event} do
      conn = delete(conn, Routes.cath_event_path(conn, :delete, cath_event))
      assert redirected_to(conn) == Routes.cath_event_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cath_event_path(conn, :show, cath_event))
      end
    end
  end

  defp create_cath_event(_) do
    cath_event = fixture(:cath_event)
    {:ok, cath_event: cath_event}
  end
end
