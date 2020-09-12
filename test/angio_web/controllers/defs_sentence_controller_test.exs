defmodule AngioWeb.Defs_sentenceControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Canons

  @create_attrs %{
    definition_id: 42,
    language: "some language",
    note: "some note",
    sentence: "some sentence"
  }
  @update_attrs %{
    definition_id: 43,
    language: "some updated language",
    note: "some updated note",
    sentence: "some updated sentence"
  }
  @invalid_attrs %{definition_id: nil, language: nil, note: nil, sentence: nil}

  def fixture(:defs_sentence) do
    {:ok, defs_sentence} = Canons.create_defs_sentence(@create_attrs)
    defs_sentence
  end

  describe "index" do
    test "lists all defs_sentences", %{conn: conn} do
      conn = get(conn, Routes.defs_sentence_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Defs sentences"
    end
  end

  describe "new defs_sentence" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.defs_sentence_path(conn, :new))
      assert html_response(conn, 200) =~ "New Defs sentence"
    end
  end

  describe "create defs_sentence" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.defs_sentence_path(conn, :create), defs_sentence: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.defs_sentence_path(conn, :show, id)

      conn = get(conn, Routes.defs_sentence_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Defs sentence"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.defs_sentence_path(conn, :create), defs_sentence: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Defs sentence"
    end
  end

  describe "edit defs_sentence" do
    setup [:create_defs_sentence]

    test "renders form for editing chosen defs_sentence", %{
      conn: conn,
      defs_sentence: defs_sentence
    } do
      conn = get(conn, Routes.defs_sentence_path(conn, :edit, defs_sentence))
      assert html_response(conn, 200) =~ "Edit Defs sentence"
    end
  end

  describe "update defs_sentence" do
    setup [:create_defs_sentence]

    test "redirects when data is valid", %{conn: conn, defs_sentence: defs_sentence} do
      conn =
        put(conn, Routes.defs_sentence_path(conn, :update, defs_sentence),
          defs_sentence: @update_attrs
        )

      assert redirected_to(conn) == Routes.defs_sentence_path(conn, :show, defs_sentence)

      conn = get(conn, Routes.defs_sentence_path(conn, :show, defs_sentence))
      assert html_response(conn, 200) =~ "some updated language"
    end

    test "renders errors when data is invalid", %{conn: conn, defs_sentence: defs_sentence} do
      conn =
        put(conn, Routes.defs_sentence_path(conn, :update, defs_sentence),
          defs_sentence: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Defs sentence"
    end
  end

  describe "delete defs_sentence" do
    setup [:create_defs_sentence]

    test "deletes chosen defs_sentence", %{conn: conn, defs_sentence: defs_sentence} do
      conn = delete(conn, Routes.defs_sentence_path(conn, :delete, defs_sentence))
      assert redirected_to(conn) == Routes.defs_sentence_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.defs_sentence_path(conn, :show, defs_sentence))
      end)
    end
  end

  defp create_defs_sentence(_) do
    defs_sentence = fixture(:defs_sentence)
    {:ok, defs_sentence: defs_sentence}
  end
end
