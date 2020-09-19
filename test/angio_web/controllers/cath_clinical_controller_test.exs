defmodule AngioWeb.Cath_clinicalControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Clinicals

  @create_attrs %{
    " ": "some  ",
    anesthitist_at_start_yn: true,
    angina_class_within_2wk_yn: true,
    bag_mask_ventilation_yn: true,
    cabg_most_recent_dt: ~D[2010-04-17],
    cad_presentation_type: "some cad_presentation_type",
    cardio_shock_last_24hours_yn: true,
    cath_cl_arrest_hypothermia_dt: ~D[2010-04-17],
    cath_cl_arrest_hypothermia_tm: ~T[14:00:00],
    cath_cl_arrest_hypothermia_yn: true,
    cath_cl_arrest_loc: "some cath_cl_arrest_loc",
    cath_cl_arrest_pre_wit_yn: true,
    cath_cl_iabp_start_dt: ~D[2010-04-17],
    cath_cl_symptom_onset_dt: ~D[2010-04-17],
    chf_prior_2wk_yn: true,
    glasgow_coma_scale: "some glasgow_coma_scale",
    iabp_start_tm: ~T[14:00:00],
    iabp_support_req_yn: true,
    intubated_before_cath_yn: true,
    lv_dysfunction_yn: true,
    mech_lv_support_other_dt: ~D[2010-04-17],
    mech_lv_support_other_tm: ~T[14:00:00],
    mech_lv_support_other_yn: true,
    nyha_class_prior_2wk_cath_yn: true,
    nyha_prior_2wk_category: "some nyha_prior_2wk_category",
    sedation_type: "some sedation_type",
    symptom_onset_tm: ~T[14:00:00],
    symptom_onset_tm_estim: true,
    symptom_onset_tm_na: true,
    ventilator_support_yn: true
  }
  @update_attrs %{
    " ": "some updated  ",
    anesthitist_at_start_yn: false,
    angina_class_within_2wk_yn: false,
    bag_mask_ventilation_yn: false,
    cabg_most_recent_dt: ~D[2011-05-18],
    cad_presentation_type: "some updated cad_presentation_type",
    cardio_shock_last_24hours_yn: false,
    cath_cl_arrest_hypothermia_dt: ~D[2011-05-18],
    cath_cl_arrest_hypothermia_tm: ~T[15:01:01],
    cath_cl_arrest_hypothermia_yn: false,
    cath_cl_arrest_loc: "some updated cath_cl_arrest_loc",
    cath_cl_arrest_pre_wit_yn: false,
    cath_cl_iabp_start_dt: ~D[2011-05-18],
    cath_cl_symptom_onset_dt: ~D[2011-05-18],
    chf_prior_2wk_yn: false,
    glasgow_coma_scale: "some updated glasgow_coma_scale",
    iabp_start_tm: ~T[15:01:01],
    iabp_support_req_yn: false,
    intubated_before_cath_yn: false,
    lv_dysfunction_yn: false,
    mech_lv_support_other_dt: ~D[2011-05-18],
    mech_lv_support_other_tm: ~T[15:01:01],
    mech_lv_support_other_yn: false,
    nyha_class_prior_2wk_cath_yn: false,
    nyha_prior_2wk_category: "some updated nyha_prior_2wk_category",
    sedation_type: "some updated sedation_type",
    symptom_onset_tm: ~T[15:01:01],
    symptom_onset_tm_estim: false,
    symptom_onset_tm_na: false,
    ventilator_support_yn: false
  }
  @invalid_attrs %{
    " ": nil,
    anesthitist_at_start_yn: nil,
    angina_class_within_2wk_yn: nil,
    bag_mask_ventilation_yn: nil,
    cabg_most_recent_dt: nil,
    cad_presentation_type: nil,
    cardio_shock_last_24hours_yn: nil,
    cath_cl_arrest_hypothermia_dt: nil,
    cath_cl_arrest_hypothermia_tm: nil,
    cath_cl_arrest_hypothermia_yn: nil,
    cath_cl_arrest_loc: nil,
    cath_cl_arrest_pre_wit_yn: nil,
    cath_cl_iabp_start_dt: nil,
    cath_cl_symptom_onset_dt: nil,
    chf_prior_2wk_yn: nil,
    glasgow_coma_scale: nil,
    iabp_start_tm: nil,
    iabp_support_req_yn: nil,
    intubated_before_cath_yn: nil,
    lv_dysfunction_yn: nil,
    mech_lv_support_other_dt: nil,
    mech_lv_support_other_tm: nil,
    mech_lv_support_other_yn: nil,
    nyha_class_prior_2wk_cath_yn: nil,
    nyha_prior_2wk_category: nil,
    sedation_type: nil,
    symptom_onset_tm: nil,
    symptom_onset_tm_estim: nil,
    symptom_onset_tm_na: nil,
    ventilator_support_yn: nil
  }

  def fixture(:cath_clinical) do
    {:ok, cath_clinical} = Clinicals.create_cath_clinical(@create_attrs)
    cath_clinical
  end

  describe "index" do
    test "lists all cath_clinicals", %{conn: conn} do
      conn = get(conn, Routes.cath_clinical_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cath clinicals"
    end
  end

  describe "new cath_clinical" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cath_clinical_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cath clinical"
    end
  end

  describe "create cath_clinical" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cath_clinical_path(conn, :create), cath_clinical: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cath_clinical_path(conn, :show, id)

      conn = get(conn, Routes.cath_clinical_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cath clinical"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cath_clinical_path(conn, :create), cath_clinical: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cath clinical"
    end
  end

  describe "edit cath_clinical" do
    setup [:create_cath_clinical]

    test "renders form for editing chosen cath_clinical", %{
      conn: conn,
      cath_clinical: cath_clinical
    } do
      conn = get(conn, Routes.cath_clinical_path(conn, :edit, cath_clinical))
      assert html_response(conn, 200) =~ "Edit Cath clinical"
    end
  end

  describe "update cath_clinical" do
    setup [:create_cath_clinical]

    test "redirects when data is valid", %{conn: conn, cath_clinical: cath_clinical} do
      conn =
        put(conn, Routes.cath_clinical_path(conn, :update, cath_clinical),
          cath_clinical: @update_attrs
        )

      assert redirected_to(conn) == Routes.cath_clinical_path(conn, :show, cath_clinical)

      conn = get(conn, Routes.cath_clinical_path(conn, :show, cath_clinical))
      assert html_response(conn, 200) =~ "some updated  "
    end

    test "renders errors when data is invalid", %{conn: conn, cath_clinical: cath_clinical} do
      conn =
        put(conn, Routes.cath_clinical_path(conn, :update, cath_clinical),
          cath_clinical: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Cath clinical"
    end
  end

  describe "delete cath_clinical" do
    setup [:create_cath_clinical]

    test "deletes chosen cath_clinical", %{conn: conn, cath_clinical: cath_clinical} do
      conn = delete(conn, Routes.cath_clinical_path(conn, :delete, cath_clinical))
      assert redirected_to(conn) == Routes.cath_clinical_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.cath_clinical_path(conn, :show, cath_clinical))
      end)
    end
  end

  defp create_cath_clinical(_) do
    cath_clinical = fixture(:cath_clinical)
    {:ok, cath_clinical: cath_clinical}
  end
end
