defmodule Angio.ClinicalsTest do
  use Angio.DataCase

  alias Angio.Clinicals

  describe "cath_clinicals" do
    alias Angio.Clinicals.Cath_clinical

    @valid_attrs %{
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

    def cath_clinical_fixture(attrs \\ %{}) do
      {:ok, cath_clinical} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clinicals.create_cath_clinical()

      cath_clinical
    end

    test "list_cath_clinicals/0 returns all cath_clinicals" do
      cath_clinical = cath_clinical_fixture()
      assert Clinicals.list_cath_clinicals() == [cath_clinical]
    end

    test "get_cath_clinical!/1 returns the cath_clinical with given id" do
      cath_clinical = cath_clinical_fixture()
      assert Clinicals.get_cath_clinical!(cath_clinical.id) == cath_clinical
    end

    test "create_cath_clinical/1 with valid data creates a cath_clinical" do
      assert {:ok, %Cath_clinical{} = cath_clinical} =
               Clinicals.create_cath_clinical(@valid_attrs)

      assert cath_clinical.==("some  ")
      assert cath_clinical.anesthitist_at_start_yn == true
      assert cath_clinical.angina_class_within_2wk_yn == true
      assert cath_clinical.bag_mask_ventilation_yn == true
      assert cath_clinical.cabg_most_recent_dt == ~D[2010-04-17]
      assert cath_clinical.cad_presentation_type == "some cad_presentation_type"
      assert cath_clinical.cardio_shock_last_24hours_yn == true
      assert cath_clinical.cath_cl_arrest_hypothermia_dt == ~D[2010-04-17]
      assert cath_clinical.cath_cl_arrest_hypothermia_tm == ~T[14:00:00]
      assert cath_clinical.cath_cl_arrest_hypothermia_yn == true
      assert cath_clinical.cath_cl_arrest_loc == "some cath_cl_arrest_loc"
      assert cath_clinical.cath_cl_arrest_pre_wit_yn == true
      assert cath_clinical.cath_cl_iabp_start_dt == ~D[2010-04-17]
      assert cath_clinical.cath_cl_symptom_onset_dt == ~D[2010-04-17]
      assert cath_clinical.chf_prior_2wk_yn == true
      assert cath_clinical.glasgow_coma_scale == "some glasgow_coma_scale"
      assert cath_clinical.iabp_start_tm == ~T[14:00:00]
      assert cath_clinical.iabp_support_req_yn == true
      assert cath_clinical.intubated_before_cath_yn == true
      assert cath_clinical.lv_dysfunction_yn == true
      assert cath_clinical.mech_lv_support_other_dt == ~D[2010-04-17]
      assert cath_clinical.mech_lv_support_other_tm == ~T[14:00:00]
      assert cath_clinical.mech_lv_support_other_yn == true
      assert cath_clinical.nyha_class_prior_2wk_cath_yn == true
      assert cath_clinical.nyha_prior_2wk_category == "some nyha_prior_2wk_category"
      assert cath_clinical.sedation_type == "some sedation_type"
      assert cath_clinical.symptom_onset_tm == ~T[14:00:00]
      assert cath_clinical.symptom_onset_tm_estim == true
      assert cath_clinical.symptom_onset_tm_na == true
      assert cath_clinical.ventilator_support_yn == true
    end

    test "create_cath_clinical/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clinicals.create_cath_clinical(@invalid_attrs)
    end

    test "update_cath_clinical/2 with valid data updates the cath_clinical" do
      cath_clinical = cath_clinical_fixture()

      assert {:ok, %Cath_clinical{} = cath_clinical} =
               Clinicals.update_cath_clinical(cath_clinical, @update_attrs)

      assert cath_clinical.==("some updated  ")
      assert cath_clinical.anesthitist_at_start_yn == false
      assert cath_clinical.angina_class_within_2wk_yn == false
      assert cath_clinical.bag_mask_ventilation_yn == false
      assert cath_clinical.cabg_most_recent_dt == ~D[2011-05-18]
      assert cath_clinical.cad_presentation_type == "some updated cad_presentation_type"
      assert cath_clinical.cardio_shock_last_24hours_yn == false
      assert cath_clinical.cath_cl_arrest_hypothermia_dt == ~D[2011-05-18]
      assert cath_clinical.cath_cl_arrest_hypothermia_tm == ~T[15:01:01]
      assert cath_clinical.cath_cl_arrest_hypothermia_yn == false
      assert cath_clinical.cath_cl_arrest_loc == "some updated cath_cl_arrest_loc"
      assert cath_clinical.cath_cl_arrest_pre_wit_yn == false
      assert cath_clinical.cath_cl_iabp_start_dt == ~D[2011-05-18]
      assert cath_clinical.cath_cl_symptom_onset_dt == ~D[2011-05-18]
      assert cath_clinical.chf_prior_2wk_yn == false
      assert cath_clinical.glasgow_coma_scale == "some updated glasgow_coma_scale"
      assert cath_clinical.iabp_start_tm == ~T[15:01:01]
      assert cath_clinical.iabp_support_req_yn == false
      assert cath_clinical.intubated_before_cath_yn == false
      assert cath_clinical.lv_dysfunction_yn == false
      assert cath_clinical.mech_lv_support_other_dt == ~D[2011-05-18]
      assert cath_clinical.mech_lv_support_other_tm == ~T[15:01:01]
      assert cath_clinical.mech_lv_support_other_yn == false
      assert cath_clinical.nyha_class_prior_2wk_cath_yn == false
      assert cath_clinical.nyha_prior_2wk_category == "some updated nyha_prior_2wk_category"
      assert cath_clinical.sedation_type == "some updated sedation_type"
      assert cath_clinical.symptom_onset_tm == ~T[15:01:01]
      assert cath_clinical.symptom_onset_tm_estim == false
      assert cath_clinical.symptom_onset_tm_na == false
      assert cath_clinical.ventilator_support_yn == false
    end

    test "update_cath_clinical/2 with invalid data returns error changeset" do
      cath_clinical = cath_clinical_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Clinicals.update_cath_clinical(cath_clinical, @invalid_attrs)

      assert cath_clinical == Clinicals.get_cath_clinical!(cath_clinical.id)
    end

    test "delete_cath_clinical/1 deletes the cath_clinical" do
      cath_clinical = cath_clinical_fixture()
      assert {:ok, %Cath_clinical{}} = Clinicals.delete_cath_clinical(cath_clinical)
      assert_raise Ecto.NoResultsError, fn -> Clinicals.get_cath_clinical!(cath_clinical.id) end
    end

    test "change_cath_clinical/1 returns a cath_clinical changeset" do
      cath_clinical = cath_clinical_fixture()
      assert %Ecto.Changeset{} = Clinicals.change_cath_clinical(cath_clinical)
    end
  end

  describe "chest_pain" do
    alias Angio.Clinicals.Chest_pains

    @valid_attrs %{chestp_assoc_symptoms: "some chestp_assoc_symptoms", chestp_dt: ~D[2010-04-17], chestp_duration: "some chestp_duration", chestp_location: "some chestp_location", chestp_notes: "some chestp_notes", chestp_perciptating_factors: "some chestp_perciptating_factors", chestp_quality: "some chestp_quality", chestp_relieving_factors: "some chestp_relieving_factors", chestp_tm: ~T[14:00:00]}
    @update_attrs %{chestp_assoc_symptoms: "some updated chestp_assoc_symptoms", chestp_dt: ~D[2011-05-18], chestp_duration: "some updated chestp_duration", chestp_location: "some updated chestp_location", chestp_notes: "some updated chestp_notes", chestp_perciptating_factors: "some updated chestp_perciptating_factors", chestp_quality: "some updated chestp_quality", chestp_relieving_factors: "some updated chestp_relieving_factors", chestp_tm: ~T[15:01:01]}
    @invalid_attrs %{chestp_assoc_symptoms: nil, chestp_dt: nil, chestp_duration: nil, chestp_location: nil, chestp_notes: nil, chestp_perciptating_factors: nil, chestp_quality: nil, chestp_relieving_factors: nil, chestp_tm: nil}

    def chest_pains_fixture(attrs \\ %{}) do
      {:ok, chest_pains} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clinicals.create_chest_pains()

      chest_pains
    end

    test "list_chest_pain/0 returns all chest_pain" do
      chest_pains = chest_pains_fixture()
      assert Clinicals.list_chest_pain() == [chest_pains]
    end

    test "get_chest_pains!/1 returns the chest_pains with given id" do
      chest_pains = chest_pains_fixture()
      assert Clinicals.get_chest_pains!(chest_pains.id) == chest_pains
    end

    test "create_chest_pains/1 with valid data creates a chest_pains" do
      assert {:ok, %Chest_pains{} = chest_pains} = Clinicals.create_chest_pains(@valid_attrs)
      assert chest_pains.chestp_assoc_symptoms == "some chestp_assoc_symptoms"
      assert chest_pains.chestp_dt == ~D[2010-04-17]
      assert chest_pains.chestp_duration == "some chestp_duration"
      assert chest_pains.chestp_location == "some chestp_location"
      assert chest_pains.chestp_notes == "some chestp_notes"
      assert chest_pains.chestp_perciptating_factors == "some chestp_perciptating_factors"
      assert chest_pains.chestp_quality == "some chestp_quality"
      assert chest_pains.chestp_relieving_factors == "some chestp_relieving_factors"
      assert chest_pains.chestp_tm == ~T[14:00:00]
    end

    test "create_chest_pains/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clinicals.create_chest_pains(@invalid_attrs)
    end

    test "update_chest_pains/2 with valid data updates the chest_pains" do
      chest_pains = chest_pains_fixture()
      assert {:ok, %Chest_pains{} = chest_pains} = Clinicals.update_chest_pains(chest_pains, @update_attrs)
      assert chest_pains.chestp_assoc_symptoms == "some updated chestp_assoc_symptoms"
      assert chest_pains.chestp_dt == ~D[2011-05-18]
      assert chest_pains.chestp_duration == "some updated chestp_duration"
      assert chest_pains.chestp_location == "some updated chestp_location"
      assert chest_pains.chestp_notes == "some updated chestp_notes"
      assert chest_pains.chestp_perciptating_factors == "some updated chestp_perciptating_factors"
      assert chest_pains.chestp_quality == "some updated chestp_quality"
      assert chest_pains.chestp_relieving_factors == "some updated chestp_relieving_factors"
      assert chest_pains.chestp_tm == ~T[15:01:01]
    end

    test "update_chest_pains/2 with invalid data returns error changeset" do
      chest_pains = chest_pains_fixture()
      assert {:error, %Ecto.Changeset{}} = Clinicals.update_chest_pains(chest_pains, @invalid_attrs)
      assert chest_pains == Clinicals.get_chest_pains!(chest_pains.id)
    end

    test "delete_chest_pains/1 deletes the chest_pains" do
      chest_pains = chest_pains_fixture()
      assert {:ok, %Chest_pains{}} = Clinicals.delete_chest_pains(chest_pains)
      assert_raise Ecto.NoResultsError, fn -> Clinicals.get_chest_pains!(chest_pains.id) end
    end

    test "change_chest_pains/1 returns a chest_pains changeset" do
      chest_pains = chest_pains_fixture()
      assert %Ecto.Changeset{} = Clinicals.change_chest_pains(chest_pains)
    end
  end
end
