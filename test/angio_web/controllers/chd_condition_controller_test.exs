defmodule AngioWeb.Chd_conditionControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Congenitals

  @create_attrs %{chd_conditions_notes: "some chd_conditions_notes", chd_diaphragm_hernia_yn: true, chd_heterotaxy_yn: true, chd_rubella_prior_yn: true, chd_syndrome_alagille_yn: true, chd_syndrome_digeorge_yn: true, chd_syndrome_down_yn: true, chd_syndrome_marfan_yn: true, chd_syndrome_noonan_yn: true, chd_syndrome_turner_yn: true, chd_syndrome_williams_yn: true, chd_trisomy_13_yn: true, chd_trisomy_18_yn: true}
  @update_attrs %{chd_conditions_notes: "some updated chd_conditions_notes", chd_diaphragm_hernia_yn: false, chd_heterotaxy_yn: false, chd_rubella_prior_yn: false, chd_syndrome_alagille_yn: false, chd_syndrome_digeorge_yn: false, chd_syndrome_down_yn: false, chd_syndrome_marfan_yn: false, chd_syndrome_noonan_yn: false, chd_syndrome_turner_yn: false, chd_syndrome_williams_yn: false, chd_trisomy_13_yn: false, chd_trisomy_18_yn: false}
  @invalid_attrs %{chd_conditions_notes: nil, chd_diaphragm_hernia_yn: nil, chd_heterotaxy_yn: nil, chd_rubella_prior_yn: nil, chd_syndrome_alagille_yn: nil, chd_syndrome_digeorge_yn: nil, chd_syndrome_down_yn: nil, chd_syndrome_marfan_yn: nil, chd_syndrome_noonan_yn: nil, chd_syndrome_turner_yn: nil, chd_syndrome_williams_yn: nil, chd_trisomy_13_yn: nil, chd_trisomy_18_yn: nil}

  def fixture(:chd_condition) do
    {:ok, chd_condition} = Congenitals.create_chd_condition(@create_attrs)
    chd_condition
  end

  describe "index" do
    test "lists all chd_conditions", %{conn: conn} do
      conn = get(conn, Routes.chd_condition_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chd conditions"
    end
  end

  describe "new chd_condition" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chd_condition_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chd condition"
    end
  end

  describe "create chd_condition" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chd_condition_path(conn, :create), chd_condition: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chd_condition_path(conn, :show, id)

      conn = get(conn, Routes.chd_condition_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chd condition"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chd_condition_path(conn, :create), chd_condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chd condition"
    end
  end

  describe "edit chd_condition" do
    setup [:create_chd_condition]

    test "renders form for editing chosen chd_condition", %{conn: conn, chd_condition: chd_condition} do
      conn = get(conn, Routes.chd_condition_path(conn, :edit, chd_condition))
      assert html_response(conn, 200) =~ "Edit Chd condition"
    end
  end

  describe "update chd_condition" do
    setup [:create_chd_condition]

    test "redirects when data is valid", %{conn: conn, chd_condition: chd_condition} do
      conn = put(conn, Routes.chd_condition_path(conn, :update, chd_condition), chd_condition: @update_attrs)
      assert redirected_to(conn) == Routes.chd_condition_path(conn, :show, chd_condition)

      conn = get(conn, Routes.chd_condition_path(conn, :show, chd_condition))
      assert html_response(conn, 200) =~ "some updated chd_conditions_notes"
    end

    test "renders errors when data is invalid", %{conn: conn, chd_condition: chd_condition} do
      conn = put(conn, Routes.chd_condition_path(conn, :update, chd_condition), chd_condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chd condition"
    end
  end

  describe "delete chd_condition" do
    setup [:create_chd_condition]

    test "deletes chosen chd_condition", %{conn: conn, chd_condition: chd_condition} do
      conn = delete(conn, Routes.chd_condition_path(conn, :delete, chd_condition))
      assert redirected_to(conn) == Routes.chd_condition_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.chd_condition_path(conn, :show, chd_condition))
      end
    end
  end

  defp create_chd_condition(_) do
    chd_condition = fixture(:chd_condition)
    {:ok, chd_condition: chd_condition}
  end
end
