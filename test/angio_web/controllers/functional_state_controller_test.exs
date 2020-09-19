defmodule AngioWeb.Functional_stateControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Assements

  @create_attrs %{
    funs_basic_adl: "some funs_basic_adl",
    funs_cognition_level: "some funs_cognition_level",
    funs_frailty_scale_csha: "some funs_frailty_scale_csha",
    funs_katz_index: "some funs_katz_index",
    funs_kccq12_score: "some funs_kccq12_score",
    funs_notes: "some funs_notes",
    funs_status_assess_dt: ~D[2010-04-17],
    funs_stroke_rankin_dt: ~D[2010-04-17],
    funs_stroke_rankin_modified: "some funs_stroke_rankin_modified",
    funs_walking_level: "some funs_walking_level"
  }
  @update_attrs %{
    funs_basic_adl: "some updated funs_basic_adl",
    funs_cognition_level: "some updated funs_cognition_level",
    funs_frailty_scale_csha: "some updated funs_frailty_scale_csha",
    funs_katz_index: "some updated funs_katz_index",
    funs_kccq12_score: "some updated funs_kccq12_score",
    funs_notes: "some updated funs_notes",
    funs_status_assess_dt: ~D[2011-05-18],
    funs_stroke_rankin_dt: ~D[2011-05-18],
    funs_stroke_rankin_modified: "some updated funs_stroke_rankin_modified",
    funs_walking_level: "some updated funs_walking_level"
  }
  @invalid_attrs %{
    funs_basic_adl: nil,
    funs_cognition_level: nil,
    funs_frailty_scale_csha: nil,
    funs_katz_index: nil,
    funs_kccq12_score: nil,
    funs_notes: nil,
    funs_status_assess_dt: nil,
    funs_stroke_rankin_dt: nil,
    funs_stroke_rankin_modified: nil,
    funs_walking_level: nil
  }

  def fixture(:functional_state) do
    {:ok, functional_state} = Assements.create_functional_state(@create_attrs)
    functional_state
  end

  describe "index" do
    test "lists all functional_states", %{conn: conn} do
      conn = get(conn, Routes.functional_state_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Functional states"
    end
  end

  describe "new functional_state" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.functional_state_path(conn, :new))
      assert html_response(conn, 200) =~ "New Functional state"
    end
  end

  describe "create functional_state" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.functional_state_path(conn, :create), functional_state: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.functional_state_path(conn, :show, id)

      conn = get(conn, Routes.functional_state_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Functional state"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.functional_state_path(conn, :create), functional_state: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Functional state"
    end
  end

  describe "edit functional_state" do
    setup [:create_functional_state]

    test "renders form for editing chosen functional_state", %{
      conn: conn,
      functional_state: functional_state
    } do
      conn = get(conn, Routes.functional_state_path(conn, :edit, functional_state))
      assert html_response(conn, 200) =~ "Edit Functional state"
    end
  end

  describe "update functional_state" do
    setup [:create_functional_state]

    test "redirects when data is valid", %{conn: conn, functional_state: functional_state} do
      conn =
        put(conn, Routes.functional_state_path(conn, :update, functional_state),
          functional_state: @update_attrs
        )

      assert redirected_to(conn) == Routes.functional_state_path(conn, :show, functional_state)

      conn = get(conn, Routes.functional_state_path(conn, :show, functional_state))
      assert html_response(conn, 200) =~ "some updated funs_basic_adl"
    end

    test "renders errors when data is invalid", %{conn: conn, functional_state: functional_state} do
      conn =
        put(conn, Routes.functional_state_path(conn, :update, functional_state),
          functional_state: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Functional state"
    end
  end

  describe "delete functional_state" do
    setup [:create_functional_state]

    test "deletes chosen functional_state", %{conn: conn, functional_state: functional_state} do
      conn = delete(conn, Routes.functional_state_path(conn, :delete, functional_state))
      assert redirected_to(conn) == Routes.functional_state_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.functional_state_path(conn, :show, functional_state))
      end)
    end
  end

  defp create_functional_state(_) do
    functional_state = fixture(:functional_state)
    {:ok, functional_state: functional_state}
  end
end
