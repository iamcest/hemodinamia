defmodule AngioWeb.Chd_care_episodeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Congenitals

  @create_attrs %{
    chd_arrival_dt: ~D[2010-04-17],
    chd_cath_prior_recent_dt: ~D[2010-04-17],
    chd_cath_proc_recent_1_i: "some chd_cath_proc_recent_1_i",
    chd_cath_proc_recent_2_id: "some chd_cath_proc_recent_2_id",
    chd_cath_proc_recent_3_id: "some chd_cath_proc_recent_3_id",
    chd_cath_proc_recent_4_id: "some chd_cath_proc_recent_4_id",
    chd_cath_proc_recent_id: [],
    chd_caths_prior_num: "some chd_caths_prior_num",
    chd_caths_prior_yn: true,
    chd_country_of_residence: "some chd_country_of_residence",
    chd_episode_notes: "some chd_episode_notes",
    chd_gestational_age: "some chd_gestational_age",
    chd_premature_birth_yn: true,
    chd_pt_international_yn: true,
    chd_research_study_yn: true,
    chd_surg_prior_1_id: "some chd_surg_prior_1_id",
    chd_surg_prior_2_id: "some chd_surg_prior_2_id",
    chd_surg_prior_3_id: "some chd_surg_prior_3_id",
    chd_surg_prior_4_id: "some chd_surg_prior_4_id",
    chd_surg_prior_id: [],
    chd_surg_prior_numstring: "some chd_surg_prior_numstring",
    chd_surg_prior_yn: true,
    chd_surg_recent_dt: ~D[2010-04-17],
    chd_weight_at_birth: "some chd_weight_at_birth",
    pt_restriction_yn: true,
    uni_hic_num: "some uni_hic_num",
    uni_insurance: "some uni_insurance",
    uni_insurance_non_us: true
  }
  @update_attrs %{
    chd_arrival_dt: ~D[2011-05-18],
    chd_cath_prior_recent_dt: ~D[2011-05-18],
    chd_cath_proc_recent_1_i: "some updated chd_cath_proc_recent_1_i",
    chd_cath_proc_recent_2_id: "some updated chd_cath_proc_recent_2_id",
    chd_cath_proc_recent_3_id: "some updated chd_cath_proc_recent_3_id",
    chd_cath_proc_recent_4_id: "some updated chd_cath_proc_recent_4_id",
    chd_cath_proc_recent_id: [],
    chd_caths_prior_num: "some updated chd_caths_prior_num",
    chd_caths_prior_yn: false,
    chd_country_of_residence: "some updated chd_country_of_residence",
    chd_episode_notes: "some updated chd_episode_notes",
    chd_gestational_age: "some updated chd_gestational_age",
    chd_premature_birth_yn: false,
    chd_pt_international_yn: false,
    chd_research_study_yn: false,
    chd_surg_prior_1_id: "some updated chd_surg_prior_1_id",
    chd_surg_prior_2_id: "some updated chd_surg_prior_2_id",
    chd_surg_prior_3_id: "some updated chd_surg_prior_3_id",
    chd_surg_prior_4_id: "some updated chd_surg_prior_4_id",
    chd_surg_prior_id: [],
    chd_surg_prior_numstring: "some updated chd_surg_prior_numstring",
    chd_surg_prior_yn: false,
    chd_surg_recent_dt: ~D[2011-05-18],
    chd_weight_at_birth: "some updated chd_weight_at_birth",
    pt_restriction_yn: false,
    uni_hic_num: "some updated uni_hic_num",
    uni_insurance: "some updated uni_insurance",
    uni_insurance_non_us: false
  }
  @invalid_attrs %{
    chd_arrival_dt: nil,
    chd_cath_prior_recent_dt: nil,
    chd_cath_proc_recent_1_i: nil,
    chd_cath_proc_recent_2_id: nil,
    chd_cath_proc_recent_3_id: nil,
    chd_cath_proc_recent_4_id: nil,
    chd_cath_proc_recent_id: nil,
    chd_caths_prior_num: nil,
    chd_caths_prior_yn: nil,
    chd_country_of_residence: nil,
    chd_episode_notes: nil,
    chd_gestational_age: nil,
    chd_premature_birth_yn: nil,
    chd_pt_international_yn: nil,
    chd_research_study_yn: nil,
    chd_surg_prior_1_id: nil,
    chd_surg_prior_2_id: nil,
    chd_surg_prior_3_id: nil,
    chd_surg_prior_4_id: nil,
    chd_surg_prior_id: nil,
    chd_surg_prior_numstring: nil,
    chd_surg_prior_yn: nil,
    chd_surg_recent_dt: nil,
    chd_weight_at_birth: nil,
    pt_restriction_yn: nil,
    uni_hic_num: nil,
    uni_insurance: nil,
    uni_insurance_non_us: nil
  }

  def fixture(:chd_care_episode) do
    {:ok, chd_care_episode} = Congenitals.create_chd_care_episode(@create_attrs)
    chd_care_episode
  end

  describe "index" do
    test "lists all chd_care_episodes", %{conn: conn} do
      conn = get(conn, Routes.chd_care_episode_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chd care episodes"
    end
  end

  describe "new chd_care_episode" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chd_care_episode_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chd care episode"
    end
  end

  describe "create chd_care_episode" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.chd_care_episode_path(conn, :create), chd_care_episode: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chd_care_episode_path(conn, :show, id)

      conn = get(conn, Routes.chd_care_episode_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chd care episode"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.chd_care_episode_path(conn, :create), chd_care_episode: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Chd care episode"
    end
  end

  describe "edit chd_care_episode" do
    setup [:create_chd_care_episode]

    test "renders form for editing chosen chd_care_episode", %{
      conn: conn,
      chd_care_episode: chd_care_episode
    } do
      conn = get(conn, Routes.chd_care_episode_path(conn, :edit, chd_care_episode))
      assert html_response(conn, 200) =~ "Edit Chd care episode"
    end
  end

  describe "update chd_care_episode" do
    setup [:create_chd_care_episode]

    test "redirects when data is valid", %{conn: conn, chd_care_episode: chd_care_episode} do
      conn =
        put(conn, Routes.chd_care_episode_path(conn, :update, chd_care_episode),
          chd_care_episode: @update_attrs
        )

      assert redirected_to(conn) == Routes.chd_care_episode_path(conn, :show, chd_care_episode)

      conn = get(conn, Routes.chd_care_episode_path(conn, :show, chd_care_episode))
      assert html_response(conn, 200) =~ "some updated chd_cath_proc_recent_1_i"
    end

    test "renders errors when data is invalid", %{conn: conn, chd_care_episode: chd_care_episode} do
      conn =
        put(conn, Routes.chd_care_episode_path(conn, :update, chd_care_episode),
          chd_care_episode: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Chd care episode"
    end
  end

  describe "delete chd_care_episode" do
    setup [:create_chd_care_episode]

    test "deletes chosen chd_care_episode", %{conn: conn, chd_care_episode: chd_care_episode} do
      conn = delete(conn, Routes.chd_care_episode_path(conn, :delete, chd_care_episode))
      assert redirected_to(conn) == Routes.chd_care_episode_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.chd_care_episode_path(conn, :show, chd_care_episode))
      end)
    end
  end

  defp create_chd_care_episode(_) do
    chd_care_episode = fixture(:chd_care_episode)
    {:ok, chd_care_episode: chd_care_episode}
  end
end
