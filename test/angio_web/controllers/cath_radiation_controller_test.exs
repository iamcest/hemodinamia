defmodule AngioWeb.Cath_radiationControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    car_area_product_units: "some car_area_product_units",
    car_comulative_kerma: "some car_comulative_kerma",
    car_dose_area_meas_method: "some car_dose_area_meas_method",
    car_dose_area_product: "some car_dose_area_product",
    car_fluoro_time: "some car_fluoro_time",
    car_notes: "some car_notes",
    patient_id: 42
  }
  @update_attrs %{
    car_area_product_units: "some updated car_area_product_units",
    car_comulative_kerma: "some updated car_comulative_kerma",
    car_dose_area_meas_method: "some updated car_dose_area_meas_method",
    car_dose_area_product: "some updated car_dose_area_product",
    car_fluoro_time: "some updated car_fluoro_time",
    car_notes: "some updated car_notes",
    patient_id: 43
  }
  @invalid_attrs %{
    car_area_product_units: nil,
    car_comulative_kerma: nil,
    car_dose_area_meas_method: nil,
    car_dose_area_product: nil,
    car_fluoro_time: nil,
    car_notes: nil,
    patient_id: nil
  }

  def fixture(:cath_radiation) do
    {:ok, cath_radiation} = Caths.create_cath_radiation(@create_attrs)
    cath_radiation
  end

  describe "index" do
    test "lists all cath_radiations", %{conn: conn} do
      conn = get(conn, Routes.cath_radiation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath radiations"
    end
  end

  describe "new cath_radiation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_radiation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath radiation"
    end
  end

  describe "create cath_radiation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_radiation_path(conn, :create), cath_radiation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_radiation_path(conn, :show, id)

      conn = get(conn, Routes.cath_radiation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath radiation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_radiation_path(conn, :create), cath_radiation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath radiation"
    end
  end

  describe "edit cath_radiation" do
    setup [:create_cath_radiation]

    test "renders form for editing chosen cath_radiation", %{
      conn: conn,
      cath_radiation: cath_radiation
    } do
      conn = get(conn, Routes.cath_radiation_path(conn, :edit, cath_radiation))
      assert html_response(conn, 200) =~ "Edit Cath radiation"
    end
  end

  describe "update cath_radiation" do
    setup [:create_cath_radiation]

    test "redirects when data is valid", %{conn: conn, cath_radiation: cath_radiation} do
      conn =
        put(conn, Routes.cath_radiation_path(conn, :update, cath_radiation),
          cath_radiation: @update_attrs
        )

      assert redirected_to(conn) == Routes.cath_radiation_path(conn, :show, cath_radiation)

      conn = get(conn, Routes.cath_radiation_path(conn, :show, cath_radiation))
      assert html_response(conn, 200) =~ "some updated car_area_product_units"
    end

    test "renders errors when data is invalid", %{conn: conn, cath_radiation: cath_radiation} do
      conn =
        put(conn, Routes.cath_radiation_path(conn, :update, cath_radiation),
          cath_radiation: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Cath radiation"
    end
  end

  describe "delete cath_radiation" do
    setup [:create_cath_radiation]

    test "deletes chosen cath_radiation", %{conn: conn, cath_radiation: cath_radiation} do
      conn = delete(conn, Routes.cath_radiation_path(conn, :delete, cath_radiation))
      assert redirected_to(conn) == Routes.cath_radiation_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cath_radiation_path(conn, :show, cath_radiation))
      end)
    end
  end

  defp create_cath_radiation(_) do
    cath_radiation = fixture(:cath_radiation)
    {:ok, cath_radiation: cath_radiation}
  end
end
