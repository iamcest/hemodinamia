defmodule AngioWeb.Echo_ventricle_leftControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{elv_wall_thick_normal_yn: true, elv_lvid_lves_na: true, elv_notes: "some elv_notes", elv_lv_shape_normal_yn: true, elv_concentric_hyper_yn: true, elv_lv_geometry_desc: "some elv_lv_geometry_desc", elv_lves_volume_val: "some elv_lves_volume_val", elv_thrombus_tumour_yn: true, elv_lved_volume_index: "some elv_lved_volume_index", elv_wall_thick_region: "some elv_wall_thick_region", elv_thrombus_tumour_loc: "some elv_thrombus_tumour_loc", elv_non_compaction_yn: true, elv_lves_volume_method: "some elv_lves_volume_method", elv_myocardial_mass_method: "some elv_myocardial_mass_method", elv_lv_appearance_other_text: "some elv_lv_appearance_other_text", elv_lvpw_thick_sys_val: "some elv_lvpw_thick_sys_val", elv_lved_overall_septal_thick_desc: "some elv_lved_overall_septal_thick_desc", elv_wall_thick_region_name: "some elv_wall_thick_region_name", elv_lved_inferior_lateral_septal_thick_val: "some elv_lved_inferior_lateral_septal_thick_val", elv_wall_thick_region_qualitative: "some elv_wall_thick_region_qualitative", elv_lvid_lves_val: "some elv_lvid_lves_val", elv_lvot_desc: "some elv_lvot_desc", elv_wall_thick_asym_hyper_desc: "some elv_wall_thick_asym_hyper_desc", elv_lved_cavity_size_desc: "some elv_lved_cavity_size_desc", elv_segment_17model: "some elv_segment_17model", elv_aneurism_shape_desc: "some elv_aneurism_shape_desc", elv_lvid_lved_val: "some elv_lvid_lved_val", elv_lvpw_thick_diast_val: "some elv_lvpw_thick_diast_val", elv_myocardial_mass_val: "some elv_myocardial_mass_val", elv_lv_appearance_desc: "some elv_lv_appearance_desc", elv_lvid_lved_na: true, elv_lves_volume_index: "some elv_lves_volume_index", elv_lved_volume_val: "some elv_lved_volume_val", elv_lves_septal_thick_val: "some elv_lves_septal_thick_val", elv_ste_radial_peak_strain: "some elv_ste_radial_peak_strain", elv_ste_circ_peak_strain: "some elv_ste_circ_peak_strain", elv_aneurism_pseudo_shape_desc: "some elv_aneurism_pseudo_shape_desc", elv_lved_volume_method: "some elv_lved_volume_method", elv_myocardial_mass_qualitative: "some elv_myocardial_mass_qualitative", elv_lved_septal_thick_val: "some elv_lved_septal_thick_val"}
  @update_attrs %{elv_wall_thick_normal_yn: false, elv_lvid_lves_na: false, elv_notes: "some updated elv_notes", elv_lv_shape_normal_yn: false, elv_concentric_hyper_yn: false, elv_lv_geometry_desc: "some updated elv_lv_geometry_desc", elv_lves_volume_val: "some updated elv_lves_volume_val", elv_thrombus_tumour_yn: false, elv_lved_volume_index: "some updated elv_lved_volume_index", elv_wall_thick_region: "some updated elv_wall_thick_region", elv_thrombus_tumour_loc: "some updated elv_thrombus_tumour_loc", elv_non_compaction_yn: false, elv_lves_volume_method: "some updated elv_lves_volume_method", elv_myocardial_mass_method: "some updated elv_myocardial_mass_method", elv_lv_appearance_other_text: "some updated elv_lv_appearance_other_text", elv_lvpw_thick_sys_val: "some updated elv_lvpw_thick_sys_val", elv_lved_overall_septal_thick_desc: "some updated elv_lved_overall_septal_thick_desc", elv_wall_thick_region_name: "some updated elv_wall_thick_region_name", elv_lved_inferior_lateral_septal_thick_val: "some updated elv_lved_inferior_lateral_septal_thick_val", elv_wall_thick_region_qualitative: "some updated elv_wall_thick_region_qualitative", elv_lvid_lves_val: "some updated elv_lvid_lves_val", elv_lvot_desc: "some updated elv_lvot_desc", elv_wall_thick_asym_hyper_desc: "some updated elv_wall_thick_asym_hyper_desc", elv_lved_cavity_size_desc: "some updated elv_lved_cavity_size_desc", elv_segment_17model: "some updated elv_segment_17model", elv_aneurism_shape_desc: "some updated elv_aneurism_shape_desc", elv_lvid_lved_val: "some updated elv_lvid_lved_val", elv_lvpw_thick_diast_val: "some updated elv_lvpw_thick_diast_val", elv_myocardial_mass_val: "some updated elv_myocardial_mass_val", elv_lv_appearance_desc: "some updated elv_lv_appearance_desc", elv_lvid_lved_na: false, elv_lves_volume_index: "some updated elv_lves_volume_index", elv_lved_volume_val: "some updated elv_lved_volume_val", elv_lves_septal_thick_val: "some updated elv_lves_septal_thick_val", elv_ste_radial_peak_strain: "some updated elv_ste_radial_peak_strain", elv_ste_circ_peak_strain: "some updated elv_ste_circ_peak_strain", elv_aneurism_pseudo_shape_desc: "some updated elv_aneurism_pseudo_shape_desc", elv_lved_volume_method: "some updated elv_lved_volume_method", elv_myocardial_mass_qualitative: "some updated elv_myocardial_mass_qualitative", elv_lved_septal_thick_val: "some updated elv_lved_septal_thick_val"}
  @invalid_attrs %{elv_wall_thick_normal_yn: nil, elv_lvid_lves_na: nil, elv_notes: nil, elv_lv_shape_normal_yn: nil, elv_concentric_hyper_yn: nil, elv_lv_geometry_desc: nil, elv_lves_volume_val: nil, elv_thrombus_tumour_yn: nil, elv_lved_volume_index: nil, elv_wall_thick_region: nil, elv_thrombus_tumour_loc: nil, elv_non_compaction_yn: nil, elv_lves_volume_method: nil, elv_myocardial_mass_method: nil, elv_lv_appearance_other_text: nil, elv_lvpw_thick_sys_val: nil, elv_lved_overall_septal_thick_desc: nil, elv_wall_thick_region_name: nil, elv_lved_inferior_lateral_septal_thick_val: nil, elv_wall_thick_region_qualitative: nil, elv_lvid_lves_val: nil, elv_lvot_desc: nil, elv_wall_thick_asym_hyper_desc: nil, elv_lved_cavity_size_desc: nil, elv_segment_17model: nil, elv_aneurism_shape_desc: nil, elv_lvid_lved_val: nil, elv_lvpw_thick_diast_val: nil, elv_myocardial_mass_val: nil, elv_lv_appearance_desc: nil, elv_lvid_lved_na: nil, elv_lves_volume_index: nil, elv_lved_volume_val: nil, elv_lves_septal_thick_val: nil, elv_ste_radial_peak_strain: nil, elv_ste_circ_peak_strain: nil, elv_aneurism_pseudo_shape_desc: nil, elv_lved_volume_method: nil, elv_myocardial_mass_qualitative: nil, elv_lved_septal_thick_val: nil}

  def fixture(:echo_ventricle_left) do
    {:ok, echo_ventricle_left} = Ivestigations.create_echo_ventricle_left(@create_attrs)
    echo_ventricle_left
  end

  describe "index" do
    test "lists all echo_ventricle_lefts", %{conn: conn} do
      conn = get(conn, Routes.echo_ventricle_left_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Echo ventricle lefts"
    end
  end

  describe "new echo_ventricle_left" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.echo_ventricle_left_path(conn, :new))
      assert html_response(conn, 200) =~ "New Echo ventricle left"
    end
  end

  describe "create echo_ventricle_left" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.echo_ventricle_left_path(conn, :create), echo_ventricle_left: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.echo_ventricle_left_path(conn, :show, id)

      conn = get(conn, Routes.echo_ventricle_left_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Echo ventricle left"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.echo_ventricle_left_path(conn, :create), echo_ventricle_left: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Echo ventricle left"
    end
  end

  describe "edit echo_ventricle_left" do
    setup [:create_echo_ventricle_left]

    test "renders form for editing chosen echo_ventricle_left", %{conn: conn, echo_ventricle_left: echo_ventricle_left} do
      conn = get(conn, Routes.echo_ventricle_left_path(conn, :edit, echo_ventricle_left))
      assert html_response(conn, 200) =~ "Edit Echo ventricle left"
    end
  end

  describe "update echo_ventricle_left" do
    setup [:create_echo_ventricle_left]

    test "redirects when data is valid", %{conn: conn, echo_ventricle_left: echo_ventricle_left} do
      conn = put(conn, Routes.echo_ventricle_left_path(conn, :update, echo_ventricle_left), echo_ventricle_left: @update_attrs)
      assert redirected_to(conn) == Routes.echo_ventricle_left_path(conn, :show, echo_ventricle_left)

      conn = get(conn, Routes.echo_ventricle_left_path(conn, :show, echo_ventricle_left))
      assert html_response(conn, 200) =~ "some updated elv_notes"
    end

    test "renders errors when data is invalid", %{conn: conn, echo_ventricle_left: echo_ventricle_left} do
      conn = put(conn, Routes.echo_ventricle_left_path(conn, :update, echo_ventricle_left), echo_ventricle_left: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Echo ventricle left"
    end
  end

  describe "delete echo_ventricle_left" do
    setup [:create_echo_ventricle_left]

    test "deletes chosen echo_ventricle_left", %{conn: conn, echo_ventricle_left: echo_ventricle_left} do
      conn = delete(conn, Routes.echo_ventricle_left_path(conn, :delete, echo_ventricle_left))
      assert redirected_to(conn) == Routes.echo_ventricle_left_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.echo_ventricle_left_path(conn, :show, echo_ventricle_left))
      end
    end
  end

  defp create_echo_ventricle_left(_) do
    echo_ventricle_left = fixture(:echo_ventricle_left)
    {:ok, echo_ventricle_left: echo_ventricle_left}
  end
end
