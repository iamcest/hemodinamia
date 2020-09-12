defmodule AngioWeb.Cor_anatomyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    cor_anat_anomalies_yn: true,
    cor_anat_conus_type: "some cor_anat_conus_type",
    cor_anat_dominance: "some cor_anat_dominance",
    cor_anat_lad_d1_type: "some cor_anat_lad_d1_type",
    cor_anat_lad_d2_type: "some cor_anat_lad_d2_type",
    cor_anat_lad_d3_type: "some cor_anat_lad_d3_type",
    cor_anat_lad_distal_type: "some cor_anat_lad_distal_type",
    cor_anat_lad_mid_type: "some cor_anat_lad_mid_type",
    cor_anat_lad_ostium_type: "some cor_anat_lad_ostium_type",
    cor_anat_lad_prox_type: "some cor_anat_lad_prox_type",
    cor_anat_lcx_distal_type: "some cor_anat_lcx_distal_type",
    cor_anat_lcx_mid_type: "some cor_anat_lcx_mid_type",
    cor_anat_lcx_om1_type: "some cor_anat_lcx_om1_type",
    cor_anat_lcx_om2_type: "some cor_anat_lcx_om2_type",
    cor_anat_lcx_om3_type: "some cor_anat_lcx_om3_type",
    cor_anat_lcx_ostium_type: "some cor_anat_lcx_ostium_type",
    cor_anat_lcx_prox_type: "some cor_anat_lcx_prox_type",
    cor_anat_lcx_type: "some cor_anat_lcx_type",
    cor_anat_lm_ostium_type: "some cor_anat_lm_ostium_type",
    cor_anat_lm_type: "some cor_anat_lm_type",
    cor_anat_notes: "some cor_anat_notes",
    cor_anat_pl_type: "some cor_anat_pl_type",
    cor_anat_ramus_type: "some cor_anat_ramus_type",
    cor_anat_rca_distal_type: "some cor_anat_rca_distal_type",
    cor_anat_rca_mid_type: "some cor_anat_rca_mid_type",
    cor_anat_rca_ostium_type: "some cor_anat_rca_ostium_type",
    cor_anat_rca_pda_type: "some cor_anat_rca_pda_type",
    cor_anat_rca_rv_branch_type: "some cor_anat_rca_rv_branch_type",
    cor_anat_rca_type: "some cor_anat_rca_type",
    cor_anat_septal_ostium_type: "some cor_anat_septal_ostium_type",
    cor_anat_sino_atrial_type: "some cor_anat_sino_atrial_type",
    cor_anat_variations_yn: true
  }
  @update_attrs %{
    cor_anat_anomalies_yn: false,
    cor_anat_conus_type: "some updated cor_anat_conus_type",
    cor_anat_dominance: "some updated cor_anat_dominance",
    cor_anat_lad_d1_type: "some updated cor_anat_lad_d1_type",
    cor_anat_lad_d2_type: "some updated cor_anat_lad_d2_type",
    cor_anat_lad_d3_type: "some updated cor_anat_lad_d3_type",
    cor_anat_lad_distal_type: "some updated cor_anat_lad_distal_type",
    cor_anat_lad_mid_type: "some updated cor_anat_lad_mid_type",
    cor_anat_lad_ostium_type: "some updated cor_anat_lad_ostium_type",
    cor_anat_lad_prox_type: "some updated cor_anat_lad_prox_type",
    cor_anat_lcx_distal_type: "some updated cor_anat_lcx_distal_type",
    cor_anat_lcx_mid_type: "some updated cor_anat_lcx_mid_type",
    cor_anat_lcx_om1_type: "some updated cor_anat_lcx_om1_type",
    cor_anat_lcx_om2_type: "some updated cor_anat_lcx_om2_type",
    cor_anat_lcx_om3_type: "some updated cor_anat_lcx_om3_type",
    cor_anat_lcx_ostium_type: "some updated cor_anat_lcx_ostium_type",
    cor_anat_lcx_prox_type: "some updated cor_anat_lcx_prox_type",
    cor_anat_lcx_type: "some updated cor_anat_lcx_type",
    cor_anat_lm_ostium_type: "some updated cor_anat_lm_ostium_type",
    cor_anat_lm_type: "some updated cor_anat_lm_type",
    cor_anat_notes: "some updated cor_anat_notes",
    cor_anat_pl_type: "some updated cor_anat_pl_type",
    cor_anat_ramus_type: "some updated cor_anat_ramus_type",
    cor_anat_rca_distal_type: "some updated cor_anat_rca_distal_type",
    cor_anat_rca_mid_type: "some updated cor_anat_rca_mid_type",
    cor_anat_rca_ostium_type: "some updated cor_anat_rca_ostium_type",
    cor_anat_rca_pda_type: "some updated cor_anat_rca_pda_type",
    cor_anat_rca_rv_branch_type: "some updated cor_anat_rca_rv_branch_type",
    cor_anat_rca_type: "some updated cor_anat_rca_type",
    cor_anat_septal_ostium_type: "some updated cor_anat_septal_ostium_type",
    cor_anat_sino_atrial_type: "some updated cor_anat_sino_atrial_type",
    cor_anat_variations_yn: false
  }
  @invalid_attrs %{
    cor_anat_anomalies_yn: nil,
    cor_anat_conus_type: nil,
    cor_anat_dominance: nil,
    cor_anat_lad_d1_type: nil,
    cor_anat_lad_d2_type: nil,
    cor_anat_lad_d3_type: nil,
    cor_anat_lad_distal_type: nil,
    cor_anat_lad_mid_type: nil,
    cor_anat_lad_ostium_type: nil,
    cor_anat_lad_prox_type: nil,
    cor_anat_lcx_distal_type: nil,
    cor_anat_lcx_mid_type: nil,
    cor_anat_lcx_om1_type: nil,
    cor_anat_lcx_om2_type: nil,
    cor_anat_lcx_om3_type: nil,
    cor_anat_lcx_ostium_type: nil,
    cor_anat_lcx_prox_type: nil,
    cor_anat_lcx_type: nil,
    cor_anat_lm_ostium_type: nil,
    cor_anat_lm_type: nil,
    cor_anat_notes: nil,
    cor_anat_pl_type: nil,
    cor_anat_ramus_type: nil,
    cor_anat_rca_distal_type: nil,
    cor_anat_rca_mid_type: nil,
    cor_anat_rca_ostium_type: nil,
    cor_anat_rca_pda_type: nil,
    cor_anat_rca_rv_branch_type: nil,
    cor_anat_rca_type: nil,
    cor_anat_septal_ostium_type: nil,
    cor_anat_sino_atrial_type: nil,
    cor_anat_variations_yn: nil
  }

  def fixture(:cor_anatomy) do
    {:ok, cor_anatomy} = Caths.create_cor_anatomy(@create_attrs)
    cor_anatomy
  end

  describe "index" do
    test "lists all cor_anatomies", %{conn: conn} do
      conn = get(conn, Routes.cor_anatomy_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cor anatomies"
    end
  end

  describe "new cor_anatomy" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cor_anatomy_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cor anatomy"
    end
  end

  describe "create cor_anatomy" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cor_anatomy_path(conn, :create), cor_anatomy: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cor_anatomy_path(conn, :show, id)

      conn = get(conn, Routes.cor_anatomy_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cor anatomy"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cor_anatomy_path(conn, :create), cor_anatomy: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cor anatomy"
    end
  end

  describe "edit cor_anatomy" do
    setup [:create_cor_anatomy]

    test "renders form for editing chosen cor_anatomy", %{conn: conn, cor_anatomy: cor_anatomy} do
      conn = get(conn, Routes.cor_anatomy_path(conn, :edit, cor_anatomy))
      assert html_response(conn, 200) =~ "Edit Cor anatomy"
    end
  end

  describe "update cor_anatomy" do
    setup [:create_cor_anatomy]

    test "redirects when data is valid", %{conn: conn, cor_anatomy: cor_anatomy} do
      conn =
        put(conn, Routes.cor_anatomy_path(conn, :update, cor_anatomy), cor_anatomy: @update_attrs)

      assert redirected_to(conn) == Routes.cor_anatomy_path(conn, :show, cor_anatomy)

      conn = get(conn, Routes.cor_anatomy_path(conn, :show, cor_anatomy))
      assert html_response(conn, 200) =~ "some updated cor_anat_conus_type"
    end

    test "renders errors when data is invalid", %{conn: conn, cor_anatomy: cor_anatomy} do
      conn =
        put(conn, Routes.cor_anatomy_path(conn, :update, cor_anatomy), cor_anatomy: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Cor anatomy"
    end
  end

  describe "delete cor_anatomy" do
    setup [:create_cor_anatomy]

    test "deletes chosen cor_anatomy", %{conn: conn, cor_anatomy: cor_anatomy} do
      conn = delete(conn, Routes.cor_anatomy_path(conn, :delete, cor_anatomy))
      assert redirected_to(conn) == Routes.cor_anatomy_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cor_anatomy_path(conn, :show, cor_anatomy))
      end)
    end
  end

  defp create_cor_anatomy(_) do
    cor_anatomy = fixture(:cor_anatomy)
    {:ok, cor_anatomy: cor_anatomy}
  end
end
