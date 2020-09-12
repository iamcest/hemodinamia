defmodule AngioWeb.Proc_episodeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    proc_epis_art_access_l_brachial: "some proc_epis_art_access_l_brachial",
    proc_epis_art_access_l_femoral: "some proc_epis_art_access_l_femoral",
    proc_epis_art_access_l_radial: "some proc_epis_art_access_l_radial",
    proc_epis_art_access_r_brachial: "some proc_epis_art_access_r_brachial",
    proc_epis_art_access_r_femoral: "some proc_epis_art_access_r_femoral",
    proc_epis_art_access_r_radial: "some proc_epis_art_access_r_radial",
    proc_epis_catheter_l_name: "some proc_epis_catheter_l_name",
    proc_epis_catheter_l_size: "some proc_epis_catheter_l_size",
    proc_epis_catheter_lv_name: "some proc_epis_catheter_lv_name",
    proc_epis_catheter_lv_size: "some proc_epis_catheter_lv_size",
    proc_epis_catheter_r_name: "some proc_epis_catheter_r_name",
    proc_epis_catheter_r_size: "some proc_epis_catheter_r_size",
    proc_epis_closure_device: "some proc_epis_closure_device",
    proc_epis_contrast_name: "some proc_epis_contrast_name",
    proc_epis_contrast_volume: "some proc_epis_contrast_volume",
    proc_epis_cor_machine: "some proc_epis_cor_machine",
    proc_epis_cor_machine_id: "some proc_epis_cor_machine_id",
    proc_epis_cor_machine_loc: "some proc_epis_cor_machine_loc",
    proc_epis_icd10_pcs_1: "some proc_epis_icd10_pcs_1",
    proc_epis_icd10_pcs_2: "some proc_epis_icd10_pcs_2",
    proc_epis_icd10_pcs_3: "some proc_epis_icd10_pcs_3",
    proc_epis_icd10_pcs_4: "some proc_epis_icd10_pcs_4",
    proc_epis_notes: "some proc_epis_notes",
    proc_epis_prim_operator_lname: "some proc_epis_prim_operator_lname",
    proc_epis_prim_operator_mname: "some proc_epis_prim_operator_mname",
    proc_epis_prim_operator_npi: "some proc_epis_prim_operator_npi",
    proc_epis_prim_operetor_fname: "some proc_epis_prim_operetor_fname",
    proc_epis_refer_person: "some proc_epis_refer_person",
    proc_epis_request_dt: ~D[2010-04-17],
    proc_epis_request_tm: ~T[14:00:00]
  }
  @update_attrs %{
    proc_epis_art_access_l_brachial: "some updated proc_epis_art_access_l_brachial",
    proc_epis_art_access_l_femoral: "some updated proc_epis_art_access_l_femoral",
    proc_epis_art_access_l_radial: "some updated proc_epis_art_access_l_radial",
    proc_epis_art_access_r_brachial: "some updated proc_epis_art_access_r_brachial",
    proc_epis_art_access_r_femoral: "some updated proc_epis_art_access_r_femoral",
    proc_epis_art_access_r_radial: "some updated proc_epis_art_access_r_radial",
    proc_epis_catheter_l_name: "some updated proc_epis_catheter_l_name",
    proc_epis_catheter_l_size: "some updated proc_epis_catheter_l_size",
    proc_epis_catheter_lv_name: "some updated proc_epis_catheter_lv_name",
    proc_epis_catheter_lv_size: "some updated proc_epis_catheter_lv_size",
    proc_epis_catheter_r_name: "some updated proc_epis_catheter_r_name",
    proc_epis_catheter_r_size: "some updated proc_epis_catheter_r_size",
    proc_epis_closure_device: "some updated proc_epis_closure_device",
    proc_epis_contrast_name: "some updated proc_epis_contrast_name",
    proc_epis_contrast_volume: "some updated proc_epis_contrast_volume",
    proc_epis_cor_machine: "some updated proc_epis_cor_machine",
    proc_epis_cor_machine_id: "some updated proc_epis_cor_machine_id",
    proc_epis_cor_machine_loc: "some updated proc_epis_cor_machine_loc",
    proc_epis_icd10_pcs_1: "some updated proc_epis_icd10_pcs_1",
    proc_epis_icd10_pcs_2: "some updated proc_epis_icd10_pcs_2",
    proc_epis_icd10_pcs_3: "some updated proc_epis_icd10_pcs_3",
    proc_epis_icd10_pcs_4: "some updated proc_epis_icd10_pcs_4",
    proc_epis_notes: "some updated proc_epis_notes",
    proc_epis_prim_operator_lname: "some updated proc_epis_prim_operator_lname",
    proc_epis_prim_operator_mname: "some updated proc_epis_prim_operator_mname",
    proc_epis_prim_operator_npi: "some updated proc_epis_prim_operator_npi",
    proc_epis_prim_operetor_fname: "some updated proc_epis_prim_operetor_fname",
    proc_epis_refer_person: "some updated proc_epis_refer_person",
    proc_epis_request_dt: ~D[2011-05-18],
    proc_epis_request_tm: ~T[15:01:01]
  }
  @invalid_attrs %{
    proc_epis_art_access_l_brachial: nil,
    proc_epis_art_access_l_femoral: nil,
    proc_epis_art_access_l_radial: nil,
    proc_epis_art_access_r_brachial: nil,
    proc_epis_art_access_r_femoral: nil,
    proc_epis_art_access_r_radial: nil,
    proc_epis_catheter_l_name: nil,
    proc_epis_catheter_l_size: nil,
    proc_epis_catheter_lv_name: nil,
    proc_epis_catheter_lv_size: nil,
    proc_epis_catheter_r_name: nil,
    proc_epis_catheter_r_size: nil,
    proc_epis_closure_device: nil,
    proc_epis_contrast_name: nil,
    proc_epis_contrast_volume: nil,
    proc_epis_cor_machine: nil,
    proc_epis_cor_machine_id: nil,
    proc_epis_cor_machine_loc: nil,
    proc_epis_icd10_pcs_1: nil,
    proc_epis_icd10_pcs_2: nil,
    proc_epis_icd10_pcs_3: nil,
    proc_epis_icd10_pcs_4: nil,
    proc_epis_notes: nil,
    proc_epis_prim_operator_lname: nil,
    proc_epis_prim_operator_mname: nil,
    proc_epis_prim_operator_npi: nil,
    proc_epis_prim_operetor_fname: nil,
    proc_epis_refer_person: nil,
    proc_epis_request_dt: nil,
    proc_epis_request_tm: nil
  }

  def fixture(:proc_episode) do
    {:ok, proc_episode} = Caths.create_proc_episode(@create_attrs)
    proc_episode
  end

  describe "index" do
    test "lists all proc_episodes", %{conn: conn} do
      conn = get(conn, Routes.proc_episode_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Proc episodes"
    end
  end

  describe "new proc_episode" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.proc_episode_path(conn, :new))
      assert html_response(conn, 200) =~ "New Proc episode"
    end
  end

  describe "create proc_episode" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proc_episode_path(conn, :create), proc_episode: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.proc_episode_path(conn, :show, id)

      conn = get(conn, Routes.proc_episode_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Proc episode"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proc_episode_path(conn, :create), proc_episode: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Proc episode"
    end
  end

  describe "edit proc_episode" do
    setup [:create_proc_episode]

    test "renders form for editing chosen proc_episode", %{conn: conn, proc_episode: proc_episode} do
      conn = get(conn, Routes.proc_episode_path(conn, :edit, proc_episode))
      assert html_response(conn, 200) =~ "Edit Proc episode"
    end
  end

  describe "update proc_episode" do
    setup [:create_proc_episode]

    test "redirects when data is valid", %{conn: conn, proc_episode: proc_episode} do
      conn =
        put(conn, Routes.proc_episode_path(conn, :update, proc_episode),
          proc_episode: @update_attrs
        )

      assert redirected_to(conn) == Routes.proc_episode_path(conn, :show, proc_episode)

      conn = get(conn, Routes.proc_episode_path(conn, :show, proc_episode))
      assert html_response(conn, 200) =~ "some updated proc_epis_art_access_l_brachial"
    end

    test "renders errors when data is invalid", %{conn: conn, proc_episode: proc_episode} do
      conn =
        put(conn, Routes.proc_episode_path(conn, :update, proc_episode),
          proc_episode: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Proc episode"
    end
  end

  describe "delete proc_episode" do
    setup [:create_proc_episode]

    test "deletes chosen proc_episode", %{conn: conn, proc_episode: proc_episode} do
      conn = delete(conn, Routes.proc_episode_path(conn, :delete, proc_episode))
      assert redirected_to(conn) == Routes.proc_episode_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.proc_episode_path(conn, :show, proc_episode))
      end)
    end
  end

  defp create_proc_episode(_) do
    proc_episode = fixture(:proc_episode)
    {:ok, proc_episode: proc_episode}
  end
end
