defmodule AngioWeb.Coarc_procedureControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{"": "some ", coarc_ao_obstruction_post_sys_gradient: "some coarc_ao_obstruction_post_sys_gradient", coarc_ao_obstruction_pre_sys_gradient: "some coarc_ao_obstruction_pre_sys_gradient", coarc_aortic_obstruction_yn: true, coarc_arch_treated_yn: true, coarc_asdcl_operator_fname: "some coarc_asdcl_operator_fname", coarc_asdcl_operator_mname: "some coarc_asdcl_operator_mname", coarc_asdcl_operator_npi: "some coarc_asdcl_operator_npi", coarc_dt: ~D[2010-04-17], coarc_min_diam_post_proc: "some coarc_min_diam_post_proc", coarc_min_diam_pre_proc: "some coarc_min_diam_pre_proc", coarc_nature: "some coarc_nature", coarc_nature_post_prior_treatment: "some coarc_nature_post_prior_treatment", "coarc_notes,": "some coarc_notes,", coarc_operator_lname: "some coarc_operator_lname", coarc_peak_sys_gradient_post: "some coarc_peak_sys_gradient_post", coarc_peak_sys_gradient_pre: "some coarc_peak_sys_gradient_pre", coarc_primary_indication: "some coarc_primary_indication", coarc_tm: ~T[14:00:00]}
  @update_attrs %{"": "some updated ", coarc_ao_obstruction_post_sys_gradient: "some updated coarc_ao_obstruction_post_sys_gradient", coarc_ao_obstruction_pre_sys_gradient: "some updated coarc_ao_obstruction_pre_sys_gradient", coarc_aortic_obstruction_yn: false, coarc_arch_treated_yn: false, coarc_asdcl_operator_fname: "some updated coarc_asdcl_operator_fname", coarc_asdcl_operator_mname: "some updated coarc_asdcl_operator_mname", coarc_asdcl_operator_npi: "some updated coarc_asdcl_operator_npi", coarc_dt: ~D[2011-05-18], coarc_min_diam_post_proc: "some updated coarc_min_diam_post_proc", coarc_min_diam_pre_proc: "some updated coarc_min_diam_pre_proc", coarc_nature: "some updated coarc_nature", coarc_nature_post_prior_treatment: "some updated coarc_nature_post_prior_treatment", "coarc_notes,": "some updated coarc_notes,", coarc_operator_lname: "some updated coarc_operator_lname", coarc_peak_sys_gradient_post: "some updated coarc_peak_sys_gradient_post", coarc_peak_sys_gradient_pre: "some updated coarc_peak_sys_gradient_pre", coarc_primary_indication: "some updated coarc_primary_indication", coarc_tm: ~T[15:01:01]}
  @invalid_attrs %{"": nil, coarc_ao_obstruction_post_sys_gradient: nil, coarc_ao_obstruction_pre_sys_gradient: nil, coarc_aortic_obstruction_yn: nil, coarc_arch_treated_yn: nil, coarc_asdcl_operator_fname: nil, coarc_asdcl_operator_mname: nil, coarc_asdcl_operator_npi: nil, coarc_dt: nil, coarc_min_diam_post_proc: nil, coarc_min_diam_pre_proc: nil, coarc_nature: nil, coarc_nature_post_prior_treatment: nil, "coarc_notes,": nil, coarc_operator_lname: nil, coarc_peak_sys_gradient_post: nil, coarc_peak_sys_gradient_pre: nil, coarc_primary_indication: nil, coarc_tm: nil}

  def fixture(:coarc_procedure) do
    {:ok, coarc_procedure} = Interventions.create_coarc_procedure(@create_attrs)
    coarc_procedure
  end

  describe "index" do
    test "lists all coarc_procedures", %{conn: conn} do
      conn = get(conn, Routes.coarc_procedure_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Coarc procedures"
    end
  end

  describe "new coarc_procedure" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.coarc_procedure_path(conn, :new))
      assert html_response(conn, 200) =~ "New Coarc procedure"
    end
  end

  describe "create coarc_procedure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.coarc_procedure_path(conn, :create), coarc_procedure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.coarc_procedure_path(conn, :show, id)

      conn = get(conn, Routes.coarc_procedure_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Coarc procedure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.coarc_procedure_path(conn, :create), coarc_procedure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Coarc procedure"
    end
  end

  describe "edit coarc_procedure" do
    setup [:create_coarc_procedure]

    test "renders form for editing chosen coarc_procedure", %{conn: conn, coarc_procedure: coarc_procedure} do
      conn = get(conn, Routes.coarc_procedure_path(conn, :edit, coarc_procedure))
      assert html_response(conn, 200) =~ "Edit Coarc procedure"
    end
  end

  describe "update coarc_procedure" do
    setup [:create_coarc_procedure]

    test "redirects when data is valid", %{conn: conn, coarc_procedure: coarc_procedure} do
      conn = put(conn, Routes.coarc_procedure_path(conn, :update, coarc_procedure), coarc_procedure: @update_attrs)
      assert redirected_to(conn) == Routes.coarc_procedure_path(conn, :show, coarc_procedure)

      conn = get(conn, Routes.coarc_procedure_path(conn, :show, coarc_procedure))
      assert html_response(conn, 200) =~ "some updated "
    end

    test "renders errors when data is invalid", %{conn: conn, coarc_procedure: coarc_procedure} do
      conn = put(conn, Routes.coarc_procedure_path(conn, :update, coarc_procedure), coarc_procedure: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Coarc procedure"
    end
  end

  describe "delete coarc_procedure" do
    setup [:create_coarc_procedure]

    test "deletes chosen coarc_procedure", %{conn: conn, coarc_procedure: coarc_procedure} do
      conn = delete(conn, Routes.coarc_procedure_path(conn, :delete, coarc_procedure))
      assert redirected_to(conn) == Routes.coarc_procedure_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.coarc_procedure_path(conn, :show, coarc_procedure))
      end
    end
  end

  defp create_coarc_procedure(_) do
    coarc_procedure = fixture(:coarc_procedure)
    {:ok, coarc_procedure: coarc_procedure}
  end
end
