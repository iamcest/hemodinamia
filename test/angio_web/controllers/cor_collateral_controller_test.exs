defmodule AngioWeb.Cor_collateralControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    collat_donor_seg: "some collat_donor_seg",
    collat_flow_idx_calc_yn: true,
    collat_flow_idx_method: "some collat_flow_idx_method",
    collat_flow_idx_result: "some collat_flow_idx_result",
    collat_notes: "some collat_notes",
    collat_qualitative_class: "some collat_qualitative_class",
    collat_recipient_seg: "some collat_recipient_seg",
    collat_rentrop_grade: "some collat_rentrop_grade",
    collat_via_seg: "some collat_via_seg",
    collat_yn: true,
    info_coronary_id: 42,
    patient_id: 42
  }
  @update_attrs %{
    collat_donor_seg: "some updated collat_donor_seg",
    collat_flow_idx_calc_yn: false,
    collat_flow_idx_method: "some updated collat_flow_idx_method",
    collat_flow_idx_result: "some updated collat_flow_idx_result",
    collat_notes: "some updated collat_notes",
    collat_qualitative_class: "some updated collat_qualitative_class",
    collat_recipient_seg: "some updated collat_recipient_seg",
    collat_rentrop_grade: "some updated collat_rentrop_grade",
    collat_via_seg: "some updated collat_via_seg",
    collat_yn: false,
    info_coronary_id: 43,
    patient_id: 43
  }
  @invalid_attrs %{
    collat_donor_seg: nil,
    collat_flow_idx_calc_yn: nil,
    collat_flow_idx_method: nil,
    collat_flow_idx_result: nil,
    collat_notes: nil,
    collat_qualitative_class: nil,
    collat_recipient_seg: nil,
    collat_rentrop_grade: nil,
    collat_via_seg: nil,
    collat_yn: nil,
    info_coronary_id: nil,
    patient_id: nil
  }

  def fixture(:cor_collateral) do
    {:ok, cor_collateral} = Caths.create_cor_collateral(@create_attrs)
    cor_collateral
  end

  describe "index" do
    test "lists all cor_collaterals", %{conn: conn} do
      conn = get(conn, Routes.cor_collateral_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cor collaterals"
    end
  end

  describe "new cor_collateral" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cor_collateral_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cor collateral"
    end
  end

  describe "create cor_collateral" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cor_collateral_path(conn, :create), cor_collateral: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cor_collateral_path(conn, :show, id)

      conn = get(conn, Routes.cor_collateral_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cor collateral"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cor_collateral_path(conn, :create), cor_collateral: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cor collateral"
    end
  end

  describe "edit cor_collateral" do
    setup [:create_cor_collateral]

    test "renders form for editing chosen cor_collateral", %{
      conn: conn,
      cor_collateral: cor_collateral
    } do
      conn = get(conn, Routes.cor_collateral_path(conn, :edit, cor_collateral))
      assert html_response(conn, 200) =~ "Edit Cor collateral"
    end
  end

  describe "update cor_collateral" do
    setup [:create_cor_collateral]

    test "redirects when data is valid", %{conn: conn, cor_collateral: cor_collateral} do
      conn =
        put(conn, Routes.cor_collateral_path(conn, :update, cor_collateral),
          cor_collateral: @update_attrs
        )

      assert redirected_to(conn) == Routes.cor_collateral_path(conn, :show, cor_collateral)

      conn = get(conn, Routes.cor_collateral_path(conn, :show, cor_collateral))
      assert html_response(conn, 200) =~ "some updated collat_donor_seg"
    end

    test "renders errors when data is invalid", %{conn: conn, cor_collateral: cor_collateral} do
      conn =
        put(conn, Routes.cor_collateral_path(conn, :update, cor_collateral),
          cor_collateral: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Cor collateral"
    end
  end

  describe "delete cor_collateral" do
    setup [:create_cor_collateral]

    test "deletes chosen cor_collateral", %{conn: conn, cor_collateral: cor_collateral} do
      conn = delete(conn, Routes.cor_collateral_path(conn, :delete, cor_collateral))
      assert redirected_to(conn) == Routes.cor_collateral_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cor_collateral_path(conn, :show, cor_collateral))
      end)
    end
  end

  defp create_cor_collateral(_) do
    cor_collateral = fixture(:cor_collateral)
    {:ok, cor_collateral: cor_collateral}
  end
end
