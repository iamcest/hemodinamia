defmodule Angio.HistoriesTest do
  use Angio.DataCase

  alias Angio.Histories

  describe "infect_histories" do
    alias Angio.Histories.Infect_history

    @valid_attrs %{"": true, infh_endocarditis_type: "some infh_endocarditis_type", infh_endocarditis_yn: true, infh_hepatitis_b_yn: true, infh_hepatitis_c_yn: true, infh_histories_notes: "some infh_histories_notes", infh_hiv_yn: true, infh_influenza_vacc_dt: ~D[2010-04-17], infh_influenza_vacc_yn: "some infh_influenza_vacc_yn", infh_malaria_yn: true, infh_pneumococcal_vacc_dt: ~D[2010-04-17], infh_pneumococcal_vacc_yn: true, infh_pneumonia_yn: true, infh_tubercolosis_yn: true}
    @update_attrs %{"": false, infh_endocarditis_type: "some updated infh_endocarditis_type", infh_endocarditis_yn: false, infh_hepatitis_b_yn: false, infh_hepatitis_c_yn: false, infh_histories_notes: "some updated infh_histories_notes", infh_hiv_yn: false, infh_influenza_vacc_dt: ~D[2011-05-18], infh_influenza_vacc_yn: "some updated infh_influenza_vacc_yn", infh_malaria_yn: false, infh_pneumococcal_vacc_dt: ~D[2011-05-18], infh_pneumococcal_vacc_yn: false, infh_pneumonia_yn: false, infh_tubercolosis_yn: false}
    @invalid_attrs %{"": nil, infh_endocarditis_type: nil, infh_endocarditis_yn: nil, infh_hepatitis_b_yn: nil, infh_hepatitis_c_yn: nil, infh_histories_notes: nil, infh_hiv_yn: nil, infh_influenza_vacc_dt: nil, infh_influenza_vacc_yn: nil, infh_malaria_yn: nil, infh_pneumococcal_vacc_dt: nil, infh_pneumococcal_vacc_yn: nil, infh_pneumonia_yn: nil, infh_tubercolosis_yn: nil}

    def infect_history_fixture(attrs \\ %{}) do
      {:ok, infect_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Histories.create_infect_history()

      infect_history
    end

    test "list_infect_histories/0 returns all infect_histories" do
      infect_history = infect_history_fixture()
      assert Histories.list_infect_histories() == [infect_history]
    end

    test "get_infect_history!/1 returns the infect_history with given id" do
      infect_history = infect_history_fixture()
      assert Histories.get_infect_history!(infect_history.id) == infect_history
    end

    test "create_infect_history/1 with valid data creates a infect_history" do
      assert {:ok, %Infect_history{} = infect_history} = Histories.create_infect_history(@valid_attrs)
      assert infect_history. == true
      assert infect_history.infh_endocarditis_type == "some infh_endocarditis_type"
      assert infect_history.infh_endocarditis_yn == true
      assert infect_history.infh_hepatitis_b_yn == true
      assert infect_history.infh_hepatitis_c_yn == true
      assert infect_history.infh_histories_notes == "some infh_histories_notes"
      assert infect_history.infh_hiv_yn == true
      assert infect_history.infh_influenza_vacc_dt == ~D[2010-04-17]
      assert infect_history.infh_influenza_vacc_yn == "some infh_influenza_vacc_yn"
      assert infect_history.infh_malaria_yn == true
      assert infect_history.infh_pneumococcal_vacc_dt == ~D[2010-04-17]
      assert infect_history.infh_pneumococcal_vacc_yn == true
      assert infect_history.infh_pneumonia_yn == true
      assert infect_history.infh_tubercolosis_yn == true
    end

    test "create_infect_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Histories.create_infect_history(@invalid_attrs)
    end

    test "update_infect_history/2 with valid data updates the infect_history" do
      infect_history = infect_history_fixture()
      assert {:ok, %Infect_history{} = infect_history} = Histories.update_infect_history(infect_history, @update_attrs)
      assert infect_history. == false
      assert infect_history.infh_endocarditis_type == "some updated infh_endocarditis_type"
      assert infect_history.infh_endocarditis_yn == false
      assert infect_history.infh_hepatitis_b_yn == false
      assert infect_history.infh_hepatitis_c_yn == false
      assert infect_history.infh_histories_notes == "some updated infh_histories_notes"
      assert infect_history.infh_hiv_yn == false
      assert infect_history.infh_influenza_vacc_dt == ~D[2011-05-18]
      assert infect_history.infh_influenza_vacc_yn == "some updated infh_influenza_vacc_yn"
      assert infect_history.infh_malaria_yn == false
      assert infect_history.infh_pneumococcal_vacc_dt == ~D[2011-05-18]
      assert infect_history.infh_pneumococcal_vacc_yn == false
      assert infect_history.infh_pneumonia_yn == false
      assert infect_history.infh_tubercolosis_yn == false
    end

    test "update_infect_history/2 with invalid data returns error changeset" do
      infect_history = infect_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Histories.update_infect_history(infect_history, @invalid_attrs)
      assert infect_history == Histories.get_infect_history!(infect_history.id)
    end

    test "delete_infect_history/1 deletes the infect_history" do
      infect_history = infect_history_fixture()
      assert {:ok, %Infect_history{}} = Histories.delete_infect_history(infect_history)
      assert_raise Ecto.NoResultsError, fn -> Histories.get_infect_history!(infect_history.id) end
    end

    test "change_infect_history/1 returns a infect_history changeset" do
      infect_history = infect_history_fixture()
      assert %Ecto.Changeset{} = Histories.change_infect_history(infect_history)
    end
  end

  describe "core_histories" do
    alias Angio.Histories.Core_history

    @valid_attrs %{coh_chf_symptom_duration: "some coh_chf_symptom_duration", coh_stroke_ischemic_yn: true, coh_mi_timeframe: "some coh_mi_timeframe", coh_angina_class: "some coh_angina_class", coh_family_cor_dis_yn: true, coh_dyslipidemia_yn: true, coh_cerebrovasc_dis_yn: true, coh_family_diabetes_yn: true, coh_chf_hosp_timeframe: "some coh_chf_hosp_timeframe", coh_copd_yn: true, coh_histories_notes: "some coh_histories_notes", coh_arrest_cardiac_yn: true, coh_prior_mi_yn: true, coh_angina_yn: true, coh_prior_afib_yn: true, coh_fatigue_yn: true, coh_cancer_history_yn: true, coh_renal_artery_dis_yn: true, coh_cancer_type: "some coh_cancer_type", coh_cur_on_dyalisis_yn: true, coh_cardiomyo: "some coh_cardiomyo", coh_arthritis_collagen_dis_yn: true, coh_diabetes_yn: true, coh_chf_prior_yn: true, coh_mascular_dis_yn: true, coh_tobacco_use: "some coh_tobacco_use", coh_prior_sten_50pct_yn: true, coh_contrast_allergy_yn: true, coh_chronic_kidney_dis: "some coh_chronic_kidney_dis", coh_peripheral_art_dis_yn: true, coh_diabetes_therapy: "some coh_diabetes_therapy", coh_tobacco_cigarette_amount: "some coh_tobacco_cigarette_amount", coh_chf_etiology: "some coh_chf_etiology", coh_hypertension_yn: true, coh_prior_cor_interv_yn: true, coh_tobacco_type: "some coh_tobacco_type"}
    @update_attrs %{coh_chf_symptom_duration: "some updated coh_chf_symptom_duration", coh_stroke_ischemic_yn: false, coh_mi_timeframe: "some updated coh_mi_timeframe", coh_angina_class: "some updated coh_angina_class", coh_family_cor_dis_yn: false, coh_dyslipidemia_yn: false, coh_cerebrovasc_dis_yn: false, coh_family_diabetes_yn: false, coh_chf_hosp_timeframe: "some updated coh_chf_hosp_timeframe", coh_copd_yn: false, coh_histories_notes: "some updated coh_histories_notes", coh_arrest_cardiac_yn: false, coh_prior_mi_yn: false, coh_angina_yn: false, coh_prior_afib_yn: false, coh_fatigue_yn: false, coh_cancer_history_yn: false, coh_renal_artery_dis_yn: false, coh_cancer_type: "some updated coh_cancer_type", coh_cur_on_dyalisis_yn: false, coh_cardiomyo: "some updated coh_cardiomyo", coh_arthritis_collagen_dis_yn: false, coh_diabetes_yn: false, coh_chf_prior_yn: false, coh_mascular_dis_yn: false, coh_tobacco_use: "some updated coh_tobacco_use", coh_prior_sten_50pct_yn: false, coh_contrast_allergy_yn: false, coh_chronic_kidney_dis: "some updated coh_chronic_kidney_dis", coh_peripheral_art_dis_yn: false, coh_diabetes_therapy: "some updated coh_diabetes_therapy", coh_tobacco_cigarette_amount: "some updated coh_tobacco_cigarette_amount", coh_chf_etiology: "some updated coh_chf_etiology", coh_hypertension_yn: false, coh_prior_cor_interv_yn: false, coh_tobacco_type: "some updated coh_tobacco_type"}
    @invalid_attrs %{coh_chf_symptom_duration: nil, coh_stroke_ischemic_yn: nil, coh_mi_timeframe: nil, coh_angina_class: nil, coh_family_cor_dis_yn: nil, coh_dyslipidemia_yn: nil, coh_cerebrovasc_dis_yn: nil, coh_family_diabetes_yn: nil, coh_chf_hosp_timeframe: nil, coh_copd_yn: nil, coh_histories_notes: nil, coh_arrest_cardiac_yn: nil, coh_prior_mi_yn: nil, coh_angina_yn: nil, coh_prior_afib_yn: nil, coh_fatigue_yn: nil, coh_cancer_history_yn: nil, coh_renal_artery_dis_yn: nil, coh_cancer_type: nil, coh_cur_on_dyalisis_yn: nil, coh_cardiomyo: nil, coh_arthritis_collagen_dis_yn: nil, coh_diabetes_yn: nil, coh_chf_prior_yn: nil, coh_mascular_dis_yn: nil, coh_tobacco_use: nil, coh_prior_sten_50pct_yn: nil, coh_contrast_allergy_yn: nil, coh_chronic_kidney_dis: nil, coh_peripheral_art_dis_yn: nil, coh_diabetes_therapy: nil, coh_tobacco_cigarette_amount: nil, coh_chf_etiology: nil, coh_hypertension_yn: nil, coh_prior_cor_interv_yn: nil, coh_tobacco_type: nil}

    def core_history_fixture(attrs \\ %{}) do
      {:ok, core_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Histories.create_core_history()

      core_history
    end

    test "list_core_histories/0 returns all core_histories" do
      core_history = core_history_fixture()
      assert Histories.list_core_histories() == [core_history]
    end

    test "get_core_history!/1 returns the core_history with given id" do
      core_history = core_history_fixture()
      assert Histories.get_core_history!(core_history.id) == core_history
    end

    test "create_core_history/1 with valid data creates a core_history" do
      assert {:ok, %Core_history{} = core_history} = Histories.create_core_history(@valid_attrs)
      assert core_history.coh_tobacco_type == "some coh_tobacco_type"
      assert core_history.coh_prior_cor_interv_yn == true
      assert core_history.coh_hypertension_yn == true
      assert core_history.coh_chf_etiology == "some coh_chf_etiology"
      assert core_history.coh_tobacco_cigarette_amount == "some coh_tobacco_cigarette_amount"
      assert core_history.coh_diabetes_therapy == "some coh_diabetes_therapy"
      assert core_history.coh_peripheral_art_dis_yn == true
      assert core_history.coh_chronic_kidney_dis == "some coh_chronic_kidney_dis"
      assert core_history.coh_contrast_allergy_yn == true
      assert core_history.coh_prior_sten_50pct_yn == true
      assert core_history.coh_tobacco_use == "some coh_tobacco_use"
      assert core_history.coh_mascular_dis_yn == true
      assert core_history.coh_chf_prior_yn == true
      assert core_history.coh_diabetes_yn == true
      assert core_history.coh_arthritis_collagen_dis_yn == true
      assert core_history.coh_cardiomyo == "some coh_cardiomyo"
      assert core_history.coh_cur_on_dyalisis_yn == true
      assert core_history.coh_cancer_type == "some coh_cancer_type"
      assert core_history.coh_renal_artery_dis_yn == true
      assert core_history.coh_cancer_history_yn == true
      assert core_history.coh_fatigue_yn == true
      assert core_history.coh_prior_afib_yn == true
      assert core_history.coh_angina_yn == true
      assert core_history.coh_prior_mi_yn == true
      assert core_history.coh_arrest_cardiac_yn == true
      assert core_history.coh_histories_notes == "some coh_histories_notes"
      assert core_history.coh_copd_yn == true
      assert core_history.coh_chf_hosp_timeframe == "some coh_chf_hosp_timeframe"
      assert core_history.coh_family_diabetes_yn == true
      assert core_history.coh_cerebrovasc_dis_yn == true
      assert core_history.coh_dyslipidemia_yn == true
      assert core_history.coh_family_cor_dis_yn == true
      assert core_history.coh_angina_class == "some coh_angina_class"
      assert core_history.coh_mi_timeframe == "some coh_mi_timeframe"
      assert core_history.coh_stroke_ischemic_yn == true
      assert core_history.coh_chf_symptom_duration == "some coh_chf_symptom_duration"
    end

    test "create_core_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Histories.create_core_history(@invalid_attrs)
    end

    test "update_core_history/2 with valid data updates the core_history" do
      core_history = core_history_fixture()
      assert {:ok, %Core_history{} = core_history} = Histories.update_core_history(core_history, @update_attrs)
      assert core_history.coh_tobacco_type == "some updated coh_tobacco_type"
      assert core_history.coh_prior_cor_interv_yn == false
      assert core_history.coh_hypertension_yn == false
      assert core_history.coh_chf_etiology == "some updated coh_chf_etiology"
      assert core_history.coh_tobacco_cigarette_amount == "some updated coh_tobacco_cigarette_amount"
      assert core_history.coh_diabetes_therapy == "some updated coh_diabetes_therapy"
      assert core_history.coh_peripheral_art_dis_yn == false
      assert core_history.coh_chronic_kidney_dis == "some updated coh_chronic_kidney_dis"
      assert core_history.coh_contrast_allergy_yn == false
      assert core_history.coh_prior_sten_50pct_yn == false
      assert core_history.coh_tobacco_use == "some updated coh_tobacco_use"
      assert core_history.coh_mascular_dis_yn == false
      assert core_history.coh_chf_prior_yn == false
      assert core_history.coh_diabetes_yn == false
      assert core_history.coh_arthritis_collagen_dis_yn == false
      assert core_history.coh_cardiomyo == "some updated coh_cardiomyo"
      assert core_history.coh_cur_on_dyalisis_yn == false
      assert core_history.coh_cancer_type == "some updated coh_cancer_type"
      assert core_history.coh_renal_artery_dis_yn == false
      assert core_history.coh_cancer_history_yn == false
      assert core_history.coh_fatigue_yn == false
      assert core_history.coh_prior_afib_yn == false
      assert core_history.coh_angina_yn == false
      assert core_history.coh_prior_mi_yn == false
      assert core_history.coh_arrest_cardiac_yn == false
      assert core_history.coh_histories_notes == "some updated coh_histories_notes"
      assert core_history.coh_copd_yn == false
      assert core_history.coh_chf_hosp_timeframe == "some updated coh_chf_hosp_timeframe"
      assert core_history.coh_family_diabetes_yn == false
      assert core_history.coh_cerebrovasc_dis_yn == false
      assert core_history.coh_dyslipidemia_yn == false
      assert core_history.coh_family_cor_dis_yn == false
      assert core_history.coh_angina_class == "some updated coh_angina_class"
      assert core_history.coh_mi_timeframe == "some updated coh_mi_timeframe"
      assert core_history.coh_stroke_ischemic_yn == false
      assert core_history.coh_chf_symptom_duration == "some updated coh_chf_symptom_duration"
    end

    test "update_core_history/2 with invalid data returns error changeset" do
      core_history = core_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Histories.update_core_history(core_history, @invalid_attrs)
      assert core_history == Histories.get_core_history!(core_history.id)
    end

    test "delete_core_history/1 deletes the core_history" do
      core_history = core_history_fixture()
      assert {:ok, %Core_history{}} = Histories.delete_core_history(core_history)
      assert_raise Ecto.NoResultsError, fn -> Histories.get_core_history!(core_history.id) end
    end

    test "change_core_history/1 returns a core_history changeset" do
      core_history = core_history_fixture()
      assert %Ecto.Changeset{} = Histories.change_core_history(core_history)
    end
  end

  describe "social_histories" do
    alias Angio.Histories.Social_history

    @valid_attrs %{soh_alcohol_depend: "some soh_alcohol_depend", soh_alcohol_depend_amount: "some soh_alcohol_depend_amount", soh_depressed_mood_yn: true, soh_education_level: "some soh_education_level", soh_employ_status: "some soh_employ_status", soh_erectile_dysfunc_yn: true, soh_illicit_drug_yn: true, soh_life_expect_1yr_yn: true, soh_marital_status: "some soh_marital_status", soh_notes: "some soh_notes", soh_sleep_apnea_on_cpap_yn: true, soh_sleep_apnea_yn: true}
    @update_attrs %{soh_alcohol_depend: "some updated soh_alcohol_depend", soh_alcohol_depend_amount: "some updated soh_alcohol_depend_amount", soh_depressed_mood_yn: false, soh_education_level: "some updated soh_education_level", soh_employ_status: "some updated soh_employ_status", soh_erectile_dysfunc_yn: false, soh_illicit_drug_yn: false, soh_life_expect_1yr_yn: false, soh_marital_status: "some updated soh_marital_status", soh_notes: "some updated soh_notes", soh_sleep_apnea_on_cpap_yn: false, soh_sleep_apnea_yn: false}
    @invalid_attrs %{soh_alcohol_depend: nil, soh_alcohol_depend_amount: nil, soh_depressed_mood_yn: nil, soh_education_level: nil, soh_employ_status: nil, soh_erectile_dysfunc_yn: nil, soh_illicit_drug_yn: nil, soh_life_expect_1yr_yn: nil, soh_marital_status: nil, soh_notes: nil, soh_sleep_apnea_on_cpap_yn: nil, soh_sleep_apnea_yn: nil}

    def social_history_fixture(attrs \\ %{}) do
      {:ok, social_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Histories.create_social_history()

      social_history
    end

    test "list_social_histories/0 returns all social_histories" do
      social_history = social_history_fixture()
      assert Histories.list_social_histories() == [social_history]
    end

    test "get_social_history!/1 returns the social_history with given id" do
      social_history = social_history_fixture()
      assert Histories.get_social_history!(social_history.id) == social_history
    end

    test "create_social_history/1 with valid data creates a social_history" do
      assert {:ok, %Social_history{} = social_history} = Histories.create_social_history(@valid_attrs)
      assert social_history.soh_alcohol_depend == "some soh_alcohol_depend"
      assert social_history.soh_alcohol_depend_amount == "some soh_alcohol_depend_amount"
      assert social_history.soh_depressed_mood_yn == true
      assert social_history.soh_education_level == "some soh_education_level"
      assert social_history.soh_employ_status == "some soh_employ_status"
      assert social_history.soh_erectile_dysfunc_yn == true
      assert social_history.soh_illicit_drug_yn == true
      assert social_history.soh_life_expect_1yr_yn == true
      assert social_history.soh_marital_status == "some soh_marital_status"
      assert social_history.soh_notes == "some soh_notes"
      assert social_history.soh_sleep_apnea_on_cpap_yn == true
      assert social_history.soh_sleep_apnea_yn == true
    end

    test "create_social_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Histories.create_social_history(@invalid_attrs)
    end

    test "update_social_history/2 with valid data updates the social_history" do
      social_history = social_history_fixture()
      assert {:ok, %Social_history{} = social_history} = Histories.update_social_history(social_history, @update_attrs)
      assert social_history.soh_alcohol_depend == "some updated soh_alcohol_depend"
      assert social_history.soh_alcohol_depend_amount == "some updated soh_alcohol_depend_amount"
      assert social_history.soh_depressed_mood_yn == false
      assert social_history.soh_education_level == "some updated soh_education_level"
      assert social_history.soh_employ_status == "some updated soh_employ_status"
      assert social_history.soh_erectile_dysfunc_yn == false
      assert social_history.soh_illicit_drug_yn == false
      assert social_history.soh_life_expect_1yr_yn == false
      assert social_history.soh_marital_status == "some updated soh_marital_status"
      assert social_history.soh_notes == "some updated soh_notes"
      assert social_history.soh_sleep_apnea_on_cpap_yn == false
      assert social_history.soh_sleep_apnea_yn == false
    end

    test "update_social_history/2 with invalid data returns error changeset" do
      social_history = social_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Histories.update_social_history(social_history, @invalid_attrs)
      assert social_history == Histories.get_social_history!(social_history.id)
    end

    test "delete_social_history/1 deletes the social_history" do
      social_history = social_history_fixture()
      assert {:ok, %Social_history{}} = Histories.delete_social_history(social_history)
      assert_raise Ecto.NoResultsError, fn -> Histories.get_social_history!(social_history.id) end
    end

    test "change_social_history/1 returns a social_history changeset" do
      social_history = social_history_fixture()
      assert %Ecto.Changeset{} = Histories.change_social_history(social_history)
    end
  end

  describe "proc_histories" do
    alias Angio.Histories.Proc_history

    @valid_attrs %{"": ~D[2010-04-17], proc_epis_request_dt: "some proc_epis_request_dt", proch_cabg_prior_dt: ~D[2010-04-17], proch_cabg_prior_yn: true, proch_cardiac_surg_other_yn: true, proch_carotid_surg_stent_dt: ~D[2010-04-17], proch_carotid_surg_stent_yn: true, proch_notes: "some proch_notes", proch_pacer_prior_dt: ~D[2010-04-17], proch_pacer_prior_yn: true, proch_pci_prior_dt: ~D[2010-04-17], proch_pci_prior_yn: true, proch_prior_icd_dt: ~D[2010-04-17], proch_prior_icd_yn: true, proch_prior_rv_biopsy_dt: ~D[2010-04-17], proch_prior_rv_biopsy_yn: true, proch_prior_valve_interv_dt: ~D[2010-04-17], proch_prior_valve_interv_yn: true, proch_transplant_prior_dt: ~D[2010-04-17], proch_transplant_prior_yn: true}
    @update_attrs %{"": ~D[2011-05-18], proc_epis_request_dt: "some updated proc_epis_request_dt", proch_cabg_prior_dt: ~D[2011-05-18], proch_cabg_prior_yn: false, proch_cardiac_surg_other_yn: false, proch_carotid_surg_stent_dt: ~D[2011-05-18], proch_carotid_surg_stent_yn: false, proch_notes: "some updated proch_notes", proch_pacer_prior_dt: ~D[2011-05-18], proch_pacer_prior_yn: false, proch_pci_prior_dt: ~D[2011-05-18], proch_pci_prior_yn: false, proch_prior_icd_dt: ~D[2011-05-18], proch_prior_icd_yn: false, proch_prior_rv_biopsy_dt: ~D[2011-05-18], proch_prior_rv_biopsy_yn: false, proch_prior_valve_interv_dt: ~D[2011-05-18], proch_prior_valve_interv_yn: false, proch_transplant_prior_dt: ~D[2011-05-18], proch_transplant_prior_yn: false}
    @invalid_attrs %{"": nil, proc_epis_request_dt: nil, proch_cabg_prior_dt: nil, proch_cabg_prior_yn: nil, proch_cardiac_surg_other_yn: nil, proch_carotid_surg_stent_dt: nil, proch_carotid_surg_stent_yn: nil, proch_notes: nil, proch_pacer_prior_dt: nil, proch_pacer_prior_yn: nil, proch_pci_prior_dt: nil, proch_pci_prior_yn: nil, proch_prior_icd_dt: nil, proch_prior_icd_yn: nil, proch_prior_rv_biopsy_dt: nil, proch_prior_rv_biopsy_yn: nil, proch_prior_valve_interv_dt: nil, proch_prior_valve_interv_yn: nil, proch_transplant_prior_dt: nil, proch_transplant_prior_yn: nil}

    def proc_history_fixture(attrs \\ %{}) do
      {:ok, proc_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Histories.create_proc_history()

      proc_history
    end

    test "list_proc_histories/0 returns all proc_histories" do
      proc_history = proc_history_fixture()
      assert Histories.list_proc_histories() == [proc_history]
    end

    test "get_proc_history!/1 returns the proc_history with given id" do
      proc_history = proc_history_fixture()
      assert Histories.get_proc_history!(proc_history.id) == proc_history
    end

    test "create_proc_history/1 with valid data creates a proc_history" do
      assert {:ok, %Proc_history{} = proc_history} = Histories.create_proc_history(@valid_attrs)
      assert proc_history. == ~D[2010-04-17]
      assert proc_history.proc_epis_request_dt == "some proc_epis_request_dt"
      assert proc_history.proch_cabg_prior_dt == ~D[2010-04-17]
      assert proc_history.proch_cabg_prior_yn == true
      assert proc_history.proch_cardiac_surg_other_yn == true
      assert proc_history.proch_carotid_surg_stent_dt == ~D[2010-04-17]
      assert proc_history.proch_carotid_surg_stent_yn == true
      assert proc_history.proch_notes == "some proch_notes"
      assert proc_history.proch_pacer_prior_dt == ~D[2010-04-17]
      assert proc_history.proch_pacer_prior_yn == true
      assert proc_history.proch_pci_prior_dt == ~D[2010-04-17]
      assert proc_history.proch_pci_prior_yn == true
      assert proc_history.proch_prior_icd_dt == ~D[2010-04-17]
      assert proc_history.proch_prior_icd_yn == true
      assert proc_history.proch_prior_rv_biopsy_dt == ~D[2010-04-17]
      assert proc_history.proch_prior_rv_biopsy_yn == true
      assert proc_history.proch_prior_valve_interv_dt == ~D[2010-04-17]
      assert proc_history.proch_prior_valve_interv_yn == true
      assert proc_history.proch_transplant_prior_dt == ~D[2010-04-17]
      assert proc_history.proch_transplant_prior_yn == true
    end

    test "create_proc_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Histories.create_proc_history(@invalid_attrs)
    end

    test "update_proc_history/2 with valid data updates the proc_history" do
      proc_history = proc_history_fixture()
      assert {:ok, %Proc_history{} = proc_history} = Histories.update_proc_history(proc_history, @update_attrs)
      assert proc_history. == ~D[2011-05-18]
      assert proc_history.proc_epis_request_dt == "some updated proc_epis_request_dt"
      assert proc_history.proch_cabg_prior_dt == ~D[2011-05-18]
      assert proc_history.proch_cabg_prior_yn == false
      assert proc_history.proch_cardiac_surg_other_yn == false
      assert proc_history.proch_carotid_surg_stent_dt == ~D[2011-05-18]
      assert proc_history.proch_carotid_surg_stent_yn == false
      assert proc_history.proch_notes == "some updated proch_notes"
      assert proc_history.proch_pacer_prior_dt == ~D[2011-05-18]
      assert proc_history.proch_pacer_prior_yn == false
      assert proc_history.proch_pci_prior_dt == ~D[2011-05-18]
      assert proc_history.proch_pci_prior_yn == false
      assert proc_history.proch_prior_icd_dt == ~D[2011-05-18]
      assert proc_history.proch_prior_icd_yn == false
      assert proc_history.proch_prior_rv_biopsy_dt == ~D[2011-05-18]
      assert proc_history.proch_prior_rv_biopsy_yn == false
      assert proc_history.proch_prior_valve_interv_dt == ~D[2011-05-18]
      assert proc_history.proch_prior_valve_interv_yn == false
      assert proc_history.proch_transplant_prior_dt == ~D[2011-05-18]
      assert proc_history.proch_transplant_prior_yn == false
    end

    test "update_proc_history/2 with invalid data returns error changeset" do
      proc_history = proc_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Histories.update_proc_history(proc_history, @invalid_attrs)
      assert proc_history == Histories.get_proc_history!(proc_history.id)
    end

    test "delete_proc_history/1 deletes the proc_history" do
      proc_history = proc_history_fixture()
      assert {:ok, %Proc_history{}} = Histories.delete_proc_history(proc_history)
      assert_raise Ecto.NoResultsError, fn -> Histories.get_proc_history!(proc_history.id) end
    end

    test "change_proc_history/1 returns a proc_history changeset" do
      proc_history = proc_history_fixture()
      assert %Ecto.Changeset{} = Histories.change_proc_history(proc_history)
    end
  end
end
