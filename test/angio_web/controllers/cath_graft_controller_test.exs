defmodule AngioWeb.Cath_graftControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    graft_mid_sten_pct: "some graft_mid_sten_pct",
    graft_dist_sten_pct: "some graft_dist_sten_pct",
    graft_dist_anast_sten_ivus: "some graft_dist_anast_sten_ivus",
    graft_prox_sten_prior_treated_yn: true,
    cath_graft_segments_cdisc: [],
    graft_mid_sten_ivus: "some graft_mid_sten_ivus",
    graft_notes: "some graft_notes",
    graft_prox_sten_pct: "some graft_prox_sten_pct",
    graft_dist_anast_sten_pct: "some graft_dist_anast_sten_pct",
    graft_ostial_device_present_yn: true,
    cath_graft_segments_main_vessel: "some cath_graft_segments_main_vessel",
    graft_sten_yn: true,
    graft_dist_anast_device_present_yn: true,
    cath_graft_segments_ncdr: [],
    graft_ostial_sten_yn: true,
    patient_id: 42,
    graft_dist_anast_prior_treated_yn: true,
    cath_graft_prox_site: "some cath_graft_prox_site",
    graft_ostial_sten_pct: "some graft_ostial_sten_pct",
    graft_prox_sten_device_present_yn: true,
    graft_mid_sten_prior_treated_dt: ~D[2010-04-17],
    graft_ostial_prior_treated_yn: true,
    graft_dist_sten_device_present_yn: true,
    graft_dist_sten_prior_treated_yn: true,
    graft_ostial_prior_treated_dt: ~D[2010-04-17],
    graft_dist_anast_type: "some graft_dist_anast_type",
    graft_dist_sten_ffr: "some graft_dist_sten_ffr",
    graft_dist_anast_sten_ffr: "some graft_dist_anast_sten_ffr",
    cath_graft_header: "some cath_graft_header",
    graft_mid_sten_ffr: "some graft_mid_sten_ffr",
    graft_morphology: "some graft_morphology",
    graft_dist_sten_ivus: "some graft_dist_sten_ivus",
    graft_ostial_sten_ffr: "some graft_ostial_sten_ffr",
    graft_prox_sten_yn: true,
    graft_mid_sten_yn: true,
    graft_dist_sten_yn: true,
    graft_total_occlusion_yn: true,
    cath_graft_segments_sts: [],
    graft_index: "some graft_index",
    graft_dist_anast_sten_yn: true,
    graft_dist_anast_prior_treated_dt: ~D[2010-04-17],
    graft_prox_sten_ffr: "some graft_prox_sten_ffr",
    cath_graft_conduit_type: "some cath_graft_conduit_type",
    graft_mid_sten_prior_treated_yn: true,
    graft_dist_sten_prior_treated_dt: ~D[2010-04-17],
    graft_mid_sten_device_present_yn: true,
    graft_prox_sten_ivus: "some graft_prox_sten_ivus",
    graft_ostial_sten_ivus: "some graft_ostial_sten_ivus",
    graft_prox_sten_prior_treated_dt: ~D[2010-04-17]
  }
  @update_attrs %{
    graft_mid_sten_pct: "some updated graft_mid_sten_pct",
    graft_dist_sten_pct: "some updated graft_dist_sten_pct",
    graft_dist_anast_sten_ivus: "some updated graft_dist_anast_sten_ivus",
    graft_prox_sten_prior_treated_yn: false,
    cath_graft_segments_cdisc: [],
    graft_mid_sten_ivus: "some updated graft_mid_sten_ivus",
    graft_notes: "some updated graft_notes",
    graft_prox_sten_pct: "some updated graft_prox_sten_pct",
    graft_dist_anast_sten_pct: "some updated graft_dist_anast_sten_pct",
    graft_ostial_device_present_yn: false,
    cath_graft_segments_main_vessel: "some updated cath_graft_segments_main_vessel",
    graft_sten_yn: false,
    graft_dist_anast_device_present_yn: false,
    cath_graft_segments_ncdr: [],
    graft_ostial_sten_yn: false,
    patient_id: 43,
    graft_dist_anast_prior_treated_yn: false,
    cath_graft_prox_site: "some updated cath_graft_prox_site",
    graft_ostial_sten_pct: "some updated graft_ostial_sten_pct",
    graft_prox_sten_device_present_yn: false,
    graft_mid_sten_prior_treated_dt: ~D[2011-05-18],
    graft_ostial_prior_treated_yn: false,
    graft_dist_sten_device_present_yn: false,
    graft_dist_sten_prior_treated_yn: false,
    graft_ostial_prior_treated_dt: ~D[2011-05-18],
    graft_dist_anast_type: "some updated graft_dist_anast_type",
    graft_dist_sten_ffr: "some updated graft_dist_sten_ffr",
    graft_dist_anast_sten_ffr: "some updated graft_dist_anast_sten_ffr",
    cath_graft_header: "some updated cath_graft_header",
    graft_mid_sten_ffr: "some updated graft_mid_sten_ffr",
    graft_morphology: "some updated graft_morphology",
    graft_dist_sten_ivus: "some updated graft_dist_sten_ivus",
    graft_ostial_sten_ffr: "some updated graft_ostial_sten_ffr",
    graft_prox_sten_yn: false,
    graft_mid_sten_yn: false,
    graft_dist_sten_yn: false,
    graft_total_occlusion_yn: false,
    cath_graft_segments_sts: [],
    graft_index: "some updated graft_index",
    graft_dist_anast_sten_yn: false,
    graft_dist_anast_prior_treated_dt: ~D[2011-05-18],
    graft_prox_sten_ffr: "some updated graft_prox_sten_ffr",
    cath_graft_conduit_type: "some updated cath_graft_conduit_type",
    graft_mid_sten_prior_treated_yn: false,
    graft_dist_sten_prior_treated_dt: ~D[2011-05-18],
    graft_mid_sten_device_present_yn: false,
    graft_prox_sten_ivus: "some updated graft_prox_sten_ivus",
    graft_ostial_sten_ivus: "some updated graft_ostial_sten_ivus",
    graft_prox_sten_prior_treated_dt: ~D[2011-05-18]
  }
  @invalid_attrs %{
    graft_mid_sten_pct: nil,
    graft_dist_sten_pct: nil,
    graft_dist_anast_sten_ivus: nil,
    graft_prox_sten_prior_treated_yn: nil,
    cath_graft_segments_cdisc: nil,
    graft_mid_sten_ivus: nil,
    graft_notes: nil,
    graft_prox_sten_pct: nil,
    graft_dist_anast_sten_pct: nil,
    graft_ostial_device_present_yn: nil,
    cath_graft_segments_main_vessel: nil,
    graft_sten_yn: nil,
    graft_dist_anast_device_present_yn: nil,
    cath_graft_segments_ncdr: nil,
    graft_ostial_sten_yn: nil,
    patient_id: nil,
    graft_dist_anast_prior_treated_yn: nil,
    cath_graft_prox_site: nil,
    graft_ostial_sten_pct: nil,
    graft_prox_sten_device_present_yn: nil,
    graft_mid_sten_prior_treated_dt: nil,
    graft_ostial_prior_treated_yn: nil,
    graft_dist_sten_device_present_yn: nil,
    graft_dist_sten_prior_treated_yn: nil,
    graft_ostial_prior_treated_dt: nil,
    graft_dist_anast_type: nil,
    graft_dist_sten_ffr: nil,
    graft_dist_anast_sten_ffr: nil,
    cath_graft_header: nil,
    graft_mid_sten_ffr: nil,
    graft_morphology: nil,
    graft_dist_sten_ivus: nil,
    graft_ostial_sten_ffr: nil,
    graft_prox_sten_yn: nil,
    graft_mid_sten_yn: nil,
    graft_dist_sten_yn: nil,
    graft_total_occlusion_yn: nil,
    cath_graft_segments_sts: nil,
    graft_index: nil,
    graft_dist_anast_sten_yn: nil,
    graft_dist_anast_prior_treated_dt: nil,
    graft_prox_sten_ffr: nil,
    cath_graft_conduit_type: nil,
    graft_mid_sten_prior_treated_yn: nil,
    graft_dist_sten_prior_treated_dt: nil,
    graft_mid_sten_device_present_yn: nil,
    graft_prox_sten_ivus: nil,
    graft_ostial_sten_ivus: nil,
    graft_prox_sten_prior_treated_dt: nil
  }

  def fixture(:cath_graft) do
    {:ok, cath_graft} = Caths.create_cath_graft(@create_attrs)
    cath_graft
  end

  describe "index" do
    test "lists all cath_graft", %{conn: conn} do
      conn = get(conn, Routes.cath_graft_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath graft"
    end
  end

  describe "new cath_graft" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_graft_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath graft"
    end
  end

  describe "create cath_graft" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_graft_path(conn, :create), cath_graft: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_graft_path(conn, :show, id)

      conn = get(conn, Routes.cath_graft_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath graft"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_graft_path(conn, :create), cath_graft: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath graft"
    end
  end

  describe "edit cath_graft" do
    setup [:create_cath_graft]

    test "renders form for editing chosen cath_graft", %{conn: conn, cath_graft: cath_graft} do
      conn = get(conn, Routes.cath_graft_path(conn, :edit, cath_graft))
      assert html_response(conn, 200) =~ "Edit Cath graft"
    end
  end

  describe "update cath_graft" do
    setup [:create_cath_graft]

    test "redirects when data is valid", %{conn: conn, cath_graft: cath_graft} do
      conn =
        put(conn, Routes.cath_graft_path(conn, :update, cath_graft), cath_graft: @update_attrs)

      assert redirected_to(conn) == Routes.cath_graft_path(conn, :show, cath_graft)

      conn = get(conn, Routes.cath_graft_path(conn, :show, cath_graft))
      assert html_response(conn, 200) =~ "some updated graft_mid_sten_pct"
    end

    test "renders errors when data is invalid", %{conn: conn, cath_graft: cath_graft} do
      conn =
        put(conn, Routes.cath_graft_path(conn, :update, cath_graft), cath_graft: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Cath graft"
    end
  end

  describe "delete cath_graft" do
    setup [:create_cath_graft]

    test "deletes chosen cath_graft", %{conn: conn, cath_graft: cath_graft} do
      conn = delete(conn, Routes.cath_graft_path(conn, :delete, cath_graft))
      assert redirected_to(conn) == Routes.cath_graft_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cath_graft_path(conn, :show, cath_graft))
      end)
    end
  end

  defp create_cath_graft(_) do
    cath_graft = fixture(:cath_graft)
    {:ok, cath_graft: cath_graft}
  end
end
