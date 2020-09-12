defmodule Angio.CongenitalsTest do
  use Angio.DataCase

  alias Angio.Congenitals

  describe "chd_care_episodes" do
    alias Angio.Congenitals.Chd_care_episode

    @valid_attrs %{chd_arrival_dt: ~D[2010-04-17], chd_cath_prior_recent_dt: ~D[2010-04-17], chd_cath_proc_recent_1_i: "some chd_cath_proc_recent_1_i", chd_cath_proc_recent_2_id: "some chd_cath_proc_recent_2_id", chd_cath_proc_recent_3_id: "some chd_cath_proc_recent_3_id", chd_cath_proc_recent_4_id: "some chd_cath_proc_recent_4_id", chd_cath_proc_recent_id: [], chd_caths_prior_num: "some chd_caths_prior_num", chd_caths_prior_yn: true, chd_country_of_residence: "some chd_country_of_residence", chd_episode_notes: "some chd_episode_notes", chd_gestational_age: "some chd_gestational_age", chd_premature_birth_yn: true, chd_pt_international_yn: true, chd_research_study_yn: true, chd_surg_prior_1_id: "some chd_surg_prior_1_id", chd_surg_prior_2_id: "some chd_surg_prior_2_id", chd_surg_prior_3_id: "some chd_surg_prior_3_id", chd_surg_prior_4_id: "some chd_surg_prior_4_id", chd_surg_prior_id: [], chd_surg_prior_numstring: "some chd_surg_prior_numstring", chd_surg_prior_yn: true, chd_surg_recent_dt: ~D[2010-04-17], chd_weight_at_birth: "some chd_weight_at_birth", pt_restriction_yn: true, uni_hic_num: "some uni_hic_num", uni_insurance: "some uni_insurance", uni_insurance_non_us: true}
    @update_attrs %{chd_arrival_dt: ~D[2011-05-18], chd_cath_prior_recent_dt: ~D[2011-05-18], chd_cath_proc_recent_1_i: "some updated chd_cath_proc_recent_1_i", chd_cath_proc_recent_2_id: "some updated chd_cath_proc_recent_2_id", chd_cath_proc_recent_3_id: "some updated chd_cath_proc_recent_3_id", chd_cath_proc_recent_4_id: "some updated chd_cath_proc_recent_4_id", chd_cath_proc_recent_id: [], chd_caths_prior_num: "some updated chd_caths_prior_num", chd_caths_prior_yn: false, chd_country_of_residence: "some updated chd_country_of_residence", chd_episode_notes: "some updated chd_episode_notes", chd_gestational_age: "some updated chd_gestational_age", chd_premature_birth_yn: false, chd_pt_international_yn: false, chd_research_study_yn: false, chd_surg_prior_1_id: "some updated chd_surg_prior_1_id", chd_surg_prior_2_id: "some updated chd_surg_prior_2_id", chd_surg_prior_3_id: "some updated chd_surg_prior_3_id", chd_surg_prior_4_id: "some updated chd_surg_prior_4_id", chd_surg_prior_id: [], chd_surg_prior_numstring: "some updated chd_surg_prior_numstring", chd_surg_prior_yn: false, chd_surg_recent_dt: ~D[2011-05-18], chd_weight_at_birth: "some updated chd_weight_at_birth", pt_restriction_yn: false, uni_hic_num: "some updated uni_hic_num", uni_insurance: "some updated uni_insurance", uni_insurance_non_us: false}
    @invalid_attrs %{chd_arrival_dt: nil, chd_cath_prior_recent_dt: nil, chd_cath_proc_recent_1_i: nil, chd_cath_proc_recent_2_id: nil, chd_cath_proc_recent_3_id: nil, chd_cath_proc_recent_4_id: nil, chd_cath_proc_recent_id: nil, chd_caths_prior_num: nil, chd_caths_prior_yn: nil, chd_country_of_residence: nil, chd_episode_notes: nil, chd_gestational_age: nil, chd_premature_birth_yn: nil, chd_pt_international_yn: nil, chd_research_study_yn: nil, chd_surg_prior_1_id: nil, chd_surg_prior_2_id: nil, chd_surg_prior_3_id: nil, chd_surg_prior_4_id: nil, chd_surg_prior_id: nil, chd_surg_prior_numstring: nil, chd_surg_prior_yn: nil, chd_surg_recent_dt: nil, chd_weight_at_birth: nil, pt_restriction_yn: nil, uni_hic_num: nil, uni_insurance: nil, uni_insurance_non_us: nil}

    def chd_care_episode_fixture(attrs \\ %{}) do
      {:ok, chd_care_episode} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Congenitals.create_chd_care_episode()

      chd_care_episode
    end

    test "list_chd_care_episodes/0 returns all chd_care_episodes" do
      chd_care_episode = chd_care_episode_fixture()
      assert Congenitals.list_chd_care_episodes() == [chd_care_episode]
    end

    test "get_chd_care_episode!/1 returns the chd_care_episode with given id" do
      chd_care_episode = chd_care_episode_fixture()
      assert Congenitals.get_chd_care_episode!(chd_care_episode.id) == chd_care_episode
    end

    test "create_chd_care_episode/1 with valid data creates a chd_care_episode" do
      assert {:ok, %Chd_care_episode{} = chd_care_episode} = Congenitals.create_chd_care_episode(@valid_attrs)
      assert chd_care_episode.chd_arrival_dt == ~D[2010-04-17]
      assert chd_care_episode.chd_cath_prior_recent_dt == ~D[2010-04-17]
      assert chd_care_episode.chd_cath_proc_recent_1_i == "some chd_cath_proc_recent_1_i"
      assert chd_care_episode.chd_cath_proc_recent_2_id == "some chd_cath_proc_recent_2_id"
      assert chd_care_episode.chd_cath_proc_recent_3_id == "some chd_cath_proc_recent_3_id"
      assert chd_care_episode.chd_cath_proc_recent_4_id == "some chd_cath_proc_recent_4_id"
      assert chd_care_episode.chd_cath_proc_recent_id == []
      assert chd_care_episode.chd_caths_prior_num == "some chd_caths_prior_num"
      assert chd_care_episode.chd_caths_prior_yn == true
      assert chd_care_episode.chd_country_of_residence == "some chd_country_of_residence"
      assert chd_care_episode.chd_episode_notes == "some chd_episode_notes"
      assert chd_care_episode.chd_gestational_age == "some chd_gestational_age"
      assert chd_care_episode.chd_premature_birth_yn == true
      assert chd_care_episode.chd_pt_international_yn == true
      assert chd_care_episode.chd_research_study_yn == true
      assert chd_care_episode.chd_surg_prior_1_id == "some chd_surg_prior_1_id"
      assert chd_care_episode.chd_surg_prior_2_id == "some chd_surg_prior_2_id"
      assert chd_care_episode.chd_surg_prior_3_id == "some chd_surg_prior_3_id"
      assert chd_care_episode.chd_surg_prior_4_id == "some chd_surg_prior_4_id"
      assert chd_care_episode.chd_surg_prior_id == []
      assert chd_care_episode.chd_surg_prior_numstring == "some chd_surg_prior_numstring"
      assert chd_care_episode.chd_surg_prior_yn == true
      assert chd_care_episode.chd_surg_recent_dt == ~D[2010-04-17]
      assert chd_care_episode.chd_weight_at_birth == "some chd_weight_at_birth"
      assert chd_care_episode.pt_restriction_yn == true
      assert chd_care_episode.uni_hic_num == "some uni_hic_num"
      assert chd_care_episode.uni_insurance == "some uni_insurance"
      assert chd_care_episode.uni_insurance_non_us == true
    end

    test "create_chd_care_episode/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congenitals.create_chd_care_episode(@invalid_attrs)
    end

    test "update_chd_care_episode/2 with valid data updates the chd_care_episode" do
      chd_care_episode = chd_care_episode_fixture()
      assert {:ok, %Chd_care_episode{} = chd_care_episode} = Congenitals.update_chd_care_episode(chd_care_episode, @update_attrs)
      assert chd_care_episode.chd_arrival_dt == ~D[2011-05-18]
      assert chd_care_episode.chd_cath_prior_recent_dt == ~D[2011-05-18]
      assert chd_care_episode.chd_cath_proc_recent_1_i == "some updated chd_cath_proc_recent_1_i"
      assert chd_care_episode.chd_cath_proc_recent_2_id == "some updated chd_cath_proc_recent_2_id"
      assert chd_care_episode.chd_cath_proc_recent_3_id == "some updated chd_cath_proc_recent_3_id"
      assert chd_care_episode.chd_cath_proc_recent_4_id == "some updated chd_cath_proc_recent_4_id"
      assert chd_care_episode.chd_cath_proc_recent_id == []
      assert chd_care_episode.chd_caths_prior_num == "some updated chd_caths_prior_num"
      assert chd_care_episode.chd_caths_prior_yn == false
      assert chd_care_episode.chd_country_of_residence == "some updated chd_country_of_residence"
      assert chd_care_episode.chd_episode_notes == "some updated chd_episode_notes"
      assert chd_care_episode.chd_gestational_age == "some updated chd_gestational_age"
      assert chd_care_episode.chd_premature_birth_yn == false
      assert chd_care_episode.chd_pt_international_yn == false
      assert chd_care_episode.chd_research_study_yn == false
      assert chd_care_episode.chd_surg_prior_1_id == "some updated chd_surg_prior_1_id"
      assert chd_care_episode.chd_surg_prior_2_id == "some updated chd_surg_prior_2_id"
      assert chd_care_episode.chd_surg_prior_3_id == "some updated chd_surg_prior_3_id"
      assert chd_care_episode.chd_surg_prior_4_id == "some updated chd_surg_prior_4_id"
      assert chd_care_episode.chd_surg_prior_id == []
      assert chd_care_episode.chd_surg_prior_numstring == "some updated chd_surg_prior_numstring"
      assert chd_care_episode.chd_surg_prior_yn == false
      assert chd_care_episode.chd_surg_recent_dt == ~D[2011-05-18]
      assert chd_care_episode.chd_weight_at_birth == "some updated chd_weight_at_birth"
      assert chd_care_episode.pt_restriction_yn == false
      assert chd_care_episode.uni_hic_num == "some updated uni_hic_num"
      assert chd_care_episode.uni_insurance == "some updated uni_insurance"
      assert chd_care_episode.uni_insurance_non_us == false
    end

    test "update_chd_care_episode/2 with invalid data returns error changeset" do
      chd_care_episode = chd_care_episode_fixture()
      assert {:error, %Ecto.Changeset{}} = Congenitals.update_chd_care_episode(chd_care_episode, @invalid_attrs)
      assert chd_care_episode == Congenitals.get_chd_care_episode!(chd_care_episode.id)
    end

    test "delete_chd_care_episode/1 deletes the chd_care_episode" do
      chd_care_episode = chd_care_episode_fixture()
      assert {:ok, %Chd_care_episode{}} = Congenitals.delete_chd_care_episode(chd_care_episode)
      assert_raise Ecto.NoResultsError, fn -> Congenitals.get_chd_care_episode!(chd_care_episode.id) end
    end

    test "change_chd_care_episode/1 returns a chd_care_episode changeset" do
      chd_care_episode = chd_care_episode_fixture()
      assert %Ecto.Changeset{} = Congenitals.change_chd_care_episode(chd_care_episode)
    end
  end

  describe "chd_conditions" do
    alias Angio.Congenitals.Chd_condition

    @valid_attrs %{chd_conditions_notes: "some chd_conditions_notes", chd_diaphragm_hernia_yn: true, chd_heterotaxy_yn: true, chd_rubella_prior_yn: true, chd_syndrome_alagille_yn: true, chd_syndrome_digeorge_yn: true, chd_syndrome_down_yn: true, chd_syndrome_marfan_yn: true, chd_syndrome_noonan_yn: true, chd_syndrome_turner_yn: true, chd_syndrome_williams_yn: true, chd_trisomy_13_yn: true, chd_trisomy_18_yn: true}
    @update_attrs %{chd_conditions_notes: "some updated chd_conditions_notes", chd_diaphragm_hernia_yn: false, chd_heterotaxy_yn: false, chd_rubella_prior_yn: false, chd_syndrome_alagille_yn: false, chd_syndrome_digeorge_yn: false, chd_syndrome_down_yn: false, chd_syndrome_marfan_yn: false, chd_syndrome_noonan_yn: false, chd_syndrome_turner_yn: false, chd_syndrome_williams_yn: false, chd_trisomy_13_yn: false, chd_trisomy_18_yn: false}
    @invalid_attrs %{chd_conditions_notes: nil, chd_diaphragm_hernia_yn: nil, chd_heterotaxy_yn: nil, chd_rubella_prior_yn: nil, chd_syndrome_alagille_yn: nil, chd_syndrome_digeorge_yn: nil, chd_syndrome_down_yn: nil, chd_syndrome_marfan_yn: nil, chd_syndrome_noonan_yn: nil, chd_syndrome_turner_yn: nil, chd_syndrome_williams_yn: nil, chd_trisomy_13_yn: nil, chd_trisomy_18_yn: nil}

    def chd_condition_fixture(attrs \\ %{}) do
      {:ok, chd_condition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Congenitals.create_chd_condition()

      chd_condition
    end

    test "list_chd_conditions/0 returns all chd_conditions" do
      chd_condition = chd_condition_fixture()
      assert Congenitals.list_chd_conditions() == [chd_condition]
    end

    test "get_chd_condition!/1 returns the chd_condition with given id" do
      chd_condition = chd_condition_fixture()
      assert Congenitals.get_chd_condition!(chd_condition.id) == chd_condition
    end

    test "create_chd_condition/1 with valid data creates a chd_condition" do
      assert {:ok, %Chd_condition{} = chd_condition} = Congenitals.create_chd_condition(@valid_attrs)
      assert chd_condition.chd_conditions_notes == "some chd_conditions_notes"
      assert chd_condition.chd_diaphragm_hernia_yn == true
      assert chd_condition.chd_heterotaxy_yn == true
      assert chd_condition.chd_rubella_prior_yn == true
      assert chd_condition.chd_syndrome_alagille_yn == true
      assert chd_condition.chd_syndrome_digeorge_yn == true
      assert chd_condition.chd_syndrome_down_yn == true
      assert chd_condition.chd_syndrome_marfan_yn == true
      assert chd_condition.chd_syndrome_noonan_yn == true
      assert chd_condition.chd_syndrome_turner_yn == true
      assert chd_condition.chd_syndrome_williams_yn == true
      assert chd_condition.chd_trisomy_13_yn == true
      assert chd_condition.chd_trisomy_18_yn == true
    end

    test "create_chd_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congenitals.create_chd_condition(@invalid_attrs)
    end

    test "update_chd_condition/2 with valid data updates the chd_condition" do
      chd_condition = chd_condition_fixture()
      assert {:ok, %Chd_condition{} = chd_condition} = Congenitals.update_chd_condition(chd_condition, @update_attrs)
      assert chd_condition.chd_conditions_notes == "some updated chd_conditions_notes"
      assert chd_condition.chd_diaphragm_hernia_yn == false
      assert chd_condition.chd_heterotaxy_yn == false
      assert chd_condition.chd_rubella_prior_yn == false
      assert chd_condition.chd_syndrome_alagille_yn == false
      assert chd_condition.chd_syndrome_digeorge_yn == false
      assert chd_condition.chd_syndrome_down_yn == false
      assert chd_condition.chd_syndrome_marfan_yn == false
      assert chd_condition.chd_syndrome_noonan_yn == false
      assert chd_condition.chd_syndrome_turner_yn == false
      assert chd_condition.chd_syndrome_williams_yn == false
      assert chd_condition.chd_trisomy_13_yn == false
      assert chd_condition.chd_trisomy_18_yn == false
    end

    test "update_chd_condition/2 with invalid data returns error changeset" do
      chd_condition = chd_condition_fixture()
      assert {:error, %Ecto.Changeset{}} = Congenitals.update_chd_condition(chd_condition, @invalid_attrs)
      assert chd_condition == Congenitals.get_chd_condition!(chd_condition.id)
    end

    test "delete_chd_condition/1 deletes the chd_condition" do
      chd_condition = chd_condition_fixture()
      assert {:ok, %Chd_condition{}} = Congenitals.delete_chd_condition(chd_condition)
      assert_raise Ecto.NoResultsError, fn -> Congenitals.get_chd_condition!(chd_condition.id) end
    end

    test "change_chd_condition/1 returns a chd_condition changeset" do
      chd_condition = chd_condition_fixture()
      assert %Ecto.Changeset{} = Congenitals.change_chd_condition(chd_condition)
    end
  end

  describe "chd_risk_factors" do
    alias Angio.Congenitals.Chd_risk_factor

    @valid_attrs %{chd_arrhythmia_history: [], chd_cardiomyopathy_history: "some chd_cardiomyopathy_history", chd_cardiomyopathy_yn: true, chd_chronic_lung_disease_yn: true, chd_coagulation_disorder_yn: true, chd_diabetes_yn: true, chd_endocarditis_yn: true, chd_heart_transplant_yn: true, chd_hepatic_disease_yn: true, chd_hf_1_month_yn: true, chd_hyper_coagulable_state_yn: true, chd_hypo_coagulable_state_yn: true, chd_ischemic_heart_disease_yn: true, chd_kawasaki_yn: true, chd_nyha: "some chd_nyha", chd_renal_insufficiency_yn: true, chd_rheumatic_heart_disease_yn: true, chd_risk_factors_notes: "some chd_risk_factors_notes", chd_seizure_disorder_yn: true, chd_sickle_cell_anemia_yn: true, chd_stroke_prior_yn: true}
    @update_attrs %{chd_arrhythmia_history: [], chd_cardiomyopathy_history: "some updated chd_cardiomyopathy_history", chd_cardiomyopathy_yn: false, chd_chronic_lung_disease_yn: false, chd_coagulation_disorder_yn: false, chd_diabetes_yn: false, chd_endocarditis_yn: false, chd_heart_transplant_yn: false, chd_hepatic_disease_yn: false, chd_hf_1_month_yn: false, chd_hyper_coagulable_state_yn: false, chd_hypo_coagulable_state_yn: false, chd_ischemic_heart_disease_yn: false, chd_kawasaki_yn: false, chd_nyha: "some updated chd_nyha", chd_renal_insufficiency_yn: false, chd_rheumatic_heart_disease_yn: false, chd_risk_factors_notes: "some updated chd_risk_factors_notes", chd_seizure_disorder_yn: false, chd_sickle_cell_anemia_yn: false, chd_stroke_prior_yn: false}
    @invalid_attrs %{chd_arrhythmia_history: nil, chd_cardiomyopathy_history: nil, chd_cardiomyopathy_yn: nil, chd_chronic_lung_disease_yn: nil, chd_coagulation_disorder_yn: nil, chd_diabetes_yn: nil, chd_endocarditis_yn: nil, chd_heart_transplant_yn: nil, chd_hepatic_disease_yn: nil, chd_hf_1_month_yn: nil, chd_hyper_coagulable_state_yn: nil, chd_hypo_coagulable_state_yn: nil, chd_ischemic_heart_disease_yn: nil, chd_kawasaki_yn: nil, chd_nyha: nil, chd_renal_insufficiency_yn: nil, chd_rheumatic_heart_disease_yn: nil, chd_risk_factors_notes: nil, chd_seizure_disorder_yn: nil, chd_sickle_cell_anemia_yn: nil, chd_stroke_prior_yn: nil}

    def chd_risk_factor_fixture(attrs \\ %{}) do
      {:ok, chd_risk_factor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Congenitals.create_chd_risk_factor()

      chd_risk_factor
    end

    test "list_chd_risk_factors/0 returns all chd_risk_factors" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert Congenitals.list_chd_risk_factors() == [chd_risk_factor]
    end

    test "get_chd_risk_factor!/1 returns the chd_risk_factor with given id" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert Congenitals.get_chd_risk_factor!(chd_risk_factor.id) == chd_risk_factor
    end

    test "create_chd_risk_factor/1 with valid data creates a chd_risk_factor" do
      assert {:ok, %Chd_risk_factor{} = chd_risk_factor} = Congenitals.create_chd_risk_factor(@valid_attrs)
      assert chd_risk_factor.chd_arrhythmia_history == []
      assert chd_risk_factor.chd_cardiomyopathy_history == "some chd_cardiomyopathy_history"
      assert chd_risk_factor.chd_cardiomyopathy_yn == true
      assert chd_risk_factor.chd_chronic_lung_disease_yn == true
      assert chd_risk_factor.chd_coagulation_disorder_yn == true
      assert chd_risk_factor.chd_diabetes_yn == true
      assert chd_risk_factor.chd_endocarditis_yn == true
      assert chd_risk_factor.chd_heart_transplant_yn == true
      assert chd_risk_factor.chd_hepatic_disease_yn == true
      assert chd_risk_factor.chd_hf_1_month_yn == true
      assert chd_risk_factor.chd_hyper_coagulable_state_yn == true
      assert chd_risk_factor.chd_hypo_coagulable_state_yn == true
      assert chd_risk_factor.chd_ischemic_heart_disease_yn == true
      assert chd_risk_factor.chd_kawasaki_yn == true
      assert chd_risk_factor.chd_nyha == "some chd_nyha"
      assert chd_risk_factor.chd_renal_insufficiency_yn == true
      assert chd_risk_factor.chd_rheumatic_heart_disease_yn == true
      assert chd_risk_factor.chd_risk_factors_notes == "some chd_risk_factors_notes"
      assert chd_risk_factor.chd_seizure_disorder_yn == true
      assert chd_risk_factor.chd_sickle_cell_anemia_yn == true
      assert chd_risk_factor.chd_stroke_prior_yn == true
    end

    test "create_chd_risk_factor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congenitals.create_chd_risk_factor(@invalid_attrs)
    end

    test "update_chd_risk_factor/2 with valid data updates the chd_risk_factor" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert {:ok, %Chd_risk_factor{} = chd_risk_factor} = Congenitals.update_chd_risk_factor(chd_risk_factor, @update_attrs)
      assert chd_risk_factor.chd_arrhythmia_history == []
      assert chd_risk_factor.chd_cardiomyopathy_history == "some updated chd_cardiomyopathy_history"
      assert chd_risk_factor.chd_cardiomyopathy_yn == false
      assert chd_risk_factor.chd_chronic_lung_disease_yn == false
      assert chd_risk_factor.chd_coagulation_disorder_yn == false
      assert chd_risk_factor.chd_diabetes_yn == false
      assert chd_risk_factor.chd_endocarditis_yn == false
      assert chd_risk_factor.chd_heart_transplant_yn == false
      assert chd_risk_factor.chd_hepatic_disease_yn == false
      assert chd_risk_factor.chd_hf_1_month_yn == false
      assert chd_risk_factor.chd_hyper_coagulable_state_yn == false
      assert chd_risk_factor.chd_hypo_coagulable_state_yn == false
      assert chd_risk_factor.chd_ischemic_heart_disease_yn == false
      assert chd_risk_factor.chd_kawasaki_yn == false
      assert chd_risk_factor.chd_nyha == "some updated chd_nyha"
      assert chd_risk_factor.chd_renal_insufficiency_yn == false
      assert chd_risk_factor.chd_rheumatic_heart_disease_yn == false
      assert chd_risk_factor.chd_risk_factors_notes == "some updated chd_risk_factors_notes"
      assert chd_risk_factor.chd_seizure_disorder_yn == false
      assert chd_risk_factor.chd_sickle_cell_anemia_yn == false
      assert chd_risk_factor.chd_stroke_prior_yn == false
    end

    test "update_chd_risk_factor/2 with invalid data returns error changeset" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert {:error, %Ecto.Changeset{}} = Congenitals.update_chd_risk_factor(chd_risk_factor, @invalid_attrs)
      assert chd_risk_factor == Congenitals.get_chd_risk_factor!(chd_risk_factor.id)
    end

    test "delete_chd_risk_factor/1 deletes the chd_risk_factor" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert {:ok, %Chd_risk_factor{}} = Congenitals.delete_chd_risk_factor(chd_risk_factor)
      assert_raise Ecto.NoResultsError, fn -> Congenitals.get_chd_risk_factor!(chd_risk_factor.id) end
    end

    test "change_chd_risk_factor/1 returns a chd_risk_factor changeset" do
      chd_risk_factor = chd_risk_factor_fixture()
      assert %Ecto.Changeset{} = Congenitals.change_chd_risk_factor(chd_risk_factor)
    end
  end
end
