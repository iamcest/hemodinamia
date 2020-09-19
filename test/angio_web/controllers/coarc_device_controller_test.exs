defmodule AngioWeb.Coarc_deviceControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Interventions

  @create_attrs %{
    coarc_balloon_max_pres: "some coarc_balloon_max_pres",
    coarc_balloon_outcome: "some coarc_balloon_outcome",
    coarc_balloon_purpose: "some coarc_balloon_purpose",
    coarc_device_counter: "some coarc_device_counter",
    coarc_device_id: "some coarc_device_id",
    coarc_device_notes: "some coarc_device_notes",
    coarc_device_type: "some coarc_device_type",
    coarc_stent_diam_min_assesed_yn: true,
    coarc_stent_diam_min_post: "some coarc_stent_diam_min_post",
    coarc_stent_outcome: "some coarc_stent_outcome"
  }
  @update_attrs %{
    coarc_balloon_max_pres: "some updated coarc_balloon_max_pres",
    coarc_balloon_outcome: "some updated coarc_balloon_outcome",
    coarc_balloon_purpose: "some updated coarc_balloon_purpose",
    coarc_device_counter: "some updated coarc_device_counter",
    coarc_device_id: "some updated coarc_device_id",
    coarc_device_notes: "some updated coarc_device_notes",
    coarc_device_type: "some updated coarc_device_type",
    coarc_stent_diam_min_assesed_yn: false,
    coarc_stent_diam_min_post: "some updated coarc_stent_diam_min_post",
    coarc_stent_outcome: "some updated coarc_stent_outcome"
  }
  @invalid_attrs %{
    coarc_balloon_max_pres: nil,
    coarc_balloon_outcome: nil,
    coarc_balloon_purpose: nil,
    coarc_device_counter: nil,
    coarc_device_id: nil,
    coarc_device_notes: nil,
    coarc_device_type: nil,
    coarc_stent_diam_min_assesed_yn: nil,
    coarc_stent_diam_min_post: nil,
    coarc_stent_outcome: nil
  }

  def fixture(:coarc_device) do
    {:ok, coarc_device} = Interventions.create_coarc_device(@create_attrs)
    coarc_device
  end

  describe "index" do
    test "lists all coarc_devices", %{conn: conn} do
      conn = get(conn, Routes.coarc_device_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Coarc devices"
    end
  end

  describe "new coarc_device" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.coarc_device_path(conn, :new))
      assert html_response(conn, 200) =~ "New Coarc device"
    end
  end

  describe "create coarc_device" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.coarc_device_path(conn, :create), coarc_device: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.coarc_device_path(conn, :show, id)

      conn = get(conn, Routes.coarc_device_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Coarc device"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.coarc_device_path(conn, :create), coarc_device: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Coarc device"
    end
  end

  describe "edit coarc_device" do
    setup [:create_coarc_device]

    test "renders form for editing chosen coarc_device", %{conn: conn, coarc_device: coarc_device} do
      conn = get(conn, Routes.coarc_device_path(conn, :edit, coarc_device))
      assert html_response(conn, 200) =~ "Edit Coarc device"
    end
  end

  describe "update coarc_device" do
    setup [:create_coarc_device]

    test "redirects when data is valid", %{conn: conn, coarc_device: coarc_device} do
      conn =
        put(conn, Routes.coarc_device_path(conn, :update, coarc_device),
          coarc_device: @update_attrs
        )

      assert redirected_to(conn) == Routes.coarc_device_path(conn, :show, coarc_device)

      conn = get(conn, Routes.coarc_device_path(conn, :show, coarc_device))
      assert html_response(conn, 200) =~ "some updated coarc_balloon_max_pres"
    end

    test "renders errors when data is invalid", %{conn: conn, coarc_device: coarc_device} do
      conn =
        put(conn, Routes.coarc_device_path(conn, :update, coarc_device),
          coarc_device: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Coarc device"
    end
  end

  describe "delete coarc_device" do
    setup [:create_coarc_device]

    test "deletes chosen coarc_device", %{conn: conn, coarc_device: coarc_device} do
      conn = delete(conn, Routes.coarc_device_path(conn, :delete, coarc_device))
      assert redirected_to(conn) == Routes.coarc_device_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.coarc_device_path(conn, :show, coarc_device))
      end)
    end
  end

  defp create_coarc_device(_) do
    coarc_device = fixture(:coarc_device)
    {:ok, coarc_device: coarc_device}
  end
end
