defmodule AngioWeb.LventricleControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    cath_lv_ef_method: "some cath_lv_ef_method",
    cath_lv_ef_val: "some cath_lv_ef_val",
    cath_lv_heart_rate: "some cath_lv_heart_rate",
    cath_lv_lao_apical_septal: "some cath_lv_lao_apical_septal",
    cath_lv_lao_basal_septal: "some cath_lv_lao_basal_septal",
    cath_lv_lao_inf_lat: "some cath_lv_lao_inf_lat",
    cath_lv_lao_post_lat: "some cath_lv_lao_post_lat",
    cath_lv_lao_super_lat: "some cath_lv_lao_super_lat",
    cath_lv_lv_pres_end_dias: "some cath_lv_lv_pres_end_dias",
    cath_lv_lv_pres_sys: "some cath_lv_lv_pres_sys",
    cath_lv_mvr: "some cath_lv_mvr",
    cath_lv_normal_yn: true,
    cath_lv_rao_antero_basal: "some cath_lv_rao_antero_basal",
    cath_lv_rao_antero_lat: "some cath_lv_rao_antero_lat",
    cath_lv_rao_apical: "some cath_lv_rao_apical",
    cath_lv_rao_diaphragmatic: "some cath_lv_rao_diaphragmatic",
    cath_lv_rao_post_basal: "some cath_lv_rao_post_basal",
    cath_lv_wall_seg_func: "some cath_lv_wall_seg_func"
  }
  @update_attrs %{
    cath_lv_ef_method: "some updated cath_lv_ef_method",
    cath_lv_ef_val: "some updated cath_lv_ef_val",
    cath_lv_heart_rate: "some updated cath_lv_heart_rate",
    cath_lv_lao_apical_septal: "some updated cath_lv_lao_apical_septal",
    cath_lv_lao_basal_septal: "some updated cath_lv_lao_basal_septal",
    cath_lv_lao_inf_lat: "some updated cath_lv_lao_inf_lat",
    cath_lv_lao_post_lat: "some updated cath_lv_lao_post_lat",
    cath_lv_lao_super_lat: "some updated cath_lv_lao_super_lat",
    cath_lv_lv_pres_end_dias: "some updated cath_lv_lv_pres_end_dias",
    cath_lv_lv_pres_sys: "some updated cath_lv_lv_pres_sys",
    cath_lv_mvr: "some updated cath_lv_mvr",
    cath_lv_normal_yn: false,
    cath_lv_rao_antero_basal: "some updated cath_lv_rao_antero_basal",
    cath_lv_rao_antero_lat: "some updated cath_lv_rao_antero_lat",
    cath_lv_rao_apical: "some updated cath_lv_rao_apical",
    cath_lv_rao_diaphragmatic: "some updated cath_lv_rao_diaphragmatic",
    cath_lv_rao_post_basal: "some updated cath_lv_rao_post_basal",
    cath_lv_wall_seg_func: "some updated cath_lv_wall_seg_func"
  }
  @invalid_attrs %{
    cath_lv_ef_method: nil,
    cath_lv_ef_val: nil,
    cath_lv_heart_rate: nil,
    cath_lv_lao_apical_septal: nil,
    cath_lv_lao_basal_septal: nil,
    cath_lv_lao_inf_lat: nil,
    cath_lv_lao_post_lat: nil,
    cath_lv_lao_super_lat: nil,
    cath_lv_lv_pres_end_dias: nil,
    cath_lv_lv_pres_sys: nil,
    cath_lv_mvr: nil,
    cath_lv_normal_yn: nil,
    cath_lv_rao_antero_basal: nil,
    cath_lv_rao_antero_lat: nil,
    cath_lv_rao_apical: nil,
    cath_lv_rao_diaphragmatic: nil,
    cath_lv_rao_post_basal: nil,
    cath_lv_wall_seg_func: nil
  }

  def fixture(:lventricle) do
    {:ok, lventricle} = Caths.create_lventricle(@create_attrs)
    lventricle
  end

  describe "index" do
    test "lists all lventricles", %{conn: conn} do
      conn = get(conn, Routes.lventricle_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lventricles"
    end
  end

  describe "new lventricle" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.lventricle_path(conn, :new))
      assert html_response(conn, 200) =~ "New Lventricle"
    end
  end

  describe "create lventricle" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lventricle_path(conn, :create), lventricle: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.lventricle_path(conn, :show, id)

      conn = get(conn, Routes.lventricle_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Lventricle"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lventricle_path(conn, :create), lventricle: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Lventricle"
    end
  end

  describe "edit lventricle" do
    setup [:create_lventricle]

    test "renders form for editing chosen lventricle", %{conn: conn, lventricle: lventricle} do
      conn = get(conn, Routes.lventricle_path(conn, :edit, lventricle))
      assert html_response(conn, 200) =~ "Edit Lventricle"
    end
  end

  describe "update lventricle" do
    setup [:create_lventricle]

    test "redirects when data is valid", %{conn: conn, lventricle: lventricle} do
      conn =
        put(conn, Routes.lventricle_path(conn, :update, lventricle), lventricle: @update_attrs)

      assert redirected_to(conn) == Routes.lventricle_path(conn, :show, lventricle)

      conn = get(conn, Routes.lventricle_path(conn, :show, lventricle))
      assert html_response(conn, 200) =~ "some updated cath_lv_ef_method"
    end

    test "renders errors when data is invalid", %{conn: conn, lventricle: lventricle} do
      conn =
        put(conn, Routes.lventricle_path(conn, :update, lventricle), lventricle: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Lventricle"
    end
  end

  describe "delete lventricle" do
    setup [:create_lventricle]

    test "deletes chosen lventricle", %{conn: conn, lventricle: lventricle} do
      conn = delete(conn, Routes.lventricle_path(conn, :delete, lventricle))
      assert redirected_to(conn) == Routes.lventricle_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.lventricle_path(conn, :show, lventricle))
      end)
    end
  end

  defp create_lventricle(_) do
    lventricle = fixture(:lventricle)
    {:ok, lventricle: lventricle}
  end
end
