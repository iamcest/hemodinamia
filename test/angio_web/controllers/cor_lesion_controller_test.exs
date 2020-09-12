defmodule AngioWeb.Cor_lesionControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    "": 42,
    "cor_les_aneurysm_yn,": "some cor_les_aneurysm_yn,",
    "cor_les_bifurcation_yn,": "some cor_les_bifurcation_yn,",
    "cor_les_calcium_yn,": "some cor_les_calcium_yn,",
    "cor_les_chronic_total_yn,": "some cor_les_chronic_total_yn,",
    "cor_les_counter,": "some cor_les_counter,",
    "cor_les_ffr,": "some cor_les_ffr,",
    "cor_les_graft_pct,": "some cor_les_graft_pct,",
    "cor_les_ivus,": "some cor_les_ivus,",
    "cor_les_length,": "some cor_les_length,",
    "cor_les_major_branch,": "some cor_les_major_branch,",
    "cor_les_ostial_loc,": "some cor_les_ostial_loc,",
    "cor_les_pct,": "some cor_les_pct,",
    "cor_les_prior_stent_yn,": "some cor_les_prior_stent_yn,",
    "cor_les_prior_treated_dt,": "some cor_les_prior_treated_dt,",
    "cor_les_prior_treated_other,": "some cor_les_prior_treated_other,",
    "cor_les_prior_treated_yn,": "some cor_les_prior_treated_yn,",
    "cor_les_protected_yn,": "some cor_les_protected_yn,",
    cor_les_seg_cdisc: [],
    cor_les_seg_ncdr: [],
    cor_les_seg_sts: [],
    "cor_les_stent_dt,": "some cor_les_stent_dt,",
    "cor_les_stent_pct,": "some cor_les_stent_pct,",
    "cor_les_tandem_yn,": "some cor_les_tandem_yn,",
    "cor_les_thrombus_yn,": "some cor_les_thrombus_yn,",
    "cor_les_type_aha,": "some cor_les_type_aha,",
    "cor_les_type_scai,": "some cor_les_type_scai,",
    "cor_les_vessel_size,": "some cor_les_vessel_size,",
    "info_coronary_id,": "some info_coronary_id,",
    "patient_id,": "some patient_id,"
  }
  @update_attrs %{
    "": 43,
    "cor_les_aneurysm_yn,": "some updated cor_les_aneurysm_yn,",
    "cor_les_bifurcation_yn,": "some updated cor_les_bifurcation_yn,",
    "cor_les_calcium_yn,": "some updated cor_les_calcium_yn,",
    "cor_les_chronic_total_yn,": "some updated cor_les_chronic_total_yn,",
    "cor_les_counter,": "some updated cor_les_counter,",
    "cor_les_ffr,": "some updated cor_les_ffr,",
    "cor_les_graft_pct,": "some updated cor_les_graft_pct,",
    "cor_les_ivus,": "some updated cor_les_ivus,",
    "cor_les_length,": "some updated cor_les_length,",
    "cor_les_major_branch,": "some updated cor_les_major_branch,",
    "cor_les_ostial_loc,": "some updated cor_les_ostial_loc,",
    "cor_les_pct,": "some updated cor_les_pct,",
    "cor_les_prior_stent_yn,": "some updated cor_les_prior_stent_yn,",
    "cor_les_prior_treated_dt,": "some updated cor_les_prior_treated_dt,",
    "cor_les_prior_treated_other,": "some updated cor_les_prior_treated_other,",
    "cor_les_prior_treated_yn,": "some updated cor_les_prior_treated_yn,",
    "cor_les_protected_yn,": "some updated cor_les_protected_yn,",
    cor_les_seg_cdisc: [],
    cor_les_seg_ncdr: [],
    cor_les_seg_sts: [],
    "cor_les_stent_dt,": "some updated cor_les_stent_dt,",
    "cor_les_stent_pct,": "some updated cor_les_stent_pct,",
    "cor_les_tandem_yn,": "some updated cor_les_tandem_yn,",
    "cor_les_thrombus_yn,": "some updated cor_les_thrombus_yn,",
    "cor_les_type_aha,": "some updated cor_les_type_aha,",
    "cor_les_type_scai,": "some updated cor_les_type_scai,",
    "cor_les_vessel_size,": "some updated cor_les_vessel_size,",
    "info_coronary_id,": "some updated info_coronary_id,",
    "patient_id,": "some updated patient_id,"
  }
  @invalid_attrs %{
    "": nil,
    "cor_les_aneurysm_yn,": nil,
    "cor_les_bifurcation_yn,": nil,
    "cor_les_calcium_yn,": nil,
    "cor_les_chronic_total_yn,": nil,
    "cor_les_counter,": nil,
    "cor_les_ffr,": nil,
    "cor_les_graft_pct,": nil,
    "cor_les_ivus,": nil,
    "cor_les_length,": nil,
    "cor_les_major_branch,": nil,
    "cor_les_ostial_loc,": nil,
    "cor_les_pct,": nil,
    "cor_les_prior_stent_yn,": nil,
    "cor_les_prior_treated_dt,": nil,
    "cor_les_prior_treated_other,": nil,
    "cor_les_prior_treated_yn,": nil,
    "cor_les_protected_yn,": nil,
    cor_les_seg_cdisc: nil,
    cor_les_seg_ncdr: nil,
    cor_les_seg_sts: nil,
    "cor_les_stent_dt,": nil,
    "cor_les_stent_pct,": nil,
    "cor_les_tandem_yn,": nil,
    "cor_les_thrombus_yn,": nil,
    "cor_les_type_aha,": nil,
    "cor_les_type_scai,": nil,
    "cor_les_vessel_size,": nil,
    "info_coronary_id,": nil,
    "patient_id,": nil
  }

  def fixture(:cor_lesion) do
    {:ok, cor_lesion} = Caths.create_cor_lesion(@create_attrs)
    cor_lesion
  end

  describe "index" do
    test "lists all cor_lesions", %{conn: conn} do
      conn = get(conn, Routes.cor_lesion_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cor lesions"
    end
  end

  describe "new cor_lesion" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cor_lesion_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cor lesion"
    end
  end

  describe "create cor_lesion" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cor_lesion_path(conn, :create), cor_lesion: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cor_lesion_path(conn, :show, id)

      conn = get(conn, Routes.cor_lesion_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cor lesion"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cor_lesion_path(conn, :create), cor_lesion: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cor lesion"
    end
  end

  describe "edit cor_lesion" do
    setup [:create_cor_lesion]

    test "renders form for editing chosen cor_lesion", %{conn: conn, cor_lesion: cor_lesion} do
      conn = get(conn, Routes.cor_lesion_path(conn, :edit, cor_lesion))
      assert html_response(conn, 200) =~ "Edit Cor lesion"
    end
  end

  describe "update cor_lesion" do
    setup [:create_cor_lesion]

    test "redirects when data is valid", %{conn: conn, cor_lesion: cor_lesion} do
      conn =
        put(conn, Routes.cor_lesion_path(conn, :update, cor_lesion), cor_lesion: @update_attrs)

      assert redirected_to(conn) == Routes.cor_lesion_path(conn, :show, cor_lesion)

      conn = get(conn, Routes.cor_lesion_path(conn, :show, cor_lesion))
      assert html_response(conn, 200) =~ "some updated cor_les_aneurysm_yn,"
    end

    test "renders errors when data is invalid", %{conn: conn, cor_lesion: cor_lesion} do
      conn =
        put(conn, Routes.cor_lesion_path(conn, :update, cor_lesion), cor_lesion: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Cor lesion"
    end
  end

  describe "delete cor_lesion" do
    setup [:create_cor_lesion]

    test "deletes chosen cor_lesion", %{conn: conn, cor_lesion: cor_lesion} do
      conn = delete(conn, Routes.cor_lesion_path(conn, :delete, cor_lesion))
      assert redirected_to(conn) == Routes.cor_lesion_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cor_lesion_path(conn, :show, cor_lesion))
      end)
    end
  end

  defp create_cor_lesion(_) do
    cor_lesion = fixture(:cor_lesion)
    {:ok, cor_lesion: cor_lesion}
  end
end
