defmodule AngioWeb.Echo_left_atriumControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Ivestigations

  @create_attrs %{
    ela_appearance_trasplantation_yn: true,
    ela_area_4ch_2d_us: "some ela_area_4ch_2d_us",
    ela_asd_yn: true,
    ela_chatheter_loc_desc: "some ela_chatheter_loc_desc",
    ela_chatheter_yn: true,
    ela_cor_triatrium_yn: true,
    ela_diam_ap_val: "some ela_diam_ap_val",
    ela_diam_ml_val: "some ela_diam_ml_val",
    ela_diam_si_val: "some ela_diam_si_val",
    ela_mas_attachment_site: "some ela_mas_attachment_site",
    ela_mas_location_desc: "some ela_mas_location_desc",
    ela_mas_yn: true,
    ela_notes: "some ela_notes",
    ela_pum_veins_thrombus_tumour_yn: true,
    ela_spontaneous_contrast_loc: "some ela_spontaneous_contrast_loc",
    ela_spontaneous_contrast_persist: "some ela_spontaneous_contrast_persist",
    ela_spontaneous_contrast_yn: true,
    ela_thromus_tumour_body_loc: "some ela_thromus_tumour_body_loc",
    ela_volume_desc: "some ela_volume_desc",
    ela_volume_index: "some ela_volume_index",
    ela_volume_method: "some ela_volume_method",
    ela_volume_val: "some ela_volume_val"
  }
  @update_attrs %{
    ela_appearance_trasplantation_yn: false,
    ela_area_4ch_2d_us: "some updated ela_area_4ch_2d_us",
    ela_asd_yn: false,
    ela_chatheter_loc_desc: "some updated ela_chatheter_loc_desc",
    ela_chatheter_yn: false,
    ela_cor_triatrium_yn: false,
    ela_diam_ap_val: "some updated ela_diam_ap_val",
    ela_diam_ml_val: "some updated ela_diam_ml_val",
    ela_diam_si_val: "some updated ela_diam_si_val",
    ela_mas_attachment_site: "some updated ela_mas_attachment_site",
    ela_mas_location_desc: "some updated ela_mas_location_desc",
    ela_mas_yn: false,
    ela_notes: "some updated ela_notes",
    ela_pum_veins_thrombus_tumour_yn: false,
    ela_spontaneous_contrast_loc: "some updated ela_spontaneous_contrast_loc",
    ela_spontaneous_contrast_persist: "some updated ela_spontaneous_contrast_persist",
    ela_spontaneous_contrast_yn: false,
    ela_thromus_tumour_body_loc: "some updated ela_thromus_tumour_body_loc",
    ela_volume_desc: "some updated ela_volume_desc",
    ela_volume_index: "some updated ela_volume_index",
    ela_volume_method: "some updated ela_volume_method",
    ela_volume_val: "some updated ela_volume_val"
  }
  @invalid_attrs %{
    ela_appearance_trasplantation_yn: nil,
    ela_area_4ch_2d_us: nil,
    ela_asd_yn: nil,
    ela_chatheter_loc_desc: nil,
    ela_chatheter_yn: nil,
    ela_cor_triatrium_yn: nil,
    ela_diam_ap_val: nil,
    ela_diam_ml_val: nil,
    ela_diam_si_val: nil,
    ela_mas_attachment_site: nil,
    ela_mas_location_desc: nil,
    ela_mas_yn: nil,
    ela_notes: nil,
    ela_pum_veins_thrombus_tumour_yn: nil,
    ela_spontaneous_contrast_loc: nil,
    ela_spontaneous_contrast_persist: nil,
    ela_spontaneous_contrast_yn: nil,
    ela_thromus_tumour_body_loc: nil,
    ela_volume_desc: nil,
    ela_volume_index: nil,
    ela_volume_method: nil,
    ela_volume_val: nil
  }

  def fixture(:echo_left_atrium) do
    {:ok, echo_left_atrium} = Ivestigations.create_echo_left_atrium(@create_attrs)
    echo_left_atrium
  end

  describe "index" do
    test "lists all echo_left_atriums", %{conn: conn} do
      conn = get(conn, Routes.echo_left_atrium_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Echo left atriums"
    end
  end

  describe "new echo_left_atrium" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.echo_left_atrium_path(conn, :new))
      assert html_response(conn, 200) =~ "New Echo left atrium"
    end
  end

  describe "create echo_left_atrium" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.echo_left_atrium_path(conn, :create), echo_left_atrium: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.echo_left_atrium_path(conn, :show, id)

      conn = get(conn, Routes.echo_left_atrium_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Echo left atrium"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.echo_left_atrium_path(conn, :create), echo_left_atrium: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Echo left atrium"
    end
  end

  describe "edit echo_left_atrium" do
    setup [:create_echo_left_atrium]

    test "renders form for editing chosen echo_left_atrium", %{
      conn: conn,
      echo_left_atrium: echo_left_atrium
    } do
      conn = get(conn, Routes.echo_left_atrium_path(conn, :edit, echo_left_atrium))
      assert html_response(conn, 200) =~ "Edit Echo left atrium"
    end
  end

  describe "update echo_left_atrium" do
    setup [:create_echo_left_atrium]

    test "redirects when data is valid", %{conn: conn, echo_left_atrium: echo_left_atrium} do
      conn =
        put(conn, Routes.echo_left_atrium_path(conn, :update, echo_left_atrium),
          echo_left_atrium: @update_attrs
        )

      assert redirected_to(conn) == Routes.echo_left_atrium_path(conn, :show, echo_left_atrium)

      conn = get(conn, Routes.echo_left_atrium_path(conn, :show, echo_left_atrium))
      assert html_response(conn, 200) =~ "some updated ela_area_4ch_2d_us"
    end

    test "renders errors when data is invalid", %{conn: conn, echo_left_atrium: echo_left_atrium} do
      conn =
        put(conn, Routes.echo_left_atrium_path(conn, :update, echo_left_atrium),
          echo_left_atrium: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Echo left atrium"
    end
  end

  describe "delete echo_left_atrium" do
    setup [:create_echo_left_atrium]

    test "deletes chosen echo_left_atrium", %{conn: conn, echo_left_atrium: echo_left_atrium} do
      conn = delete(conn, Routes.echo_left_atrium_path(conn, :delete, echo_left_atrium))
      assert redirected_to(conn) == Routes.echo_left_atrium_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.echo_left_atrium_path(conn, :show, echo_left_atrium))
      end)
    end
  end

  defp create_echo_left_atrium(_) do
    echo_left_atrium = fixture(:echo_left_atrium)
    {:ok, echo_left_atrium: echo_left_atrium}
  end
end
