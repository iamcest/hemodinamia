defmodule AngioWeb.Pci_lesionControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{pci_les_prior_stent_for_isr_yn: true, pci_les_timi_flow_post: "some pci_les_timi_flow_post", pci_les_stent_1_len: "some pci_les_stent_1_len", pci_les_graft_segments_sts: "some pci_les_graft_segments_sts", pci_les_balloon_pres_post: "some pci_les_balloon_pres_post", pci_les_in_native_yn: true, pci_les_gw_cossed_yn: true, pci_les_stent_3_code: "some pci_les_stent_3_code", pci_lesev_dissection_type: "some pci_lesev_dissection_type", pci_les_notes: "some pci_les_notes", pci_les_in_graft_yn: true, pci_les_embolic_protect_type: "some pci_les_embolic_protect_type", pci_les_status_stent_thrombus: "some pci_les_status_stent_thrombus", pci_les_status_isr_stent_type: "some pci_les_status_isr_stent_type", pci_les_graft_segment_pos: "some pci_les_graft_segment_pos", pci_les_rest_no_prior_stent_yn: true, pci_lesev_acute_clossure_yn: true, pci_les_status: "some pci_les_status", pci_les_devices_used: "some pci_les_devices_used", pci_les_status_isr_duration: "some pci_les_status_isr_duration", pci_les_stent_type: "some pci_les_stent_type", pci_les_balloon_type_pre: "some pci_les_balloon_type_pre", pci_les_status_isr_yn: true, pci_les_branch_occlusion_yn: true, pci_les_stent_3_diam: "some pci_les_stent_3_diam", pci_les_stent_1_code: "some pci_les_stent_1_code", pci_les_de_novo_yn: true, pci_les_counter: "some pci_les_counter", pci_les_graft_segments_cdisc: "some pci_les_graft_segments_cdisc", pci_lesev_perforation_class: "some pci_lesev_perforation_class", pci_les_device_counter: "some pci_les_device_counter", pci_les_calcium_yn: true, pci_les_prior_treat_timeframe: "some pci_les_prior_treat_timeframe", pci_lesev_perforation_treat: "some pci_lesev_perforation_treat", pci_les_graft_segments_ncdr: "some pci_les_graft_segments_ncdr", pci_les_balloon_type_post: "some pci_les_balloon_type_post", pci_les_stent_3_len: "some pci_les_stent_3_len", pci_les_stent_4_len: "some pci_les_stent_4_len", pci_les_guide_types: "some pci_les_guide_types", pci_les_length: "some pci_les_length", pci_les_prior_stent_type: "some pci_les_prior_stent_type", pci_les_no_reflow_yn: true, pci_les_complexity: "some pci_les_complexity", pci_les_sten_pct_post: "some pci_les_sten_pct_post", pci_les_stented_yn: true, pci_les_graft_conduit_type: "some pci_les_graft_conduit_type", pci_les_aha_type: "some pci_les_aha_type", pci_les_event_yn: true, pci_les_stent_2_len: "some pci_les_stent_2_len", pci_les_culprit_yn: true, ...}
  @update_attrs %{pci_les_prior_stent_for_isr_yn: false, pci_les_timi_flow_post: "some updated pci_les_timi_flow_post", pci_les_stent_1_len: "some updated pci_les_stent_1_len", pci_les_graft_segments_sts: "some updated pci_les_graft_segments_sts", pci_les_balloon_pres_post: "some updated pci_les_balloon_pres_post", pci_les_in_native_yn: false, pci_les_gw_cossed_yn: false, pci_les_stent_3_code: "some updated pci_les_stent_3_code", pci_lesev_dissection_type: "some updated pci_lesev_dissection_type", pci_les_notes: "some updated pci_les_notes", pci_les_in_graft_yn: false, pci_les_embolic_protect_type: "some updated pci_les_embolic_protect_type", pci_les_status_stent_thrombus: "some updated pci_les_status_stent_thrombus", pci_les_status_isr_stent_type: "some updated pci_les_status_isr_stent_type", pci_les_graft_segment_pos: "some updated pci_les_graft_segment_pos", pci_les_rest_no_prior_stent_yn: false, pci_lesev_acute_clossure_yn: false, pci_les_status: "some updated pci_les_status", pci_les_devices_used: "some updated pci_les_devices_used", pci_les_status_isr_duration: "some updated pci_les_status_isr_duration", pci_les_stent_type: "some updated pci_les_stent_type", pci_les_balloon_type_pre: "some updated pci_les_balloon_type_pre", pci_les_status_isr_yn: false, pci_les_branch_occlusion_yn: false, pci_les_stent_3_diam: "some updated pci_les_stent_3_diam", pci_les_stent_1_code: "some updated pci_les_stent_1_code", pci_les_de_novo_yn: false, pci_les_counter: "some updated pci_les_counter", pci_les_graft_segments_cdisc: "some updated pci_les_graft_segments_cdisc", pci_lesev_perforation_class: "some updated pci_lesev_perforation_class", pci_les_device_counter: "some updated pci_les_device_counter", pci_les_calcium_yn: false, pci_les_prior_treat_timeframe: "some updated pci_les_prior_treat_timeframe", pci_lesev_perforation_treat: "some updated pci_lesev_perforation_treat", pci_les_graft_segments_ncdr: "some updated pci_les_graft_segments_ncdr", pci_les_balloon_type_post: "some updated pci_les_balloon_type_post", pci_les_stent_3_len: "some updated pci_les_stent_3_len", pci_les_stent_4_len: "some updated pci_les_stent_4_len", pci_les_guide_types: "some updated pci_les_guide_types", pci_les_length: "some updated pci_les_length", pci_les_prior_stent_type: "some updated pci_les_prior_stent_type", pci_les_no_reflow_yn: false, pci_les_complexity: "some updated pci_les_complexity", pci_les_sten_pct_post: "some updated pci_les_sten_pct_post", pci_les_stented_yn: false, pci_les_graft_conduit_type: "some updated pci_les_graft_conduit_type", pci_les_aha_type: "some updated pci_les_aha_type", pci_les_event_yn: false, pci_les_stent_2_len: "some updated pci_les_stent_2_len", pci_les_culprit_yn: false, ...}
  @invalid_attrs %{pci_les_prior_stent_for_isr_yn: nil, pci_les_timi_flow_post: nil, pci_les_stent_1_len: nil, pci_les_graft_segments_sts: nil, pci_les_balloon_pres_post: nil, pci_les_in_native_yn: nil, pci_les_gw_cossed_yn: nil, pci_les_stent_3_code: nil, pci_lesev_dissection_type: nil, pci_les_notes: nil, pci_les_in_graft_yn: nil, pci_les_embolic_protect_type: nil, pci_les_status_stent_thrombus: nil, pci_les_status_isr_stent_type: nil, pci_les_graft_segment_pos: nil, pci_les_rest_no_prior_stent_yn: nil, pci_lesev_acute_clossure_yn: nil, pci_les_status: nil, pci_les_devices_used: nil, pci_les_status_isr_duration: nil, pci_les_stent_type: nil, pci_les_balloon_type_pre: nil, pci_les_status_isr_yn: nil, pci_les_branch_occlusion_yn: nil, pci_les_stent_3_diam: nil, pci_les_stent_1_code: nil, pci_les_de_novo_yn: nil, pci_les_counter: nil, pci_les_graft_segments_cdisc: nil, pci_lesev_perforation_class: nil, pci_les_device_counter: nil, pci_les_calcium_yn: nil, pci_les_prior_treat_timeframe: nil, pci_lesev_perforation_treat: nil, pci_les_graft_segments_ncdr: nil, pci_les_balloon_type_post: nil, pci_les_stent_3_len: nil, pci_les_stent_4_len: nil, pci_les_guide_types: nil, pci_les_length: nil, pci_les_prior_stent_type: nil, pci_les_no_reflow_yn: nil, pci_les_complexity: nil, pci_les_sten_pct_post: nil, pci_les_stented_yn: nil, pci_les_graft_conduit_type: nil, pci_les_aha_type: nil, pci_les_event_yn: nil, pci_les_stent_2_len: nil, pci_les_culprit_yn: nil, ...}

  def fixture(:pci_lesion) do
    {:ok, pci_lesion} = Interventions.create_pci_lesion(@create_attrs)
    pci_lesion
  end

  describe "index" do
    test "lists all pci_lesions", %{conn: conn} do
      conn = get(conn, Routes.pci_lesion_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pci lesions"
    end
  end

  describe "new pci_lesion" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pci_lesion_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pci lesion"
    end
  end

  describe "create pci_lesion" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pci_lesion_path(conn, :create), pci_lesion: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pci_lesion_path(conn, :show, id)

      conn = get(conn, Routes.pci_lesion_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pci lesion"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pci_lesion_path(conn, :create), pci_lesion: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pci lesion"
    end
  end

  describe "edit pci_lesion" do
    setup [:create_pci_lesion]

    test "renders form for editing chosen pci_lesion", %{conn: conn, pci_lesion: pci_lesion} do
      conn = get(conn, Routes.pci_lesion_path(conn, :edit, pci_lesion))
      assert html_response(conn, 200) =~ "Edit Pci lesion"
    end
  end

  describe "update pci_lesion" do
    setup [:create_pci_lesion]

    test "redirects when data is valid", %{conn: conn, pci_lesion: pci_lesion} do
      conn = put(conn, Routes.pci_lesion_path(conn, :update, pci_lesion), pci_lesion: @update_attrs)
      assert redirected_to(conn) == Routes.pci_lesion_path(conn, :show, pci_lesion)

      conn = get(conn, Routes.pci_lesion_path(conn, :show, pci_lesion))
      assert html_response(conn, 200) =~ "some updated pci_les_timi_flow_post"
    end

    test "renders errors when data is invalid", %{conn: conn, pci_lesion: pci_lesion} do
      conn = put(conn, Routes.pci_lesion_path(conn, :update, pci_lesion), pci_lesion: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pci lesion"
    end
  end

  describe "delete pci_lesion" do
    setup [:create_pci_lesion]

    test "deletes chosen pci_lesion", %{conn: conn, pci_lesion: pci_lesion} do
      conn = delete(conn, Routes.pci_lesion_path(conn, :delete, pci_lesion))
      assert redirected_to(conn) == Routes.pci_lesion_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pci_lesion_path(conn, :show, pci_lesion))
      end
    end
  end

  defp create_pci_lesion(_) do
    pci_lesion = fixture(:pci_lesion)
    {:ok, pci_lesion: pci_lesion}
  end
end
