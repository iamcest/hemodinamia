defmodule AngioWeb.Av_plastyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{
    avp_av_ann_diam_us: "some avp_av_ann_diam_us",
    avp_av_morphology: "some avp_av_morphology",
    avp_av_reg_degree_pre: "some avp_av_reg_degree_pre",
    avp_dt: ~D[2010-04-17],
    avp_notes: "some avp_notes",
    avp_operator_fname: "some avp_operator_fname",
    avp_operator_lname: "some avp_operator_lname",
    avp_operator_mname: "some avp_operator_mname",
    avp_operator_npi: "some avp_operator_npi",
    avp_peak_sys_gradient_pre: "some avp_peak_sys_gradient_pre",
    avp_primary_indication: "some avp_primary_indication",
    avp_tm: ~T[14:00:00]
  }
  @update_attrs %{
    avp_av_ann_diam_us: "some updated avp_av_ann_diam_us",
    avp_av_morphology: "some updated avp_av_morphology",
    avp_av_reg_degree_pre: "some updated avp_av_reg_degree_pre",
    avp_dt: ~D[2011-05-18],
    avp_notes: "some updated avp_notes",
    avp_operator_fname: "some updated avp_operator_fname",
    avp_operator_lname: "some updated avp_operator_lname",
    avp_operator_mname: "some updated avp_operator_mname",
    avp_operator_npi: "some updated avp_operator_npi",
    avp_peak_sys_gradient_pre: "some updated avp_peak_sys_gradient_pre",
    avp_primary_indication: "some updated avp_primary_indication",
    avp_tm: ~T[15:01:01]
  }
  @invalid_attrs %{
    avp_av_ann_diam_us: nil,
    avp_av_morphology: nil,
    avp_av_reg_degree_pre: nil,
    avp_dt: nil,
    avp_notes: nil,
    avp_operator_fname: nil,
    avp_operator_lname: nil,
    avp_operator_mname: nil,
    avp_operator_npi: nil,
    avp_peak_sys_gradient_pre: nil,
    avp_primary_indication: nil,
    avp_tm: nil
  }

  def fixture(:av_plasty) do
    {:ok, av_plasty} = Interventions.create_av_plasty(@create_attrs)
    av_plasty
  end

  describe "index" do
    test "lists all av_plasties", %{conn: conn} do
      conn = get(conn, Routes.av_plasty_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Av plasties"
    end
  end

  describe "new av_plasty" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.av_plasty_path(conn, :new))
      assert html_response(conn, 200) =~ "New Av plasty"
    end
  end

  describe "create av_plasty" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.av_plasty_path(conn, :create), av_plasty: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.av_plasty_path(conn, :show, id)

      conn = get(conn, Routes.av_plasty_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Av plasty"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.av_plasty_path(conn, :create), av_plasty: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Av plasty"
    end
  end

  describe "edit av_plasty" do
    setup [:create_av_plasty]

    test "renders form for editing chosen av_plasty", %{conn: conn, av_plasty: av_plasty} do
      conn = get(conn, Routes.av_plasty_path(conn, :edit, av_plasty))
      assert html_response(conn, 200) =~ "Edit Av plasty"
    end
  end

  describe "update av_plasty" do
    setup [:create_av_plasty]

    test "redirects when data is valid", %{conn: conn, av_plasty: av_plasty} do
      conn = put(conn, Routes.av_plasty_path(conn, :update, av_plasty), av_plasty: @update_attrs)
      assert redirected_to(conn) == Routes.av_plasty_path(conn, :show, av_plasty)

      conn = get(conn, Routes.av_plasty_path(conn, :show, av_plasty))
      assert html_response(conn, 200) =~ "some updated avp_av_ann_diam_us"
    end

    test "renders errors when data is invalid", %{conn: conn, av_plasty: av_plasty} do
      conn = put(conn, Routes.av_plasty_path(conn, :update, av_plasty), av_plasty: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Av plasty"
    end
  end

  describe "delete av_plasty" do
    setup [:create_av_plasty]

    test "deletes chosen av_plasty", %{conn: conn, av_plasty: av_plasty} do
      conn = delete(conn, Routes.av_plasty_path(conn, :delete, av_plasty))
      assert redirected_to(conn) == Routes.av_plasty_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.av_plasty_path(conn, :show, av_plasty))
      end)
    end
  end

  defp create_av_plasty(_) do
    av_plasty = fixture(:av_plasty)
    {:ok, av_plasty: av_plasty}
  end
end
