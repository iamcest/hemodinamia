defmodule AngioWeb.Info_coronaryControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    "": "some ",
    cor_les_count: "some cor_les_count",
    icd10cm_code_1: "some icd10cm_code_1",
    icd10cm_code_2: "some icd10cm_code_2",
    icd10cm_code_3: "some icd10cm_code_3",
    icd10cm_code_4: "some icd10cm_code_4",
    info_cor_anomalies_yn: true,
    info_cor_arrival_dt: ~D[2010-04-17],
    info_cor_arrival_tm: ~T[14:00:00],
    info_cor_cabg_prior_dt: ~D[2010-04-17],
    info_cor_date: ~D[2010-04-17],
    "info_cor_diagnostic_status,": "some info_cor_diagnostic_status,",
    info_cor_dis_ves_num: "some info_cor_dis_ves_num",
    info_cor_end_tm: ~T[14:00:00],
    info_cor_grafts_dis_yn: true,
    info_cor_grafts_implanted_num: "some info_cor_grafts_implanted_num",
    info_cor_grafts_patent_num: "some info_cor_grafts_patent_num",
    info_cor_grafts_yn: true,
    info_cor_main_reason: "some info_cor_main_reason",
    info_cor_normal_natives_yn: true,
    info_cor_notes: "some info_cor_notes",
    info_cor_prior_interv_yn: true,
    info_cor_rx_recommend: "some info_cor_rx_recommend",
    info_cor_start_tm: ~T[14:00:00],
    info_exam_num: "some info_exam_num"
  }
  @update_attrs %{
    "": "some updated ",
    cor_les_count: "some updated cor_les_count",
    icd10cm_code_1: "some updated icd10cm_code_1",
    icd10cm_code_2: "some updated icd10cm_code_2",
    icd10cm_code_3: "some updated icd10cm_code_3",
    icd10cm_code_4: "some updated icd10cm_code_4",
    info_cor_anomalies_yn: false,
    info_cor_arrival_dt: ~D[2011-05-18],
    info_cor_arrival_tm: ~T[15:01:01],
    info_cor_cabg_prior_dt: ~D[2011-05-18],
    info_cor_date: ~D[2011-05-18],
    "info_cor_diagnostic_status,": "some updated info_cor_diagnostic_status,",
    info_cor_dis_ves_num: "some updated info_cor_dis_ves_num",
    info_cor_end_tm: ~T[15:01:01],
    info_cor_grafts_dis_yn: false,
    info_cor_grafts_implanted_num: "some updated info_cor_grafts_implanted_num",
    info_cor_grafts_patent_num: "some updated info_cor_grafts_patent_num",
    info_cor_grafts_yn: false,
    info_cor_main_reason: "some updated info_cor_main_reason",
    info_cor_normal_natives_yn: false,
    info_cor_notes: "some updated info_cor_notes",
    info_cor_prior_interv_yn: false,
    info_cor_rx_recommend: "some updated info_cor_rx_recommend",
    info_cor_start_tm: ~T[15:01:01],
    info_exam_num: "some updated info_exam_num"
  }
  @invalid_attrs %{
    "": nil,
    cor_les_count: nil,
    icd10cm_code_1: nil,
    icd10cm_code_2: nil,
    icd10cm_code_3: nil,
    icd10cm_code_4: nil,
    info_cor_anomalies_yn: nil,
    info_cor_arrival_dt: nil,
    info_cor_arrival_tm: nil,
    info_cor_cabg_prior_dt: nil,
    info_cor_date: nil,
    "info_cor_diagnostic_status,": nil,
    info_cor_dis_ves_num: nil,
    info_cor_end_tm: nil,
    info_cor_grafts_dis_yn: nil,
    info_cor_grafts_implanted_num: nil,
    info_cor_grafts_patent_num: nil,
    info_cor_grafts_yn: nil,
    info_cor_main_reason: nil,
    info_cor_normal_natives_yn: nil,
    info_cor_notes: nil,
    info_cor_prior_interv_yn: nil,
    info_cor_rx_recommend: nil,
    info_cor_start_tm: nil,
    info_exam_num: nil
  }

  def fixture(:info_coronary) do
    {:ok, info_coronary} = Caths.create_info_coronary(@create_attrs)
    info_coronary
  end

  describe "index" do
    test "lists all info_coronaries", %{conn: conn} do
      conn = get(conn, Routes.info_coronary_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Info coronaries"
    end
  end

  describe "new info_coronary" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.info_coronary_path(conn, :new))
      assert html_response(conn, 200) =~ "New Info coronary"
    end
  end

  describe "create info_coronary" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.info_coronary_path(conn, :create), info_coronary: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.info_coronary_path(conn, :show, id)

      conn = get(conn, Routes.info_coronary_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Info coronary"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.info_coronary_path(conn, :create), info_coronary: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Info coronary"
    end
  end

  describe "edit info_coronary" do
    setup [:create_info_coronary]

    test "renders form for editing chosen info_coronary", %{
      conn: conn,
      info_coronary: info_coronary
    } do
      conn = get(conn, Routes.info_coronary_path(conn, :edit, info_coronary))
      assert html_response(conn, 200) =~ "Edit Info coronary"
    end
  end

  describe "update info_coronary" do
    setup [:create_info_coronary]

    test "redirects when data is valid", %{conn: conn, info_coronary: info_coronary} do
      conn =
        put(conn, Routes.info_coronary_path(conn, :update, info_coronary),
          info_coronary: @update_attrs
        )

      assert redirected_to(conn) == Routes.info_coronary_path(conn, :show, info_coronary)

      conn = get(conn, Routes.info_coronary_path(conn, :show, info_coronary))
      assert html_response(conn, 200) =~ "some updated "
    end

    test "renders errors when data is invalid", %{conn: conn, info_coronary: info_coronary} do
      conn =
        put(conn, Routes.info_coronary_path(conn, :update, info_coronary),
          info_coronary: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Info coronary"
    end
  end

  describe "delete info_coronary" do
    setup [:create_info_coronary]

    test "deletes chosen info_coronary", %{conn: conn, info_coronary: info_coronary} do
      conn = delete(conn, Routes.info_coronary_path(conn, :delete, info_coronary))
      assert redirected_to(conn) == Routes.info_coronary_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.info_coronary_path(conn, :show, info_coronary))
      end)
    end
  end

  defp create_info_coronary(_) do
    info_coronary = fixture(:info_coronary)
    {:ok, info_coronary: info_coronary}
  end
end
