defmodule AngioWeb.Care_episodeControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Caths

  @create_attrs %{
    caepsds_arrival_dt: ~D[2010-04-17],
    caepsds_arrival_location: "some caepsds_arrival_location",
    caepsds_arrival_tm: ~T[14:00:00],
    caepsds_city: "some caepsds_city",
    caepsds_institution_id: "some caepsds_institution_id",
    caepsds_notes: "some caepsds_notes",
    caepsds_phone_home: "some caepsds_phone_home",
    caepsds_phone_mobile: "some caepsds_phone_mobile",
    caepsds_photo: "some caepsds_photo",
    caepsds_post_box: "some caepsds_post_box",
    caepsds_provider_fname: "some caepsds_provider_fname",
    caepsds_provider_lname: "some caepsds_provider_lname",
    caepsds_provider_mname: "some caepsds_provider_mname",
    caepsds_provider_npi: "some caepsds_provider_npi",
    caepsds_street: "some caepsds_street",
    caepsds_street_num: "some caepsds_street_num",
    caepsds_telecom: "some caepsds_telecom",
    caepsds_zip: "some caepsds_zip",
    caepsds_zip_na: true,
    parent_id: 42,
    patient_id: 42,
    pt_restriction_yn: true,
    uni_hic: "some uni_hic",
    uni_insurance: "some uni_insurance",
    uni_insurance_non_us: true
  }
  @update_attrs %{
    caepsds_arrival_dt: ~D[2011-05-18],
    caepsds_arrival_location: "some updated caepsds_arrival_location",
    caepsds_arrival_tm: ~T[15:01:01],
    caepsds_city: "some updated caepsds_city",
    caepsds_institution_id: "some updated caepsds_institution_id",
    caepsds_notes: "some updated caepsds_notes",
    caepsds_phone_home: "some updated caepsds_phone_home",
    caepsds_phone_mobile: "some updated caepsds_phone_mobile",
    caepsds_photo: "some updated caepsds_photo",
    caepsds_post_box: "some updated caepsds_post_box",
    caepsds_provider_fname: "some updated caepsds_provider_fname",
    caepsds_provider_lname: "some updated caepsds_provider_lname",
    caepsds_provider_mname: "some updated caepsds_provider_mname",
    caepsds_provider_npi: "some updated caepsds_provider_npi",
    caepsds_street: "some updated caepsds_street",
    caepsds_street_num: "some updated caepsds_street_num",
    caepsds_telecom: "some updated caepsds_telecom",
    caepsds_zip: "some updated caepsds_zip",
    caepsds_zip_na: false,
    parent_id: 43,
    patient_id: 43,
    pt_restriction_yn: false,
    uni_hic: "some updated uni_hic",
    uni_insurance: "some updated uni_insurance",
    uni_insurance_non_us: false
  }
  @invalid_attrs %{
    caepsds_arrival_dt: nil,
    caepsds_arrival_location: nil,
    caepsds_arrival_tm: nil,
    caepsds_city: nil,
    caepsds_institution_id: nil,
    caepsds_notes: nil,
    caepsds_phone_home: nil,
    caepsds_phone_mobile: nil,
    caepsds_photo: nil,
    caepsds_post_box: nil,
    caepsds_provider_fname: nil,
    caepsds_provider_lname: nil,
    caepsds_provider_mname: nil,
    caepsds_provider_npi: nil,
    caepsds_street: nil,
    caepsds_street_num: nil,
    caepsds_telecom: nil,
    caepsds_zip: nil,
    caepsds_zip_na: nil,
    parent_id: nil,
    patient_id: nil,
    pt_restriction_yn: nil,
    uni_hic: nil,
    uni_insurance: nil,
    uni_insurance_non_us: nil
  }

  def fixture(:care_episode) do
    {:ok, care_episode} = Caths.create_care_episode(@create_attrs)
    care_episode
  end

  describe "index" do
    test "lists all care_episodes", %{conn: conn} do
      conn = get(conn, Routes.care_episode_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Care episodes"
    end
  end

  describe "new care_episode" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.care_episode_path(conn, :new))
      assert html_response(conn, 200) =~ "New Care episode"
    end
  end

  describe "create care_episode" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.care_episode_path(conn, :create), care_episode: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.care_episode_path(conn, :show, id)

      conn = get(conn, Routes.care_episode_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Care episode"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.care_episode_path(conn, :create), care_episode: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Care episode"
    end
  end

  describe "edit care_episode" do
    setup [:create_care_episode]

    test "renders form for editing chosen care_episode", %{conn: conn, care_episode: care_episode} do
      conn = get(conn, Routes.care_episode_path(conn, :edit, care_episode))
      assert html_response(conn, 200) =~ "Edit Care episode"
    end
  end

  describe "update care_episode" do
    setup [:create_care_episode]

    test "redirects when data is valid", %{conn: conn, care_episode: care_episode} do
      conn =
        put(conn, Routes.care_episode_path(conn, :update, care_episode),
          care_episode: @update_attrs
        )

      assert redirected_to(conn) == Routes.care_episode_path(conn, :show, care_episode)

      conn = get(conn, Routes.care_episode_path(conn, :show, care_episode))
      assert html_response(conn, 200) =~ "some updated caepsds_arrival_location"
    end

    test "renders errors when data is invalid", %{conn: conn, care_episode: care_episode} do
      conn =
        put(conn, Routes.care_episode_path(conn, :update, care_episode),
          care_episode: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Care episode"
    end
  end

  describe "delete care_episode" do
    setup [:create_care_episode]

    test "deletes chosen care_episode", %{conn: conn, care_episode: care_episode} do
      conn = delete(conn, Routes.care_episode_path(conn, :delete, care_episode))
      assert redirected_to(conn) == Routes.care_episode_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.care_episode_path(conn, :show, care_episode))
      end)
    end
  end

  defp create_care_episode(_) do
    care_episode = fixture(:care_episode)
    {:ok, care_episode: care_episode}
  end
end
