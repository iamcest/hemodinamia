defmodule AngioWeb.Infect_historyControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Histories

  @create_attrs %{
    "": true,
    infh_endocarditis_type: "some infh_endocarditis_type",
    infh_endocarditis_yn: true,
    infh_hepatitis_b_yn: true,
    infh_hepatitis_c_yn: true,
    infh_histories_notes: "some infh_histories_notes",
    infh_hiv_yn: true,
    infh_influenza_vacc_dt: ~D[2010-04-17],
    infh_influenza_vacc_yn: "some infh_influenza_vacc_yn",
    infh_malaria_yn: true,
    infh_pneumococcal_vacc_dt: ~D[2010-04-17],
    infh_pneumococcal_vacc_yn: true,
    infh_pneumonia_yn: true,
    infh_tubercolosis_yn: true
  }
  @update_attrs %{
    "": false,
    infh_endocarditis_type: "some updated infh_endocarditis_type",
    infh_endocarditis_yn: false,
    infh_hepatitis_b_yn: false,
    infh_hepatitis_c_yn: false,
    infh_histories_notes: "some updated infh_histories_notes",
    infh_hiv_yn: false,
    infh_influenza_vacc_dt: ~D[2011-05-18],
    infh_influenza_vacc_yn: "some updated infh_influenza_vacc_yn",
    infh_malaria_yn: false,
    infh_pneumococcal_vacc_dt: ~D[2011-05-18],
    infh_pneumococcal_vacc_yn: false,
    infh_pneumonia_yn: false,
    infh_tubercolosis_yn: false
  }
  @invalid_attrs %{
    "": nil,
    infh_endocarditis_type: nil,
    infh_endocarditis_yn: nil,
    infh_hepatitis_b_yn: nil,
    infh_hepatitis_c_yn: nil,
    infh_histories_notes: nil,
    infh_hiv_yn: nil,
    infh_influenza_vacc_dt: nil,
    infh_influenza_vacc_yn: nil,
    infh_malaria_yn: nil,
    infh_pneumococcal_vacc_dt: nil,
    infh_pneumococcal_vacc_yn: nil,
    infh_pneumonia_yn: nil,
    infh_tubercolosis_yn: nil
  }

  def fixture(:infect_history) do
    {:ok, infect_history} = Histories.create_infect_history(@create_attrs)
    infect_history
  end

  describe "index" do
    test "lists all infect_histories", %{conn: conn} do
      conn = get(conn, Routes.infect_history_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Infect histories"
    end
  end

  describe "new infect_history" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.infect_history_path(conn, :new))
      assert html_response(conn, 200) =~ "New Infect history"
    end
  end

  describe "create infect_history" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.infect_history_path(conn, :create), infect_history: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.infect_history_path(conn, :show, id)

      conn = get(conn, Routes.infect_history_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Infect history"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.infect_history_path(conn, :create), infect_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Infect history"
    end
  end

  describe "edit infect_history" do
    setup [:create_infect_history]

    test "renders form for editing chosen infect_history", %{
      conn: conn,
      infect_history: infect_history
    } do
      conn = get(conn, Routes.infect_history_path(conn, :edit, infect_history))
      assert html_response(conn, 200) =~ "Edit Infect history"
    end
  end

  describe "update infect_history" do
    setup [:create_infect_history]

    test "redirects when data is valid", %{conn: conn, infect_history: infect_history} do
      conn =
        put(conn, Routes.infect_history_path(conn, :update, infect_history),
          infect_history: @update_attrs
        )

      assert redirected_to(conn) == Routes.infect_history_path(conn, :show, infect_history)

      conn = get(conn, Routes.infect_history_path(conn, :show, infect_history))
      assert html_response(conn, 200) =~ "some updated infh_endocarditis_type"
    end

    test "renders errors when data is invalid", %{conn: conn, infect_history: infect_history} do
      conn =
        put(conn, Routes.infect_history_path(conn, :update, infect_history),
          infect_history: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Infect history"
    end
  end

  describe "delete infect_history" do
    setup [:create_infect_history]

    test "deletes chosen infect_history", %{conn: conn, infect_history: infect_history} do
      conn = delete(conn, Routes.infect_history_path(conn, :delete, infect_history))
      assert redirected_to(conn) == Routes.infect_history_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.infect_history_path(conn, :show, infect_history))
      end)
    end
  end

  defp create_infect_history(_) do
    infect_history = fixture(:infect_history)
    {:ok, infect_history: infect_history}
  end
end
