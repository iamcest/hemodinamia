defmodule AngioWeb.Cath_labControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    cath_biomarker_positive_post_yn: true,
    cath_ck_post_normal_ckmb_na: true,
    cath_ck_pre_normal_ckmb_pre_na: true,
    cath_ckmb_peak_post_na: true,
    cath_ckmb_post_val: "some cath_ckmb_post_val",
    cath_ckmb_pre_na: true,
    cath_ckmb_pre_val: "some cath_ckmb_pre_val",
    cath_creatinine_highest_na: true,
    cath_creatinine_highest_val: "some cath_creatinine_highest_val",
    cath_creatinine_post_na: true,
    cath_creatinine_post_val: "some cath_creatinine_post_val",
    cath_creatinine_pre_discharge: "some cath_creatinine_pre_discharge",
    cath_creatinine_pre_discharge_na: true,
    cath_creatinine_pre_na: true,
    cath_creatinine_pre_val: "some cath_creatinine_pre_val",
    cath_hb_post_lowest_val: "some cath_hb_post_lowest_val",
    cath_hb_post_na: true,
    cath_hb_post_val: "some cath_hb_post_val",
    cath_hb_pre_na: true,
    cath_hb_pre_val: "some cath_hb_pre_val",
    cath_tropo_i_peak_post_na: true,
    cath_tropo_i_peak_post_val: "some cath_tropo_i_peak_post_val",
    cath_tropo_i_pre_na: true,
    cath_tropo_i_pre_val: "some cath_tropo_i_pre_val",
    cath_tropo_t_peak_post_na: true,
    cath_tropo_t_peak_post_val: "some cath_tropo_t_peak_post_val",
    cath_tropo_t_pre_na: true,
    cath_tropo_t_pre_val: "some cath_tropo_t_pre_val"
  }
  @update_attrs %{
    cath_biomarker_positive_post_yn: false,
    cath_ck_post_normal_ckmb_na: false,
    cath_ck_pre_normal_ckmb_pre_na: false,
    cath_ckmb_peak_post_na: false,
    cath_ckmb_post_val: "some updated cath_ckmb_post_val",
    cath_ckmb_pre_na: false,
    cath_ckmb_pre_val: "some updated cath_ckmb_pre_val",
    cath_creatinine_highest_na: false,
    cath_creatinine_highest_val: "some updated cath_creatinine_highest_val",
    cath_creatinine_post_na: false,
    cath_creatinine_post_val: "some updated cath_creatinine_post_val",
    cath_creatinine_pre_discharge: "some updated cath_creatinine_pre_discharge",
    cath_creatinine_pre_discharge_na: false,
    cath_creatinine_pre_na: false,
    cath_creatinine_pre_val: "some updated cath_creatinine_pre_val",
    cath_hb_post_lowest_val: "some updated cath_hb_post_lowest_val",
    cath_hb_post_na: false,
    cath_hb_post_val: "some updated cath_hb_post_val",
    cath_hb_pre_na: false,
    cath_hb_pre_val: "some updated cath_hb_pre_val",
    cath_tropo_i_peak_post_na: false,
    cath_tropo_i_peak_post_val: "some updated cath_tropo_i_peak_post_val",
    cath_tropo_i_pre_na: false,
    cath_tropo_i_pre_val: "some updated cath_tropo_i_pre_val",
    cath_tropo_t_peak_post_na: false,
    cath_tropo_t_peak_post_val: "some updated cath_tropo_t_peak_post_val",
    cath_tropo_t_pre_na: false,
    cath_tropo_t_pre_val: "some updated cath_tropo_t_pre_val"
  }
  @invalid_attrs %{
    cath_biomarker_positive_post_yn: nil,
    cath_ck_post_normal_ckmb_na: nil,
    cath_ck_pre_normal_ckmb_pre_na: nil,
    cath_ckmb_peak_post_na: nil,
    cath_ckmb_post_val: nil,
    cath_ckmb_pre_na: nil,
    cath_ckmb_pre_val: nil,
    cath_creatinine_highest_na: nil,
    cath_creatinine_highest_val: nil,
    cath_creatinine_post_na: nil,
    cath_creatinine_post_val: nil,
    cath_creatinine_pre_discharge: nil,
    cath_creatinine_pre_discharge_na: nil,
    cath_creatinine_pre_na: nil,
    cath_creatinine_pre_val: nil,
    cath_hb_post_lowest_val: nil,
    cath_hb_post_na: nil,
    cath_hb_post_val: nil,
    cath_hb_pre_na: nil,
    cath_hb_pre_val: nil,
    cath_tropo_i_peak_post_na: nil,
    cath_tropo_i_peak_post_val: nil,
    cath_tropo_i_pre_na: nil,
    cath_tropo_i_pre_val: nil,
    cath_tropo_t_peak_post_na: nil,
    cath_tropo_t_peak_post_val: nil,
    cath_tropo_t_pre_na: nil,
    cath_tropo_t_pre_val: nil
  }

  def fixture(:cath_lab) do
    {:ok, cath_lab} = Caths.create_cath_lab(@create_attrs)
    cath_lab
  end

  describe "index" do
    test "lists all cath_labs", %{conn: conn} do
      conn = get(conn, Routes.cath_lab_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath labs"
    end
  end

  describe "new cath_lab" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_lab_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath lab"
    end
  end

  describe "create cath_lab" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_lab_path(conn, :create), cath_lab: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_lab_path(conn, :show, id)

      conn = get(conn, Routes.cath_lab_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath lab"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_lab_path(conn, :create), cath_lab: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath lab"
    end
  end

  describe "edit cath_lab" do
    setup [:create_cath_lab]

    test "renders form for editing chosen cath_lab", %{conn: conn, cath_lab: cath_lab} do
      conn = get(conn, Routes.cath_lab_path(conn, :edit, cath_lab))
      assert html_response(conn, 200) =~ "Edit Cath lab"
    end
  end

  describe "update cath_lab" do
    setup [:create_cath_lab]

    test "redirects when data is valid", %{conn: conn, cath_lab: cath_lab} do
      conn = put(conn, Routes.cath_lab_path(conn, :update, cath_lab), cath_lab: @update_attrs)
      assert redirected_to(conn) == Routes.cath_lab_path(conn, :show, cath_lab)

      conn = get(conn, Routes.cath_lab_path(conn, :show, cath_lab))
      assert html_response(conn, 200) =~ "some updated cath_ckmb_post_val"
    end

    test "renders errors when data is invalid", %{conn: conn, cath_lab: cath_lab} do
      conn = put(conn, Routes.cath_lab_path(conn, :update, cath_lab), cath_lab: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cath lab"
    end
  end

  describe "delete cath_lab" do
    setup [:create_cath_lab]

    test "deletes chosen cath_lab", %{conn: conn, cath_lab: cath_lab} do
      conn = delete(conn, Routes.cath_lab_path(conn, :delete, cath_lab))
      assert redirected_to(conn) == Routes.cath_lab_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cath_lab_path(conn, :show, cath_lab))
      end)
    end
  end

  defp create_cath_lab(_) do
    cath_lab = fixture(:cath_lab)
    {:ok, cath_lab: cath_lab}
  end
end
