defmodule AngioWeb.Cor_mediaControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Cor_mediae

  @create_attrs %{
    desc: "some desc",
    mime_name: "some mime_name",
    mime_type: "some mime_type",
    notes: "some notes",
    patient_id: 42,
    radlex_1: "some radlex_1",
    radlex_2: "some radlex_2",
    reference: "some reference"
  }
  @update_attrs %{
    desc: "some updated desc",
    mime_name: "some updated mime_name",
    mime_type: "some updated mime_type",
    notes: "some updated notes",
    patient_id: 43,
    radlex_1: "some updated radlex_1",
    radlex_2: "some updated radlex_2",
    reference: "some updated reference"
  }
  @invalid_attrs %{
    desc: nil,
    mime_name: nil,
    mime_type: nil,
    notes: nil,
    patient_id: nil,
    radlex_1: nil,
    radlex_2: nil,
    reference: nil
  }

  def fixture(:cor_media) do
    {:ok, cor_media} = Cor_mediae.create_cor_media(@create_attrs)
    cor_media
  end

  describe "index" do
    test "lists all cor_mediae", %{conn: conn} do
      conn = get(conn, Routes.cor_media_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cor mediae"
    end
  end

  describe "new cor_media" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cor_media_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cor media"
    end
  end

  describe "create cor_media" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cor_media_path(conn, :create), cor_media: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cor_media_path(conn, :show, id)

      conn = get(conn, Routes.cor_media_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cor media"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cor_media_path(conn, :create), cor_media: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cor media"
    end
  end

  describe "edit cor_media" do
    setup [:create_cor_media]

    test "renders form for editing chosen cor_media", %{conn: conn, cor_media: cor_media} do
      conn = get(conn, Routes.cor_media_path(conn, :edit, cor_media))
      assert html_response(conn, 200) =~ "Edit Cor media"
    end
  end

  describe "update cor_media" do
    setup [:create_cor_media]

    test "redirects when data is valid", %{conn: conn, cor_media: cor_media} do
      conn = put(conn, Routes.cor_media_path(conn, :update, cor_media), cor_media: @update_attrs)
      assert redirected_to(conn) == Routes.cor_media_path(conn, :show, cor_media)

      conn = get(conn, Routes.cor_media_path(conn, :show, cor_media))
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, cor_media: cor_media} do
      conn = put(conn, Routes.cor_media_path(conn, :update, cor_media), cor_media: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cor media"
    end
  end

  describe "delete cor_media" do
    setup [:create_cor_media]

    test "deletes chosen cor_media", %{conn: conn, cor_media: cor_media} do
      conn = delete(conn, Routes.cor_media_path(conn, :delete, cor_media))
      assert redirected_to(conn) == Routes.cor_media_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cor_media_path(conn, :show, cor_media))
      end)
    end
  end

  defp create_cor_media(_) do
    cor_media = fixture(:cor_media)
    {:ok, cor_media: cor_media}
  end
end
