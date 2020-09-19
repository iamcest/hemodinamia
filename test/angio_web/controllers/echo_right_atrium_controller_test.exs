defmodule AngioWeb.Echo_right_atriumControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{
    era_area_val: "some era_area_val",
    era_cath_wire_yn: true,
    era_chiari_prominent_yn: true,
    era_coronary_sinus_dilated_yn: true,
    era_eustachian_prominent_yn: true,
    era_ivc_thrombus_tumour_yn: true,
    era_max_diameter_val: "some era_max_diameter_val",
    era_ml_diameter_val: "some era_ml_diameter_val",
    era_notes: "some era_notes",
    era_persistent_svc_yn: true,
    era_septum_bowed_left_yn: true,
    era_si_diameter_val: "some era_si_diameter_val",
    era_size_volume_desc: "some era_size_volume_desc",
    era_size_volume_method: "some era_size_volume_method",
    era_svc_thrombus_tumour_yn: true,
    era_thrombus_tumour_yn: true,
    era_volume_val: "some era_volume_val"
  }
  @update_attrs %{
    era_area_val: "some updated era_area_val",
    era_cath_wire_yn: false,
    era_chiari_prominent_yn: false,
    era_coronary_sinus_dilated_yn: false,
    era_eustachian_prominent_yn: false,
    era_ivc_thrombus_tumour_yn: false,
    era_max_diameter_val: "some updated era_max_diameter_val",
    era_ml_diameter_val: "some updated era_ml_diameter_val",
    era_notes: "some updated era_notes",
    era_persistent_svc_yn: false,
    era_septum_bowed_left_yn: false,
    era_si_diameter_val: "some updated era_si_diameter_val",
    era_size_volume_desc: "some updated era_size_volume_desc",
    era_size_volume_method: "some updated era_size_volume_method",
    era_svc_thrombus_tumour_yn: false,
    era_thrombus_tumour_yn: false,
    era_volume_val: "some updated era_volume_val"
  }
  @invalid_attrs %{
    era_area_val: nil,
    era_cath_wire_yn: nil,
    era_chiari_prominent_yn: nil,
    era_coronary_sinus_dilated_yn: nil,
    era_eustachian_prominent_yn: nil,
    era_ivc_thrombus_tumour_yn: nil,
    era_max_diameter_val: nil,
    era_ml_diameter_val: nil,
    era_notes: nil,
    era_persistent_svc_yn: nil,
    era_septum_bowed_left_yn: nil,
    era_si_diameter_val: nil,
    era_size_volume_desc: nil,
    era_size_volume_method: nil,
    era_svc_thrombus_tumour_yn: nil,
    era_thrombus_tumour_yn: nil,
    era_volume_val: nil
  }

  def fixture(:echo_right_atrium) do
    {:ok, echo_right_atrium} = Ivestigations.create_echo_right_atrium(@create_attrs)
    echo_right_atrium
  end

  describe "index" do
    test "lists all echo_right_atriums", %{conn: conn} do
      conn = get(conn, Routes.echo_right_atrium_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Echo right atriums"
    end
  end

  describe "new echo_right_atrium" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.echo_right_atrium_path(conn, :new))
      assert html_response(conn, 200) =~ "New Echo right atrium"
    end
  end

  describe "create echo_right_atrium" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.echo_right_atrium_path(conn, :create), echo_right_atrium: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.echo_right_atrium_path(conn, :show, id)

      conn = get(conn, Routes.echo_right_atrium_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Echo right atrium"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.echo_right_atrium_path(conn, :create), echo_right_atrium: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Echo right atrium"
    end
  end

  describe "edit echo_right_atrium" do
    setup [:create_echo_right_atrium]

    test "renders form for editing chosen echo_right_atrium", %{
      conn: conn,
      echo_right_atrium: echo_right_atrium
    } do
      conn = get(conn, Routes.echo_right_atrium_path(conn, :edit, echo_right_atrium))
      assert html_response(conn, 200) =~ "Edit Echo right atrium"
    end
  end

  describe "update echo_right_atrium" do
    setup [:create_echo_right_atrium]

    test "redirects when data is valid", %{conn: conn, echo_right_atrium: echo_right_atrium} do
      conn =
        put(conn, Routes.echo_right_atrium_path(conn, :update, echo_right_atrium),
          echo_right_atrium: @update_attrs
        )

      assert redirected_to(conn) == Routes.echo_right_atrium_path(conn, :show, echo_right_atrium)

      conn = get(conn, Routes.echo_right_atrium_path(conn, :show, echo_right_atrium))
      assert html_response(conn, 200) =~ "some updated era_area_val"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      echo_right_atrium: echo_right_atrium
    } do
      conn =
        put(conn, Routes.echo_right_atrium_path(conn, :update, echo_right_atrium),
          echo_right_atrium: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Echo right atrium"
    end
  end

  describe "delete echo_right_atrium" do
    setup [:create_echo_right_atrium]

    test "deletes chosen echo_right_atrium", %{conn: conn, echo_right_atrium: echo_right_atrium} do
      conn = delete(conn, Routes.echo_right_atrium_path(conn, :delete, echo_right_atrium))
      assert redirected_to(conn) == Routes.echo_right_atrium_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.echo_right_atrium_path(conn, :show, echo_right_atrium))
      end)
    end
  end

  defp create_echo_right_atrium(_) do
    echo_right_atrium = fixture(:echo_right_atrium)
    {:ok, echo_right_atrium: echo_right_atrium}
  end
end
