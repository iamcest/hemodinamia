defmodule AngioWeb.Asd_closureControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{"": "some ", asdcl_aortic_rim_length: "some asdcl_aortic_rim_length", asdcl_asd_size: "some asdcl_asd_size", asdcl_atria_septal_aneurysm_yn: "some asdcl_atria_septal_aneurysm_yn", asdcl_bal_sizing_perfomed_yn: true, asdcl_defect_counter_assoc: "some asdcl_defect_counter_assoc", asdcl_defect_not_treated: "some asdcl_defect_not_treated", asdcl_device_used_outcome: "some asdcl_device_used_outcome", asdcl_device_utilized_id: "some asdcl_device_utilized_id", asdcl_device_utilized_name: "some asdcl_device_utilized_name", asdcl_ivc_rim_length: "some asdcl_ivc_rim_length", asdcl_multi_fenestrated_yn: true, asdcl_notes: "some asdcl_notes", asdcl_operator_fname: "some asdcl_operator_fname", asdcl_operator_lname: "some asdcl_operator_lname", asdcl_operator_mname: "some asdcl_operator_mname", asdcl_operator_npi: "some asdcl_operator_npi", asdcl_primary_indication: "some asdcl_primary_indication", asdcl_residual_shunt_size: "some asdcl_residual_shunt_size", asdcl_rim_meas_performed_yn: true, "asdcl_stop_flow,": "some asdcl_stop_flow,", asdcl_stop_flow_performed_yn: true, asdcl_stretch_diam_perform_yn: true, asdcl_stretched_diam_size: "some asdcl_stretched_diam_size", asdcl_total_septal_length: "some asdcl_total_septal_length", asdcl_treat_attempted_yn: true}
  @update_attrs %{"": "some updated ", asdcl_aortic_rim_length: "some updated asdcl_aortic_rim_length", asdcl_asd_size: "some updated asdcl_asd_size", asdcl_atria_septal_aneurysm_yn: "some updated asdcl_atria_septal_aneurysm_yn", asdcl_bal_sizing_perfomed_yn: false, asdcl_defect_counter_assoc: "some updated asdcl_defect_counter_assoc", asdcl_defect_not_treated: "some updated asdcl_defect_not_treated", asdcl_device_used_outcome: "some updated asdcl_device_used_outcome", asdcl_device_utilized_id: "some updated asdcl_device_utilized_id", asdcl_device_utilized_name: "some updated asdcl_device_utilized_name", asdcl_ivc_rim_length: "some updated asdcl_ivc_rim_length", asdcl_multi_fenestrated_yn: false, asdcl_notes: "some updated asdcl_notes", asdcl_operator_fname: "some updated asdcl_operator_fname", asdcl_operator_lname: "some updated asdcl_operator_lname", asdcl_operator_mname: "some updated asdcl_operator_mname", asdcl_operator_npi: "some updated asdcl_operator_npi", asdcl_primary_indication: "some updated asdcl_primary_indication", asdcl_residual_shunt_size: "some updated asdcl_residual_shunt_size", asdcl_rim_meas_performed_yn: false, "asdcl_stop_flow,": "some updated asdcl_stop_flow,", asdcl_stop_flow_performed_yn: false, asdcl_stretch_diam_perform_yn: false, asdcl_stretched_diam_size: "some updated asdcl_stretched_diam_size", asdcl_total_septal_length: "some updated asdcl_total_septal_length", asdcl_treat_attempted_yn: false}
  @invalid_attrs %{"": nil, asdcl_aortic_rim_length: nil, asdcl_asd_size: nil, asdcl_atria_septal_aneurysm_yn: nil, asdcl_bal_sizing_perfomed_yn: nil, asdcl_defect_counter_assoc: nil, asdcl_defect_not_treated: nil, asdcl_device_used_outcome: nil, asdcl_device_utilized_id: nil, asdcl_device_utilized_name: nil, asdcl_ivc_rim_length: nil, asdcl_multi_fenestrated_yn: nil, asdcl_notes: nil, asdcl_operator_fname: nil, asdcl_operator_lname: nil, asdcl_operator_mname: nil, asdcl_operator_npi: nil, asdcl_primary_indication: nil, asdcl_residual_shunt_size: nil, asdcl_rim_meas_performed_yn: nil, "asdcl_stop_flow,": nil, asdcl_stop_flow_performed_yn: nil, asdcl_stretch_diam_perform_yn: nil, asdcl_stretched_diam_size: nil, asdcl_total_septal_length: nil, asdcl_treat_attempted_yn: nil}

  def fixture(:asd_closure) do
    {:ok, asd_closure} = Interventions.create_asd_closure(@create_attrs)
    asd_closure
  end

  describe "index" do
    test "lists all asd_closures", %{conn: conn} do
      conn = get(conn, Routes.asd_closure_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Asd closures"
    end
  end

  describe "new asd_closure" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.asd_closure_path(conn, :new))
      assert html_response(conn, 200) =~ "New Asd closure"
    end
  end

  describe "create asd_closure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.asd_closure_path(conn, :create), asd_closure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.asd_closure_path(conn, :show, id)

      conn = get(conn, Routes.asd_closure_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Asd closure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.asd_closure_path(conn, :create), asd_closure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Asd closure"
    end
  end

  describe "edit asd_closure" do
    setup [:create_asd_closure]

    test "renders form for editing chosen asd_closure", %{conn: conn, asd_closure: asd_closure} do
      conn = get(conn, Routes.asd_closure_path(conn, :edit, asd_closure))
      assert html_response(conn, 200) =~ "Edit Asd closure"
    end
  end

  describe "update asd_closure" do
    setup [:create_asd_closure]

    test "redirects when data is valid", %{conn: conn, asd_closure: asd_closure} do
      conn = put(conn, Routes.asd_closure_path(conn, :update, asd_closure), asd_closure: @update_attrs)
      assert redirected_to(conn) == Routes.asd_closure_path(conn, :show, asd_closure)

      conn = get(conn, Routes.asd_closure_path(conn, :show, asd_closure))
      assert html_response(conn, 200) =~ "some updated "
    end

    test "renders errors when data is invalid", %{conn: conn, asd_closure: asd_closure} do
      conn = put(conn, Routes.asd_closure_path(conn, :update, asd_closure), asd_closure: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Asd closure"
    end
  end

  describe "delete asd_closure" do
    setup [:create_asd_closure]

    test "deletes chosen asd_closure", %{conn: conn, asd_closure: asd_closure} do
      conn = delete(conn, Routes.asd_closure_path(conn, :delete, asd_closure))
      assert redirected_to(conn) == Routes.asd_closure_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.asd_closure_path(conn, :show, asd_closure))
      end
    end
  end

  defp create_asd_closure(_) do
    asd_closure = fixture(:asd_closure)
    {:ok, asd_closure: asd_closure}
  end
end
