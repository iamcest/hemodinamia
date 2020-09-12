defmodule AngioWeb.Social_historyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Histories

  @create_attrs %{soh_alcohol_depend: "some soh_alcohol_depend", soh_alcohol_depend_amount: "some soh_alcohol_depend_amount", soh_depressed_mood_yn: true, soh_education_level: "some soh_education_level", soh_employ_status: "some soh_employ_status", soh_erectile_dysfunc_yn: true, soh_illicit_drug_yn: true, soh_life_expect_1yr_yn: true, soh_marital_status: "some soh_marital_status", soh_notes: "some soh_notes", soh_sleep_apnea_on_cpap_yn: true, soh_sleep_apnea_yn: true}
  @update_attrs %{soh_alcohol_depend: "some updated soh_alcohol_depend", soh_alcohol_depend_amount: "some updated soh_alcohol_depend_amount", soh_depressed_mood_yn: false, soh_education_level: "some updated soh_education_level", soh_employ_status: "some updated soh_employ_status", soh_erectile_dysfunc_yn: false, soh_illicit_drug_yn: false, soh_life_expect_1yr_yn: false, soh_marital_status: "some updated soh_marital_status", soh_notes: "some updated soh_notes", soh_sleep_apnea_on_cpap_yn: false, soh_sleep_apnea_yn: false}
  @invalid_attrs %{soh_alcohol_depend: nil, soh_alcohol_depend_amount: nil, soh_depressed_mood_yn: nil, soh_education_level: nil, soh_employ_status: nil, soh_erectile_dysfunc_yn: nil, soh_illicit_drug_yn: nil, soh_life_expect_1yr_yn: nil, soh_marital_status: nil, soh_notes: nil, soh_sleep_apnea_on_cpap_yn: nil, soh_sleep_apnea_yn: nil}

  def fixture(:social_history) do
    {:ok, social_history} = Histories.create_social_history(@create_attrs)
    social_history
  end

  describe "index" do
    test "lists all social_histories", %{conn: conn} do
      conn = get(conn, Routes.social_history_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Social histories"
    end
  end

  describe "new social_history" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.social_history_path(conn, :new))
      assert html_response(conn, 200) =~ "New Social history"
    end
  end

  describe "create social_history" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.social_history_path(conn, :create), social_history: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.social_history_path(conn, :show, id)

      conn = get(conn, Routes.social_history_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Social history"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.social_history_path(conn, :create), social_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Social history"
    end
  end

  describe "edit social_history" do
    setup [:create_social_history]

    test "renders form for editing chosen social_history", %{conn: conn, social_history: social_history} do
      conn = get(conn, Routes.social_history_path(conn, :edit, social_history))
      assert html_response(conn, 200) =~ "Edit Social history"
    end
  end

  describe "update social_history" do
    setup [:create_social_history]

    test "redirects when data is valid", %{conn: conn, social_history: social_history} do
      conn = put(conn, Routes.social_history_path(conn, :update, social_history), social_history: @update_attrs)
      assert redirected_to(conn) == Routes.social_history_path(conn, :show, social_history)

      conn = get(conn, Routes.social_history_path(conn, :show, social_history))
      assert html_response(conn, 200) =~ "some updated soh_alcohol_depend"
    end

    test "renders errors when data is invalid", %{conn: conn, social_history: social_history} do
      conn = put(conn, Routes.social_history_path(conn, :update, social_history), social_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Social history"
    end
  end

  describe "delete social_history" do
    setup [:create_social_history]

    test "deletes chosen social_history", %{conn: conn, social_history: social_history} do
      conn = delete(conn, Routes.social_history_path(conn, :delete, social_history))
      assert redirected_to(conn) == Routes.social_history_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.social_history_path(conn, :show, social_history))
      end
    end
  end

  defp create_social_history(_) do
    social_history = fixture(:social_history)
    {:ok, social_history: social_history}
  end
end
