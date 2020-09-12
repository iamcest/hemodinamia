defmodule AngioWeb.Av_plasties_inflationControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{avp_bal_outcome: "some avp_bal_outcome", avpi_av_reg_degree_post: "some avpi_av_reg_degree_post", avpi_balloon_technique: "some avpi_balloon_technique", avpi_db_bal_2_id: "some avpi_db_bal_2_id", avpi_inflation_counter: "some avpi_inflation_counter", avpi_max_inflation_pres: "some avpi_max_inflation_pres", avpi_notes: "some avpi_notes", avpi_peak_sys_gradient_post: "some avpi_peak_sys_gradient_post", avpi_sb_bal_1_id: "some avpi_sb_bal_1_id", avpi_stabilization_yn: true}
  @update_attrs %{avp_bal_outcome: "some updated avp_bal_outcome", avpi_av_reg_degree_post: "some updated avpi_av_reg_degree_post", avpi_balloon_technique: "some updated avpi_balloon_technique", avpi_db_bal_2_id: "some updated avpi_db_bal_2_id", avpi_inflation_counter: "some updated avpi_inflation_counter", avpi_max_inflation_pres: "some updated avpi_max_inflation_pres", avpi_notes: "some updated avpi_notes", avpi_peak_sys_gradient_post: "some updated avpi_peak_sys_gradient_post", avpi_sb_bal_1_id: "some updated avpi_sb_bal_1_id", avpi_stabilization_yn: false}
  @invalid_attrs %{avp_bal_outcome: nil, avpi_av_reg_degree_post: nil, avpi_balloon_technique: nil, avpi_db_bal_2_id: nil, avpi_inflation_counter: nil, avpi_max_inflation_pres: nil, avpi_notes: nil, avpi_peak_sys_gradient_post: nil, avpi_sb_bal_1_id: nil, avpi_stabilization_yn: nil}

  def fixture(:av_plasties_inflation) do
    {:ok, av_plasties_inflation} = Interventions.create_av_plasties_inflation(@create_attrs)
    av_plasties_inflation
  end

  describe "index" do
    test "lists all av_plasties_inflations", %{conn: conn} do
      conn = get(conn, Routes.av_plasties_inflation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Av plasties inflations"
    end
  end

  describe "new av_plasties_inflation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.av_plasties_inflation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Av plasties inflation"
    end
  end

  describe "create av_plasties_inflation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.av_plasties_inflation_path(conn, :create), av_plasties_inflation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.av_plasties_inflation_path(conn, :show, id)

      conn = get(conn, Routes.av_plasties_inflation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Av plasties inflation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.av_plasties_inflation_path(conn, :create), av_plasties_inflation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Av plasties inflation"
    end
  end

  describe "edit av_plasties_inflation" do
    setup [:create_av_plasties_inflation]

    test "renders form for editing chosen av_plasties_inflation", %{conn: conn, av_plasties_inflation: av_plasties_inflation} do
      conn = get(conn, Routes.av_plasties_inflation_path(conn, :edit, av_plasties_inflation))
      assert html_response(conn, 200) =~ "Edit Av plasties inflation"
    end
  end

  describe "update av_plasties_inflation" do
    setup [:create_av_plasties_inflation]

    test "redirects when data is valid", %{conn: conn, av_plasties_inflation: av_plasties_inflation} do
      conn = put(conn, Routes.av_plasties_inflation_path(conn, :update, av_plasties_inflation), av_plasties_inflation: @update_attrs)
      assert redirected_to(conn) == Routes.av_plasties_inflation_path(conn, :show, av_plasties_inflation)

      conn = get(conn, Routes.av_plasties_inflation_path(conn, :show, av_plasties_inflation))
      assert html_response(conn, 200) =~ "some updated avp_bal_outcome"
    end

    test "renders errors when data is invalid", %{conn: conn, av_plasties_inflation: av_plasties_inflation} do
      conn = put(conn, Routes.av_plasties_inflation_path(conn, :update, av_plasties_inflation), av_plasties_inflation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Av plasties inflation"
    end
  end

  describe "delete av_plasties_inflation" do
    setup [:create_av_plasties_inflation]

    test "deletes chosen av_plasties_inflation", %{conn: conn, av_plasties_inflation: av_plasties_inflation} do
      conn = delete(conn, Routes.av_plasties_inflation_path(conn, :delete, av_plasties_inflation))
      assert redirected_to(conn) == Routes.av_plasties_inflation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.av_plasties_inflation_path(conn, :show, av_plasties_inflation))
      end
    end
  end

  defp create_av_plasties_inflation(_) do
    av_plasties_inflation = fixture(:av_plasties_inflation)
    {:ok, av_plasties_inflation: av_plasties_inflation}
  end
end
