defmodule AngioWeb.Tree_nativesControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Graphics

  @create_attrs %{
    rca_dom_draw: "some rca_dom_draw",
    stent_path: "some stent_path",
    vessel_group_aha: "some vessel_group_aha",
    is_variant: "some is_variant",
    vessel: "some vessel",
    size: "some size",
    is_anomaly: "some is_anomaly",
    device_id: "some device_id",
    prior_treated_date: "some prior_treated_date",
    lesion_id: "some lesion_id",
    lcx_dom_draw: "some lcx_dom_draw",
    graft_present: "some graft_present",
    stent_x: "some stent_x",
    cor_les_prior_treated_yn: "some cor_les_prior_treated_yn",
    lad_type_draw: "some lad_type_draw",
    course_malignant: "some course_malignant",
    vessel_id: "some vessel_id",
    cor_les_thrombus_yn: "some cor_les_thrombus_yn",
    cor_les_prior_stent_yn: "some cor_les_prior_stent_yn",
    cor_les_calcium_yn: "some cor_les_calcium_yn",
    cor_les_pct: "some cor_les_pct",
    balanced_dom_draw: "some balanced_dom_draw",
    graft_path: "some graft_path",
    lesion_x: "some lesion_x",
    vessel_group: "some vessel_group",
    cor_les_stent_pct: "some cor_les_stent_pct",
    description_name: "some description_name",
    add: "some add",
    stent_y: "some stent_y",
    graft_id: "some graft_id",
    cor_les_stent_ptc: "some cor_les_stent_ptc",
    irregularities_has: "some irregularities_has",
    course_benign: "some course_benign",
    lesion_path: "some lesion_path",
    lesion_y: "some lesion_y",
    lesion_present: "some lesion_present",
    cor_les_segments_cdisc: "some cor_les_segments_cdisc",
    graft_y: "some graft_y",
    graft_x: "some graft_x",
    collateral_points: "some collateral_points",
    device_present: "some device_present",
    default_draw: "some default_draw",
    path: "some path",
    visible: "some visible",
    aor_les_thrombus_yn: "some aor_les_thrombus_yn",
    seg_def: "some seg_def"
  }
  @update_attrs %{
    rca_dom_draw: "some updated rca_dom_draw",
    stent_path: "some updated stent_path",
    vessel_group_aha: "some updated vessel_group_aha",
    is_variant: "some updated is_variant",
    vessel: "some updated vessel",
    size: "some updated size",
    is_anomaly: "some updated is_anomaly",
    device_id: "some updated device_id",
    prior_treated_date: "some updated prior_treated_date",
    lesion_id: "some updated lesion_id",
    lcx_dom_draw: "some updated lcx_dom_draw",
    graft_present: "some updated graft_present",
    stent_x: "some updated stent_x",
    cor_les_prior_treated_yn: "some updated cor_les_prior_treated_yn",
    lad_type_draw: "some updated lad_type_draw",
    course_malignant: "some updated course_malignant",
    vessel_id: "some updated vessel_id",
    cor_les_thrombus_yn: "some updated cor_les_thrombus_yn",
    cor_les_prior_stent_yn: "some updated cor_les_prior_stent_yn",
    cor_les_calcium_yn: "some updated cor_les_calcium_yn",
    cor_les_pct: "some updated cor_les_pct",
    balanced_dom_draw: "some updated balanced_dom_draw",
    graft_path: "some updated graft_path",
    lesion_x: "some updated lesion_x",
    vessel_group: "some updated vessel_group",
    cor_les_stent_pct: "some updated cor_les_stent_pct",
    description_name: "some updated description_name",
    add: "some updated add",
    stent_y: "some updated stent_y",
    graft_id: "some updated graft_id",
    cor_les_stent_ptc: "some updated cor_les_stent_ptc",
    irregularities_has: "some updated irregularities_has",
    course_benign: "some updated course_benign",
    lesion_path: "some updated lesion_path",
    lesion_y: "some updated lesion_y",
    lesion_present: "some updated lesion_present",
    cor_les_segments_cdisc: "some updated cor_les_segments_cdisc",
    graft_y: "some updated graft_y",
    graft_x: "some updated graft_x",
    collateral_points: "some updated collateral_points",
    device_present: "some updated device_present",
    default_draw: "some updated default_draw",
    path: "some updated path",
    visible: "some updated visible",
    aor_les_thrombus_yn: "some updated aor_les_thrombus_yn",
    seg_def: "some updated seg_def"
  }
  @invalid_attrs %{
    rca_dom_draw: nil,
    stent_path: nil,
    vessel_group_aha: nil,
    is_variant: nil,
    vessel: nil,
    size: nil,
    is_anomaly: nil,
    device_id: nil,
    prior_treated_date: nil,
    lesion_id: nil,
    lcx_dom_draw: nil,
    graft_present: nil,
    stent_x: nil,
    cor_les_prior_treated_yn: nil,
    lad_type_draw: nil,
    course_malignant: nil,
    vessel_id: nil,
    cor_les_thrombus_yn: nil,
    cor_les_prior_stent_yn: nil,
    cor_les_calcium_yn: nil,
    cor_les_pct: nil,
    balanced_dom_draw: nil,
    graft_path: nil,
    lesion_x: nil,
    vessel_group: nil,
    cor_les_stent_pct: nil,
    description_name: nil,
    add: nil,
    stent_y: nil,
    graft_id: nil,
    cor_les_stent_ptc: nil,
    irregularities_has: nil,
    course_benign: nil,
    lesion_path: nil,
    lesion_y: nil,
    lesion_present: nil,
    cor_les_segments_cdisc: nil,
    graft_y: nil,
    graft_x: nil,
    collateral_points: nil,
    device_present: nil,
    default_draw: nil,
    path: nil,
    visible: nil,
    aor_les_thrombus_yn: nil,
    seg_def: nil
  }

  def fixture(:tree_natives) do
    {:ok, tree_natives} = Graphics.create_tree_natives(@create_attrs)
    tree_natives
  end

  describe "index" do
    test "lists all tree_native", %{conn: conn} do
      conn = get(conn, Routes.tree_natives_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tree native"
    end
  end

  describe "new tree_natives" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tree_natives_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tree natives"
    end
  end

  describe "create tree_natives" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tree_natives_path(conn, :create), tree_natives: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tree_natives_path(conn, :show, id)

      conn = get(conn, Routes.tree_natives_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tree natives"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tree_natives_path(conn, :create), tree_natives: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tree natives"
    end
  end

  describe "edit tree_natives" do
    setup [:create_tree_natives]

    test "renders form for editing chosen tree_natives", %{conn: conn, tree_natives: tree_natives} do
      conn = get(conn, Routes.tree_natives_path(conn, :edit, tree_natives))
      assert html_response(conn, 200) =~ "Edit Tree natives"
    end
  end

  describe "update tree_natives" do
    setup [:create_tree_natives]

    test "redirects when data is valid", %{conn: conn, tree_natives: tree_natives} do
      conn =
        put(conn, Routes.tree_natives_path(conn, :update, tree_natives),
          tree_natives: @update_attrs
        )

      assert redirected_to(conn) == Routes.tree_natives_path(conn, :show, tree_natives)

      conn = get(conn, Routes.tree_natives_path(conn, :show, tree_natives))
      assert html_response(conn, 200) =~ "some updated rca_dom_draw"
    end

    test "renders errors when data is invalid", %{conn: conn, tree_natives: tree_natives} do
      conn =
        put(conn, Routes.tree_natives_path(conn, :update, tree_natives),
          tree_natives: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Tree natives"
    end
  end

  describe "delete tree_natives" do
    setup [:create_tree_natives]

    test "deletes chosen tree_natives", %{conn: conn, tree_natives: tree_natives} do
      conn = delete(conn, Routes.tree_natives_path(conn, :delete, tree_natives))
      assert redirected_to(conn) == Routes.tree_natives_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.tree_natives_path(conn, :show, tree_natives))
      end)
    end
  end

  defp create_tree_natives(_) do
    tree_natives = fixture(:tree_natives)
    {:ok, tree_natives: tree_natives}
  end
end
