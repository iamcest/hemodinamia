defmodule AngioWeb.Echo_ventricle_left_systolic_funcControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{elvsf_cardiac_index: "some elvsf_cardiac_index", elvsf_cardiac_output_method: "some elvsf_cardiac_output_method", elvsf_cardiac_output_val: "some elvsf_cardiac_output_val", elvsf_dyssynchrony: "some elvsf_dyssynchrony", elvsf_ejection: "some elvsf_ejection", elvsf_ejection_fraction_calculated: "some elvsf_ejection_fraction_calculated", elvsf_ejection_fraction_desc: "some elvsf_ejection_fraction_desc", elvsf_fractional_shortening_desc: "some elvsf_fractional_shortening_desc", elvsf_fractional_shortening_method: "some elvsf_fractional_shortening_method", elvsf_fractional_shortening_val: "some elvsf_fractional_shortening_val", elvsf_global_long_strain: "some elvsf_global_long_strain", elvsf_is_normal_yn: true, elvsf_lvot_area_val: "some elvsf_lvot_area_val", elvsf_lvot_diameter_val: "some elvsf_lvot_diameter_val", elvsf_lvot_peak_velocity_val: "some elvsf_lvot_peak_velocity_val", elvsf_lvot_vti_val: "some elvsf_lvot_vti_val", elvsf_mean_dp_dt: "some elvsf_mean_dp_dt", elvsf_measurment_dt: "some elvsf_measurment_dt", elvsf_notes: "some elvsf_notes", elvsf_peak_dp_dt: "some elvsf_peak_dp_dt", elvsf_pulsed_tissue_doppler_s: "some elvsf_pulsed_tissue_doppler_s", elvsf_stroke_distance: "some elvsf_stroke_distance", elvsf_stroke_volume_doppler: "some elvsf_stroke_volume_doppler", elvsf_stroke_volume_method: "some elvsf_stroke_volume_method", elvsf_stroke_volume_valumetric: "some elvsf_stroke_volume_valumetric", elvsf_stroke_work_index: "some elvsf_stroke_work_index", elvsf_stroke_work_val: "some elvsf_stroke_work_val", elvsf_systolic_function_desc: "some elvsf_systolic_function_desc", elvsf_tei_index: "some elvsf_tei_index", elvsf_vti_a_wave_us_val: "some elvsf_vti_a_wave_us_val", elvsf_vti_e_wave_us_val: "some elvsf_vti_e_wave_us_val", elvsf_wall_seg_doppler_val: "some elvsf_wall_seg_doppler_val"}
  @update_attrs %{elvsf_cardiac_index: "some updated elvsf_cardiac_index", elvsf_cardiac_output_method: "some updated elvsf_cardiac_output_method", elvsf_cardiac_output_val: "some updated elvsf_cardiac_output_val", elvsf_dyssynchrony: "some updated elvsf_dyssynchrony", elvsf_ejection: "some updated elvsf_ejection", elvsf_ejection_fraction_calculated: "some updated elvsf_ejection_fraction_calculated", elvsf_ejection_fraction_desc: "some updated elvsf_ejection_fraction_desc", elvsf_fractional_shortening_desc: "some updated elvsf_fractional_shortening_desc", elvsf_fractional_shortening_method: "some updated elvsf_fractional_shortening_method", elvsf_fractional_shortening_val: "some updated elvsf_fractional_shortening_val", elvsf_global_long_strain: "some updated elvsf_global_long_strain", elvsf_is_normal_yn: false, elvsf_lvot_area_val: "some updated elvsf_lvot_area_val", elvsf_lvot_diameter_val: "some updated elvsf_lvot_diameter_val", elvsf_lvot_peak_velocity_val: "some updated elvsf_lvot_peak_velocity_val", elvsf_lvot_vti_val: "some updated elvsf_lvot_vti_val", elvsf_mean_dp_dt: "some updated elvsf_mean_dp_dt", elvsf_measurment_dt: "some updated elvsf_measurment_dt", elvsf_notes: "some updated elvsf_notes", elvsf_peak_dp_dt: "some updated elvsf_peak_dp_dt", elvsf_pulsed_tissue_doppler_s: "some updated elvsf_pulsed_tissue_doppler_s", elvsf_stroke_distance: "some updated elvsf_stroke_distance", elvsf_stroke_volume_doppler: "some updated elvsf_stroke_volume_doppler", elvsf_stroke_volume_method: "some updated elvsf_stroke_volume_method", elvsf_stroke_volume_valumetric: "some updated elvsf_stroke_volume_valumetric", elvsf_stroke_work_index: "some updated elvsf_stroke_work_index", elvsf_stroke_work_val: "some updated elvsf_stroke_work_val", elvsf_systolic_function_desc: "some updated elvsf_systolic_function_desc", elvsf_tei_index: "some updated elvsf_tei_index", elvsf_vti_a_wave_us_val: "some updated elvsf_vti_a_wave_us_val", elvsf_vti_e_wave_us_val: "some updated elvsf_vti_e_wave_us_val", elvsf_wall_seg_doppler_val: "some updated elvsf_wall_seg_doppler_val"}
  @invalid_attrs %{elvsf_cardiac_index: nil, elvsf_cardiac_output_method: nil, elvsf_cardiac_output_val: nil, elvsf_dyssynchrony: nil, elvsf_ejection: nil, elvsf_ejection_fraction_calculated: nil, elvsf_ejection_fraction_desc: nil, elvsf_fractional_shortening_desc: nil, elvsf_fractional_shortening_method: nil, elvsf_fractional_shortening_val: nil, elvsf_global_long_strain: nil, elvsf_is_normal_yn: nil, elvsf_lvot_area_val: nil, elvsf_lvot_diameter_val: nil, elvsf_lvot_peak_velocity_val: nil, elvsf_lvot_vti_val: nil, elvsf_mean_dp_dt: nil, elvsf_measurment_dt: nil, elvsf_notes: nil, elvsf_peak_dp_dt: nil, elvsf_pulsed_tissue_doppler_s: nil, elvsf_stroke_distance: nil, elvsf_stroke_volume_doppler: nil, elvsf_stroke_volume_method: nil, elvsf_stroke_volume_valumetric: nil, elvsf_stroke_work_index: nil, elvsf_stroke_work_val: nil, elvsf_systolic_function_desc: nil, elvsf_tei_index: nil, elvsf_vti_a_wave_us_val: nil, elvsf_vti_e_wave_us_val: nil, elvsf_wall_seg_doppler_val: nil}

  def fixture(:echo_ventricle_left_systolic_func) do
    {:ok, echo_ventricle_left_systolic_func} = Ivestigations.create_echo_ventricle_left_systolic_func(@create_attrs)
    echo_ventricle_left_systolic_func
  end

  describe "index" do
    test "lists all echo_ventricle_left_systolic_funcs", %{conn: conn} do
      conn = get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Echo ventricle left systolic funcs"
    end
  end

  describe "new echo_ventricle_left_systolic_func" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :new))
      assert html_response(conn, 200) =~ "New Echo ventricle left systolic func"
    end
  end

  describe "create echo_ventricle_left_systolic_func" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :create), echo_ventricle_left_systolic_func: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.echo_ventricle_left_systolic_func_path(conn, :show, id)

      conn = get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Echo ventricle left systolic func"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :create), echo_ventricle_left_systolic_func: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Echo ventricle left systolic func"
    end
  end

  describe "edit echo_ventricle_left_systolic_func" do
    setup [:create_echo_ventricle_left_systolic_func]

    test "renders form for editing chosen echo_ventricle_left_systolic_func", %{conn: conn, echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func} do
      conn = get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :edit, echo_ventricle_left_systolic_func))
      assert html_response(conn, 200) =~ "Edit Echo ventricle left systolic func"
    end
  end

  describe "update echo_ventricle_left_systolic_func" do
    setup [:create_echo_ventricle_left_systolic_func]

    test "redirects when data is valid", %{conn: conn, echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func} do
      conn = put(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :update, echo_ventricle_left_systolic_func), echo_ventricle_left_systolic_func: @update_attrs)
      assert redirected_to(conn) == Routes.echo_ventricle_left_systolic_func_path(conn, :show, echo_ventricle_left_systolic_func)

      conn = get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :show, echo_ventricle_left_systolic_func))
      assert html_response(conn, 200) =~ "some updated elvsf_cardiac_index"
    end

    test "renders errors when data is invalid", %{conn: conn, echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func} do
      conn = put(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :update, echo_ventricle_left_systolic_func), echo_ventricle_left_systolic_func: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Echo ventricle left systolic func"
    end
  end

  describe "delete echo_ventricle_left_systolic_func" do
    setup [:create_echo_ventricle_left_systolic_func]

    test "deletes chosen echo_ventricle_left_systolic_func", %{conn: conn, echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func} do
      conn = delete(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :delete, echo_ventricle_left_systolic_func))
      assert redirected_to(conn) == Routes.echo_ventricle_left_systolic_func_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.echo_ventricle_left_systolic_func_path(conn, :show, echo_ventricle_left_systolic_func))
      end
    end
  end

  defp create_echo_ventricle_left_systolic_func(_) do
    echo_ventricle_left_systolic_func = fixture(:echo_ventricle_left_systolic_func)
    {:ok, echo_ventricle_left_systolic_func: echo_ventricle_left_systolic_func}
  end
end
