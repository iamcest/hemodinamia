defmodule AngioWeb.Angio_reportControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:angio_report) do
    {:ok, angio_report} = Caths.create_angio_report(@create_attrs)
    angio_report
  end

  describe "index" do
    test "lists all angio_reports", %{conn: conn} do
      conn = get(conn, Routes.angio_report_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Angio reports"
    end
  end

  describe "new angio_report" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.angio_report_path(conn, :new))
      assert html_response(conn, 200) =~ "New Angio report"
    end
  end

  describe "create angio_report" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.angio_report_path(conn, :create), angio_report: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.angio_report_path(conn, :show, id)

      conn = get(conn, Routes.angio_report_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Angio report"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.angio_report_path(conn, :create), angio_report: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Angio report"
    end
  end

  describe "edit angio_report" do
    setup [:create_angio_report]

    test "renders form for editing chosen angio_report", %{conn: conn, angio_report: angio_report} do
      conn = get(conn, Routes.angio_report_path(conn, :edit, angio_report))
      assert html_response(conn, 200) =~ "Edit Angio report"
    end
  end

  describe "update angio_report" do
    setup [:create_angio_report]

    test "redirects when data is valid", %{conn: conn, angio_report: angio_report} do
      conn =
        put(conn, Routes.angio_report_path(conn, :update, angio_report),
          angio_report: @update_attrs
        )

      assert redirected_to(conn) == Routes.angio_report_path(conn, :show, angio_report)

      conn = get(conn, Routes.angio_report_path(conn, :show, angio_report))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, angio_report: angio_report} do
      conn =
        put(conn, Routes.angio_report_path(conn, :update, angio_report),
          angio_report: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Angio report"
    end
  end

  describe "delete angio_report" do
    setup [:create_angio_report]

    test "deletes chosen angio_report", %{conn: conn, angio_report: angio_report} do
      conn = delete(conn, Routes.angio_report_path(conn, :delete, angio_report))
      assert redirected_to(conn) == Routes.angio_report_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.angio_report_path(conn, :show, angio_report))
      end)
    end
  end

  defp create_angio_report(_) do
    angio_report = fixture(:angio_report)
    {:ok, angio_report: angio_report}
  end
end
