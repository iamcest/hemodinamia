defmodule AngioWeb.Vital_signControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Assements

  @create_attrs %{
    vital_sgns_bmi: "some vital_sgns_bmi",
    vital_sgns_body_temp: "some vital_sgns_body_temp",
    vital_sgns_bp_diast: "some vital_sgns_bp_diast",
    vital_sgns_bp_sys: "some vital_sgns_bp_sys",
    vital_sgns_dt: ~D[2010-04-17],
    vital_sgns_head_circumference: "some vital_sgns_head_circumference",
    vital_sgns_height: "some vital_sgns_height",
    vital_sgns_height_lying: "some vital_sgns_height_lying",
    vital_sgns_notes: "some vital_sgns_notes",
    vital_sgns_pulse_rate: "some vital_sgns_pulse_rate",
    vital_sgns_respiratory_rate: "some vital_sgns_respiratory_rate",
    vital_sgns_sat_val: "some vital_sgns_sat_val",
    vital_sgns_tm: ~T[14:00:00],
    vital_sgns_waist_val: "some vital_sgns_waist_val",
    vital_sgns_weight_val: "some vital_sgns_weight_val"
  }
  @update_attrs %{
    vital_sgns_bmi: "some updated vital_sgns_bmi",
    vital_sgns_body_temp: "some updated vital_sgns_body_temp",
    vital_sgns_bp_diast: "some updated vital_sgns_bp_diast",
    vital_sgns_bp_sys: "some updated vital_sgns_bp_sys",
    vital_sgns_dt: ~D[2011-05-18],
    vital_sgns_head_circumference: "some updated vital_sgns_head_circumference",
    vital_sgns_height: "some updated vital_sgns_height",
    vital_sgns_height_lying: "some updated vital_sgns_height_lying",
    vital_sgns_notes: "some updated vital_sgns_notes",
    vital_sgns_pulse_rate: "some updated vital_sgns_pulse_rate",
    vital_sgns_respiratory_rate: "some updated vital_sgns_respiratory_rate",
    vital_sgns_sat_val: "some updated vital_sgns_sat_val",
    vital_sgns_tm: ~T[15:01:01],
    vital_sgns_waist_val: "some updated vital_sgns_waist_val",
    vital_sgns_weight_val: "some updated vital_sgns_weight_val"
  }
  @invalid_attrs %{
    vital_sgns_bmi: nil,
    vital_sgns_body_temp: nil,
    vital_sgns_bp_diast: nil,
    vital_sgns_bp_sys: nil,
    vital_sgns_dt: nil,
    vital_sgns_head_circumference: nil,
    vital_sgns_height: nil,
    vital_sgns_height_lying: nil,
    vital_sgns_notes: nil,
    vital_sgns_pulse_rate: nil,
    vital_sgns_respiratory_rate: nil,
    vital_sgns_sat_val: nil,
    vital_sgns_tm: nil,
    vital_sgns_waist_val: nil,
    vital_sgns_weight_val: nil
  }

  def fixture(:vital_sign) do
    {:ok, vital_sign} = Assements.create_vital_sign(@create_attrs)
    vital_sign
  end

  describe "index" do
    test "lists all vital_signs", %{conn: conn} do
      conn = get(conn, Routes.vital_sign_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Vital signs"
    end
  end

  describe "new vital_sign" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.vital_sign_path(conn, :new))
      assert html_response(conn, 200) =~ "New Vital sign"
    end
  end

  describe "create vital_sign" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vital_sign_path(conn, :create), vital_sign: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.vital_sign_path(conn, :show, id)

      conn = get(conn, Routes.vital_sign_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Vital sign"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vital_sign_path(conn, :create), vital_sign: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vital sign"
    end
  end

  describe "edit vital_sign" do
    setup [:create_vital_sign]

    test "renders form for editing chosen vital_sign", %{conn: conn, vital_sign: vital_sign} do
      conn = get(conn, Routes.vital_sign_path(conn, :edit, vital_sign))
      assert html_response(conn, 200) =~ "Edit Vital sign"
    end
  end

  describe "update vital_sign" do
    setup [:create_vital_sign]

    test "redirects when data is valid", %{conn: conn, vital_sign: vital_sign} do
      conn =
        put(conn, Routes.vital_sign_path(conn, :update, vital_sign), vital_sign: @update_attrs)

      assert redirected_to(conn) == Routes.vital_sign_path(conn, :show, vital_sign)

      conn = get(conn, Routes.vital_sign_path(conn, :show, vital_sign))
      assert html_response(conn, 200) =~ "some updated vital_sgns_bmi"
    end

    test "renders errors when data is invalid", %{conn: conn, vital_sign: vital_sign} do
      conn =
        put(conn, Routes.vital_sign_path(conn, :update, vital_sign), vital_sign: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Vital sign"
    end
  end

  describe "delete vital_sign" do
    setup [:create_vital_sign]

    test "deletes chosen vital_sign", %{conn: conn, vital_sign: vital_sign} do
      conn = delete(conn, Routes.vital_sign_path(conn, :delete, vital_sign))
      assert redirected_to(conn) == Routes.vital_sign_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.vital_sign_path(conn, :show, vital_sign))
      end)
    end
  end

  defp create_vital_sign(_) do
    vital_sign = fixture(:vital_sign)
    {:ok, vital_sign: vital_sign}
  end
end
