defmodule AngioWeb.Chest_painsControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Clinicals

  @create_attrs %{
    chestp_assoc_symptoms: "some chestp_assoc_symptoms",
    chestp_dt: ~D[2010-04-17],
    chestp_duration: "some chestp_duration",
    chestp_location: "some chestp_location",
    chestp_notes: "some chestp_notes",
    chestp_perciptating_factors: "some chestp_perciptating_factors",
    chestp_quality: "some chestp_quality",
    chestp_relieving_factors: "some chestp_relieving_factors",
    chestp_tm: ~T[14:00:00]
  }
  @update_attrs %{
    chestp_assoc_symptoms: "some updated chestp_assoc_symptoms",
    chestp_dt: ~D[2011-05-18],
    chestp_duration: "some updated chestp_duration",
    chestp_location: "some updated chestp_location",
    chestp_notes: "some updated chestp_notes",
    chestp_perciptating_factors: "some updated chestp_perciptating_factors",
    chestp_quality: "some updated chestp_quality",
    chestp_relieving_factors: "some updated chestp_relieving_factors",
    chestp_tm: ~T[15:01:01]
  }
  @invalid_attrs %{
    chestp_assoc_symptoms: nil,
    chestp_dt: nil,
    chestp_duration: nil,
    chestp_location: nil,
    chestp_notes: nil,
    chestp_perciptating_factors: nil,
    chestp_quality: nil,
    chestp_relieving_factors: nil,
    chestp_tm: nil
  }

  def fixture(:chest_pains) do
    {:ok, chest_pains} = Clinicals.create_chest_pains(@create_attrs)
    chest_pains
  end

  describe "index" do
    test "lists all chest_pain", %{conn: conn} do
      conn = get(conn, Routes.chest_pains_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chest pain"
    end
  end

  describe "new chest_pains" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chest_pains_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chest pains"
    end
  end

  describe "create chest_pains" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chest_pains_path(conn, :create), chest_pains: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chest_pains_path(conn, :show, id)

      conn = get(conn, Routes.chest_pains_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chest pains"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chest_pains_path(conn, :create), chest_pains: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chest pains"
    end
  end

  describe "edit chest_pains" do
    setup [:create_chest_pains]

    test "renders form for editing chosen chest_pains", %{conn: conn, chest_pains: chest_pains} do
      conn = get(conn, Routes.chest_pains_path(conn, :edit, chest_pains))
      assert html_response(conn, 200) =~ "Edit Chest pains"
    end
  end

  describe "update chest_pains" do
    setup [:create_chest_pains]

    test "redirects when data is valid", %{conn: conn, chest_pains: chest_pains} do
      conn =
        put(conn, Routes.chest_pains_path(conn, :update, chest_pains), chest_pains: @update_attrs)

      assert redirected_to(conn) == Routes.chest_pains_path(conn, :show, chest_pains)

      conn = get(conn, Routes.chest_pains_path(conn, :show, chest_pains))
      assert html_response(conn, 200) =~ "some updated chestp_assoc_symptoms"
    end

    test "renders errors when data is invalid", %{conn: conn, chest_pains: chest_pains} do
      conn =
        put(conn, Routes.chest_pains_path(conn, :update, chest_pains), chest_pains: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Chest pains"
    end
  end

  describe "delete chest_pains" do
    setup [:create_chest_pains]

    test "deletes chosen chest_pains", %{conn: conn, chest_pains: chest_pains} do
      conn = delete(conn, Routes.chest_pains_path(conn, :delete, chest_pains))
      assert redirected_to(conn) == Routes.chest_pains_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.chest_pains_path(conn, :show, chest_pains))
      end)
    end
  end

  defp create_chest_pains(_) do
    chest_pains = fixture(:chest_pains)
    {:ok, chest_pains: chest_pains}
  end
end
