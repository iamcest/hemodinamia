defmodule AngioWeb.Opts_sentenceControllerTest do
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

  def fixture(:opts_sentence) do
    {:ok, opts_sentence} = Canons.create_opts_sentence(@create_attrs)
    opts_sentence
  end

  describe "index" do
    test "lists all opts_sentences", %{conn: conn} do
      conn = get(conn, Routes.opts_sentence_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Opts sentences"
    end
  end

  describe "new opts_sentence" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.opts_sentence_path(conn, :new))
      assert html_response(conn, 200) =~ "New Opts sentence"
    end
  end

  describe "create opts_sentence" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.opts_sentence_path(conn, :create), opts_sentence: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.opts_sentence_path(conn, :show, id)

      conn = get(conn, Routes.opts_sentence_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Opts sentence"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.opts_sentence_path(conn, :create), opts_sentence: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Opts sentence"
    end
  end

  describe "edit opts_sentence" do
    setup [:create_opts_sentence]

    test "renders form for editing chosen opts_sentence", %{
      conn: conn,
      opts_sentence: opts_sentence
    } do
      conn = get(conn, Routes.opts_sentence_path(conn, :edit, opts_sentence))
      assert html_response(conn, 200) =~ "Edit Opts sentence"
    end
  end

  describe "update opts_sentence" do
    setup [:create_opts_sentence]

    test "redirects when data is valid", %{conn: conn, opts_sentence: opts_sentence} do
      conn =
        put(conn, Routes.opts_sentence_path(conn, :update, opts_sentence),
          opts_sentence: @update_attrs
        )

      assert redirected_to(conn) == Routes.opts_sentence_path(conn, :show, opts_sentence)

      conn = get(conn, Routes.opts_sentence_path(conn, :show, opts_sentence))
      assert html_response(conn, 200) =~ "some updated language"
    end

    test "renders errors when data is invalid", %{conn: conn, opts_sentence: opts_sentence} do
      conn =
        put(conn, Routes.opts_sentence_path(conn, :update, opts_sentence),
          opts_sentence: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Opts sentence"
    end
  end

  describe "delete opts_sentence" do
    setup [:create_opts_sentence]

    test "deletes chosen opts_sentence", %{conn: conn, opts_sentence: opts_sentence} do
      conn = delete(conn, Routes.opts_sentence_path(conn, :delete, opts_sentence))
      assert redirected_to(conn) == Routes.opts_sentence_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.opts_sentence_path(conn, :show, opts_sentence))
      end)
    end
  end

  defp create_opts_sentence(_) do
    opts_sentence = fixture(:opts_sentence)
    {:ok, opts_sentence: opts_sentence}
  end
end
