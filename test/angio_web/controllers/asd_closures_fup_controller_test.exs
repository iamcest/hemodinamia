defmodule AngioWeb.Asd_closures_fupControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Followups

  @create_attrs %{asdclf_anti_platelet_yn: true, asdclf_arrhythmias_yn: true, asdclf_assessment_dt: ~D[2010-04-17], asdclf_embolization_yn: true, asdclf_erosion_yn: true, asdclf_frame_fracture_yn: true, asdclf_free_events_yn: true, asdclf_fup_status: "some asdclf_fup_status", asdclf_new_headaches_yn: true, asdclf_notes: "some asdclf_notes", asdclf_reintervention_closure_dt: ~D[2010-04-17], asdclf_reintervention_closure_yn: "some asdclf_reintervention_closure_yn", asdclf_residual_shunt_size: "some asdclf_residual_shunt_size", asdclf_retrivied_surgery_yn: true, asdclf_sbe_diagnosis_dt: ~D[2010-04-17], asdclf_sbe_factors: "some asdclf_sbe_factors", asdclf_sbe_treatment: "some asdclf_sbe_treatment", asdclf_sbe_yn: true, asdclf_start_dt: ~D[2010-04-17], asdclf_visit_status: "some asdclf_visit_status"}
  @update_attrs %{asdclf_anti_platelet_yn: false, asdclf_arrhythmias_yn: false, asdclf_assessment_dt: ~D[2011-05-18], asdclf_embolization_yn: false, asdclf_erosion_yn: false, asdclf_frame_fracture_yn: false, asdclf_free_events_yn: false, asdclf_fup_status: "some updated asdclf_fup_status", asdclf_new_headaches_yn: false, asdclf_notes: "some updated asdclf_notes", asdclf_reintervention_closure_dt: ~D[2011-05-18], asdclf_reintervention_closure_yn: "some updated asdclf_reintervention_closure_yn", asdclf_residual_shunt_size: "some updated asdclf_residual_shunt_size", asdclf_retrivied_surgery_yn: false, asdclf_sbe_diagnosis_dt: ~D[2011-05-18], asdclf_sbe_factors: "some updated asdclf_sbe_factors", asdclf_sbe_treatment: "some updated asdclf_sbe_treatment", asdclf_sbe_yn: false, asdclf_start_dt: ~D[2011-05-18], asdclf_visit_status: "some updated asdclf_visit_status"}
  @invalid_attrs %{asdclf_anti_platelet_yn: nil, asdclf_arrhythmias_yn: nil, asdclf_assessment_dt: nil, asdclf_embolization_yn: nil, asdclf_erosion_yn: nil, asdclf_frame_fracture_yn: nil, asdclf_free_events_yn: nil, asdclf_fup_status: nil, asdclf_new_headaches_yn: nil, asdclf_notes: nil, asdclf_reintervention_closure_dt: nil, asdclf_reintervention_closure_yn: nil, asdclf_residual_shunt_size: nil, asdclf_retrivied_surgery_yn: nil, asdclf_sbe_diagnosis_dt: nil, asdclf_sbe_factors: nil, asdclf_sbe_treatment: nil, asdclf_sbe_yn: nil, asdclf_start_dt: nil, asdclf_visit_status: nil}

  def fixture(:asd_closures_fup) do
    {:ok, asd_closures_fup} = Followups.create_asd_closures_fup(@create_attrs)
    asd_closures_fup
  end

  describe "index" do
    test "lists all asd_closures_fups", %{conn: conn} do
      conn = get(conn, Routes.asd_closures_fup_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Asd closures fups"
    end
  end

  describe "new asd_closures_fup" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.asd_closures_fup_path(conn, :new))
      assert html_response(conn, 200) =~ "New Asd closures fup"
    end
  end

  describe "create asd_closures_fup" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.asd_closures_fup_path(conn, :create), asd_closures_fup: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.asd_closures_fup_path(conn, :show, id)

      conn = get(conn, Routes.asd_closures_fup_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Asd closures fup"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.asd_closures_fup_path(conn, :create), asd_closures_fup: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Asd closures fup"
    end
  end

  describe "edit asd_closures_fup" do
    setup [:create_asd_closures_fup]

    test "renders form for editing chosen asd_closures_fup", %{conn: conn, asd_closures_fup: asd_closures_fup} do
      conn = get(conn, Routes.asd_closures_fup_path(conn, :edit, asd_closures_fup))
      assert html_response(conn, 200) =~ "Edit Asd closures fup"
    end
  end

  describe "update asd_closures_fup" do
    setup [:create_asd_closures_fup]

    test "redirects when data is valid", %{conn: conn, asd_closures_fup: asd_closures_fup} do
      conn = put(conn, Routes.asd_closures_fup_path(conn, :update, asd_closures_fup), asd_closures_fup: @update_attrs)
      assert redirected_to(conn) == Routes.asd_closures_fup_path(conn, :show, asd_closures_fup)

      conn = get(conn, Routes.asd_closures_fup_path(conn, :show, asd_closures_fup))
      assert html_response(conn, 200) =~ "some updated asdclf_fup_status"
    end

    test "renders errors when data is invalid", %{conn: conn, asd_closures_fup: asd_closures_fup} do
      conn = put(conn, Routes.asd_closures_fup_path(conn, :update, asd_closures_fup), asd_closures_fup: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Asd closures fup"
    end
  end

  describe "delete asd_closures_fup" do
    setup [:create_asd_closures_fup]

    test "deletes chosen asd_closures_fup", %{conn: conn, asd_closures_fup: asd_closures_fup} do
      conn = delete(conn, Routes.asd_closures_fup_path(conn, :delete, asd_closures_fup))
      assert redirected_to(conn) == Routes.asd_closures_fup_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.asd_closures_fup_path(conn, :show, asd_closures_fup))
      end
    end
  end

  defp create_asd_closures_fup(_) do
    asd_closures_fup = fixture(:asd_closures_fup)
    {:ok, asd_closures_fup: asd_closures_fup}
  end
end
