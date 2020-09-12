defmodule Angio.FollowupsTest do
  use Angio.DataCase

  alias Angio.Followups

  describe "asd_closures_fups" do
    alias Angio.Followups.Asd_closures_fup

    @valid_attrs %{asdclf_anti_platelet_yn: true, asdclf_arrhythmias_yn: true, asdclf_assessment_dt: ~D[2010-04-17], asdclf_embolization_yn: true, asdclf_erosion_yn: true, asdclf_frame_fracture_yn: true, asdclf_free_events_yn: true, asdclf_fup_status: "some asdclf_fup_status", asdclf_new_headaches_yn: true, asdclf_notes: "some asdclf_notes", asdclf_reintervention_closure_dt: ~D[2010-04-17], asdclf_reintervention_closure_yn: "some asdclf_reintervention_closure_yn", asdclf_residual_shunt_size: "some asdclf_residual_shunt_size", asdclf_retrivied_surgery_yn: true, asdclf_sbe_diagnosis_dt: ~D[2010-04-17], asdclf_sbe_factors: "some asdclf_sbe_factors", asdclf_sbe_treatment: "some asdclf_sbe_treatment", asdclf_sbe_yn: true, asdclf_start_dt: ~D[2010-04-17], asdclf_visit_status: "some asdclf_visit_status"}
    @update_attrs %{asdclf_anti_platelet_yn: false, asdclf_arrhythmias_yn: false, asdclf_assessment_dt: ~D[2011-05-18], asdclf_embolization_yn: false, asdclf_erosion_yn: false, asdclf_frame_fracture_yn: false, asdclf_free_events_yn: false, asdclf_fup_status: "some updated asdclf_fup_status", asdclf_new_headaches_yn: false, asdclf_notes: "some updated asdclf_notes", asdclf_reintervention_closure_dt: ~D[2011-05-18], asdclf_reintervention_closure_yn: "some updated asdclf_reintervention_closure_yn", asdclf_residual_shunt_size: "some updated asdclf_residual_shunt_size", asdclf_retrivied_surgery_yn: false, asdclf_sbe_diagnosis_dt: ~D[2011-05-18], asdclf_sbe_factors: "some updated asdclf_sbe_factors", asdclf_sbe_treatment: "some updated asdclf_sbe_treatment", asdclf_sbe_yn: false, asdclf_start_dt: ~D[2011-05-18], asdclf_visit_status: "some updated asdclf_visit_status"}
    @invalid_attrs %{asdclf_anti_platelet_yn: nil, asdclf_arrhythmias_yn: nil, asdclf_assessment_dt: nil, asdclf_embolization_yn: nil, asdclf_erosion_yn: nil, asdclf_frame_fracture_yn: nil, asdclf_free_events_yn: nil, asdclf_fup_status: nil, asdclf_new_headaches_yn: nil, asdclf_notes: nil, asdclf_reintervention_closure_dt: nil, asdclf_reintervention_closure_yn: nil, asdclf_residual_shunt_size: nil, asdclf_retrivied_surgery_yn: nil, asdclf_sbe_diagnosis_dt: nil, asdclf_sbe_factors: nil, asdclf_sbe_treatment: nil, asdclf_sbe_yn: nil, asdclf_start_dt: nil, asdclf_visit_status: nil}

    def asd_closures_fup_fixture(attrs \\ %{}) do
      {:ok, asd_closures_fup} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Followups.create_asd_closures_fup()

      asd_closures_fup
    end

    test "list_asd_closures_fups/0 returns all asd_closures_fups" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert Followups.list_asd_closures_fups() == [asd_closures_fup]
    end

    test "get_asd_closures_fup!/1 returns the asd_closures_fup with given id" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert Followups.get_asd_closures_fup!(asd_closures_fup.id) == asd_closures_fup
    end

    test "create_asd_closures_fup/1 with valid data creates a asd_closures_fup" do
      assert {:ok, %Asd_closures_fup{} = asd_closures_fup} = Followups.create_asd_closures_fup(@valid_attrs)
      assert asd_closures_fup.asdclf_anti_platelet_yn == true
      assert asd_closures_fup.asdclf_arrhythmias_yn == true
      assert asd_closures_fup.asdclf_assessment_dt == ~D[2010-04-17]
      assert asd_closures_fup.asdclf_embolization_yn == true
      assert asd_closures_fup.asdclf_erosion_yn == true
      assert asd_closures_fup.asdclf_frame_fracture_yn == true
      assert asd_closures_fup.asdclf_free_events_yn == true
      assert asd_closures_fup.asdclf_fup_status == "some asdclf_fup_status"
      assert asd_closures_fup.asdclf_new_headaches_yn == true
      assert asd_closures_fup.asdclf_notes == "some asdclf_notes"
      assert asd_closures_fup.asdclf_reintervention_closure_dt == ~D[2010-04-17]
      assert asd_closures_fup.asdclf_reintervention_closure_yn == "some asdclf_reintervention_closure_yn"
      assert asd_closures_fup.asdclf_residual_shunt_size == "some asdclf_residual_shunt_size"
      assert asd_closures_fup.asdclf_retrivied_surgery_yn == true
      assert asd_closures_fup.asdclf_sbe_diagnosis_dt == ~D[2010-04-17]
      assert asd_closures_fup.asdclf_sbe_factors == "some asdclf_sbe_factors"
      assert asd_closures_fup.asdclf_sbe_treatment == "some asdclf_sbe_treatment"
      assert asd_closures_fup.asdclf_sbe_yn == true
      assert asd_closures_fup.asdclf_start_dt == ~D[2010-04-17]
      assert asd_closures_fup.asdclf_visit_status == "some asdclf_visit_status"
    end

    test "create_asd_closures_fup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Followups.create_asd_closures_fup(@invalid_attrs)
    end

    test "update_asd_closures_fup/2 with valid data updates the asd_closures_fup" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert {:ok, %Asd_closures_fup{} = asd_closures_fup} = Followups.update_asd_closures_fup(asd_closures_fup, @update_attrs)
      assert asd_closures_fup.asdclf_anti_platelet_yn == false
      assert asd_closures_fup.asdclf_arrhythmias_yn == false
      assert asd_closures_fup.asdclf_assessment_dt == ~D[2011-05-18]
      assert asd_closures_fup.asdclf_embolization_yn == false
      assert asd_closures_fup.asdclf_erosion_yn == false
      assert asd_closures_fup.asdclf_frame_fracture_yn == false
      assert asd_closures_fup.asdclf_free_events_yn == false
      assert asd_closures_fup.asdclf_fup_status == "some updated asdclf_fup_status"
      assert asd_closures_fup.asdclf_new_headaches_yn == false
      assert asd_closures_fup.asdclf_notes == "some updated asdclf_notes"
      assert asd_closures_fup.asdclf_reintervention_closure_dt == ~D[2011-05-18]
      assert asd_closures_fup.asdclf_reintervention_closure_yn == "some updated asdclf_reintervention_closure_yn"
      assert asd_closures_fup.asdclf_residual_shunt_size == "some updated asdclf_residual_shunt_size"
      assert asd_closures_fup.asdclf_retrivied_surgery_yn == false
      assert asd_closures_fup.asdclf_sbe_diagnosis_dt == ~D[2011-05-18]
      assert asd_closures_fup.asdclf_sbe_factors == "some updated asdclf_sbe_factors"
      assert asd_closures_fup.asdclf_sbe_treatment == "some updated asdclf_sbe_treatment"
      assert asd_closures_fup.asdclf_sbe_yn == false
      assert asd_closures_fup.asdclf_start_dt == ~D[2011-05-18]
      assert asd_closures_fup.asdclf_visit_status == "some updated asdclf_visit_status"
    end

    test "update_asd_closures_fup/2 with invalid data returns error changeset" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert {:error, %Ecto.Changeset{}} = Followups.update_asd_closures_fup(asd_closures_fup, @invalid_attrs)
      assert asd_closures_fup == Followups.get_asd_closures_fup!(asd_closures_fup.id)
    end

    test "delete_asd_closures_fup/1 deletes the asd_closures_fup" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert {:ok, %Asd_closures_fup{}} = Followups.delete_asd_closures_fup(asd_closures_fup)
      assert_raise Ecto.NoResultsError, fn -> Followups.get_asd_closures_fup!(asd_closures_fup.id) end
    end

    test "change_asd_closures_fup/1 returns a asd_closures_fup changeset" do
      asd_closures_fup = asd_closures_fup_fixture()
      assert %Ecto.Changeset{} = Followups.change_asd_closures_fup(asd_closures_fup)
    end
  end

  describe "pci_fups" do
    alias Angio.Followups.Pci_fup

    @valid_attrs %{pfup_stroke_dt: ~D[2010-04-17], pfup_old_infarction_location: "some pfup_old_infarction_location", pfup_angina_duration: "some pfup_angina_duration", pfup_xa_inhibitors: "some pfup_xa_inhibitors", pfup_clinical_improvement_yn: true, pfup_reason: "some pfup_reason", pfup_diuretics_yn: true, pfup_notes: "some pfup_notes", pfup_complications_after_pci: true, pfup_stent_thrombosis_dt: ~D[2010-04-17], pfup_readmission_yn: true, pfup_prior_stent_type: "some pfup_prior_stent_type", pfup_angio_after_yn: true, pfup_readmission_dt: ~D[2010-04-17], pfup_infarction_notes: "some pfup_infarction_notes", pfup_arb_yn: true, pfup_stent_thrombosis_timing: "some pfup_stent_thrombosis_timing", pfup_beta_blocker_yn: true, pfup_angina_last_episode_dt: ~D[2010-04-17], pfup_survival_status: "some pfup_survival_status", pfup_assessment_dt: ~D[2010-04-17], pfup_pci_after_dt: ~D[2010-04-17], pfup_other_intevention_yn: true, pfup_thienopyridines_types: "some pfup_thienopyridines_types", pfup_nitrates_yn: true, pfup_no_statin_yn: true, pfup_angio_after_results: "some pfup_angio_after_results", pfup_cabage_notes: "some pfup_cabage_notes", pfup_angio_after_dt: ~D[2010-04-17], pfup_new_infarction_dt: ~D[2010-04-17], pfup_new_infarction_location: "some pfup_new_infarction_location", pfup_pci_after_yn: true, pfup_ace_yn: true, pfup_angina_class_canadian: "some pfup_angina_class_canadian", pfup_death_dt: ~D[2010-04-17], pfup_chest_pain: "some pfup_chest_pain", pfup_readmission_reason: "some pfup_readmission_reason", pfup_rehabilitation: "some pfup_rehabilitation", pfup_antiplatelet_yn: true, pfup_other_intevention_notes: "some pfup_other_intevention_notes", pfup_statin_yn: true, pfup_pci_location: [], pfup_primary_fup_method: "some pfup_primary_fup_method", pfup_infarction_yn: true, pfup_new_infarction_treatment: "some pfup_new_infarction_treatment", pfup_death_cause: "some pfup_death_cause", pfup_cabg_after_dt: ~D[2010-04-17], pfup_angina_total_num: "some pfup_angina_total_num", pfup_anticoagulant_yn: true, pfup_angina_type: "some pfup_angina_type", ...}
    @update_attrs %{pfup_stroke_dt: ~D[2011-05-18], pfup_old_infarction_location: "some updated pfup_old_infarction_location", pfup_angina_duration: "some updated pfup_angina_duration", pfup_xa_inhibitors: "some updated pfup_xa_inhibitors", pfup_clinical_improvement_yn: false, pfup_reason: "some updated pfup_reason", pfup_diuretics_yn: false, pfup_notes: "some updated pfup_notes", pfup_complications_after_pci: false, pfup_stent_thrombosis_dt: ~D[2011-05-18], pfup_readmission_yn: false, pfup_prior_stent_type: "some updated pfup_prior_stent_type", pfup_angio_after_yn: false, pfup_readmission_dt: ~D[2011-05-18], pfup_infarction_notes: "some updated pfup_infarction_notes", pfup_arb_yn: false, pfup_stent_thrombosis_timing: "some updated pfup_stent_thrombosis_timing", pfup_beta_blocker_yn: false, pfup_angina_last_episode_dt: ~D[2011-05-18], pfup_survival_status: "some updated pfup_survival_status", pfup_assessment_dt: ~D[2011-05-18], pfup_pci_after_dt: ~D[2011-05-18], pfup_other_intevention_yn: false, pfup_thienopyridines_types: "some updated pfup_thienopyridines_types", pfup_nitrates_yn: false, pfup_no_statin_yn: false, pfup_angio_after_results: "some updated pfup_angio_after_results", pfup_cabage_notes: "some updated pfup_cabage_notes", pfup_angio_after_dt: ~D[2011-05-18], pfup_new_infarction_dt: ~D[2011-05-18], pfup_new_infarction_location: "some updated pfup_new_infarction_location", pfup_pci_after_yn: false, pfup_ace_yn: false, pfup_angina_class_canadian: "some updated pfup_angina_class_canadian", pfup_death_dt: ~D[2011-05-18], pfup_chest_pain: "some updated pfup_chest_pain", pfup_readmission_reason: "some updated pfup_readmission_reason", pfup_rehabilitation: "some updated pfup_rehabilitation", pfup_antiplatelet_yn: false, pfup_other_intevention_notes: "some updated pfup_other_intevention_notes", pfup_statin_yn: false, pfup_pci_location: [], pfup_primary_fup_method: "some updated pfup_primary_fup_method", pfup_infarction_yn: false, pfup_new_infarction_treatment: "some updated pfup_new_infarction_treatment", pfup_death_cause: "some updated pfup_death_cause", pfup_cabg_after_dt: ~D[2011-05-18], pfup_angina_total_num: "some updated pfup_angina_total_num", pfup_anticoagulant_yn: false, pfup_angina_type: "some updated pfup_angina_type", ...}
    @invalid_attrs %{pfup_stroke_dt: nil, pfup_old_infarction_location: nil, pfup_angina_duration: nil, pfup_xa_inhibitors: nil, pfup_clinical_improvement_yn: nil, pfup_reason: nil, pfup_diuretics_yn: nil, pfup_notes: nil, pfup_complications_after_pci: nil, pfup_stent_thrombosis_dt: nil, pfup_readmission_yn: nil, pfup_prior_stent_type: nil, pfup_angio_after_yn: nil, pfup_readmission_dt: nil, pfup_infarction_notes: nil, pfup_arb_yn: nil, pfup_stent_thrombosis_timing: nil, pfup_beta_blocker_yn: nil, pfup_angina_last_episode_dt: nil, pfup_survival_status: nil, pfup_assessment_dt: nil, pfup_pci_after_dt: nil, pfup_other_intevention_yn: nil, pfup_thienopyridines_types: nil, pfup_nitrates_yn: nil, pfup_no_statin_yn: nil, pfup_angio_after_results: nil, pfup_cabage_notes: nil, pfup_angio_after_dt: nil, pfup_new_infarction_dt: nil, pfup_new_infarction_location: nil, pfup_pci_after_yn: nil, pfup_ace_yn: nil, pfup_angina_class_canadian: nil, pfup_death_dt: nil, pfup_chest_pain: nil, pfup_readmission_reason: nil, pfup_rehabilitation: nil, pfup_antiplatelet_yn: nil, pfup_other_intevention_notes: nil, pfup_statin_yn: nil, pfup_pci_location: nil, pfup_primary_fup_method: nil, pfup_infarction_yn: nil, pfup_new_infarction_treatment: nil, pfup_death_cause: nil, pfup_cabg_after_dt: nil, pfup_angina_total_num: nil, pfup_anticoagulant_yn: nil, pfup_angina_type: nil, ...}

    def pci_fup_fixture(attrs \\ %{}) do
      {:ok, pci_fup} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Followups.create_pci_fup()

      pci_fup
    end

    test "list_pci_fups/0 returns all pci_fups" do
      pci_fup = pci_fup_fixture()
      assert Followups.list_pci_fups() == [pci_fup]
    end

    test "get_pci_fup!/1 returns the pci_fup with given id" do
      pci_fup = pci_fup_fixture()
      assert Followups.get_pci_fup!(pci_fup.id) == pci_fup
    end

    test "create_pci_fup/1 with valid data creates a pci_fup" do
      assert {:ok, %Pci_fup{} = pci_fup} = Followups.create_pci_fup(@valid_attrs)
      assert pci_fup.pfup_cabg_after_yn == true
      assert pci_fup.pfup_aspirin_yn == true
      assert pci_fup.pfup_nyha == "some pfup_nyha"
      assert pci_fup.pfup_type == "some pfup_type"
      assert pci_fup.pfup_stent_thrombosis_yn == true
      assert pci_fup.pfup_thienopyridines == "some pfup_thienopyridines"
      assert pci_fup.pfup_stroke_yn == true
      assert pci_fup.pfup_angina_type == "some pfup_angina_type"
      assert pci_fup.pfup_anticoagulant_yn == true
      assert pci_fup.pfup_angina_total_num == "some pfup_angina_total_num"
      assert pci_fup.pfup_cabg_after_dt == ~D[2010-04-17]
      assert pci_fup.pfup_death_cause == "some pfup_death_cause"
      assert pci_fup.pfup_new_infarction_treatment == "some pfup_new_infarction_treatment"
      assert pci_fup.pfup_infarction_yn == true
      assert pci_fup.pfup_primary_fup_method == "some pfup_primary_fup_method"
      assert pci_fup.pfup_pci_location == []
      assert pci_fup.pfup_statin_yn == true
      assert pci_fup.pfup_other_intevention_notes == "some pfup_other_intevention_notes"
      assert pci_fup.pfup_antiplatelet_yn == true
      assert pci_fup.pfup_rehabilitation == "some pfup_rehabilitation"
      assert pci_fup.pfup_readmission_reason == "some pfup_readmission_reason"
      assert pci_fup.pfup_chest_pain == "some pfup_chest_pain"
      assert pci_fup.pfup_death_dt == ~D[2010-04-17]
      assert pci_fup.pfup_angina_class_canadian == "some pfup_angina_class_canadian"
      assert pci_fup.pfup_ace_yn == true
      assert pci_fup.pfup_pci_after_yn == true
      assert pci_fup.pfup_new_infarction_location == "some pfup_new_infarction_location"
      assert pci_fup.pfup_new_infarction_dt == ~D[2010-04-17]
      assert pci_fup.pfup_angio_after_dt == ~D[2010-04-17]
      assert pci_fup.pfup_cabage_notes == "some pfup_cabage_notes"
      assert pci_fup.pfup_angio_after_results == "some pfup_angio_after_results"
      assert pci_fup.pfup_no_statin_yn == true
      assert pci_fup.pfup_nitrates_yn == true
      assert pci_fup.pfup_thienopyridines_types == "some pfup_thienopyridines_types"
      assert pci_fup.pfup_other_intevention_yn == true
      assert pci_fup.pfup_pci_after_dt == ~D[2010-04-17]
      assert pci_fup.pfup_assessment_dt == ~D[2010-04-17]
      assert pci_fup.pfup_survival_status == "some pfup_survival_status"
      assert pci_fup.pfup_angina_last_episode_dt == ~D[2010-04-17]
      assert pci_fup.pfup_beta_blocker_yn == true
      assert pci_fup.pfup_stent_thrombosis_timing == "some pfup_stent_thrombosis_timing"
      assert pci_fup.pfup_arb_yn == true
      assert pci_fup.pfup_infarction_notes == "some pfup_infarction_notes"
      assert pci_fup.pfup_readmission_dt == ~D[2010-04-17]
      assert pci_fup.pfup_angio_after_yn == true
      assert pci_fup.pfup_prior_stent_type == "some pfup_prior_stent_type"
      assert pci_fup.pfup_readmission_yn == true
      assert pci_fup.pfup_stent_thrombosis_dt == ~D[2010-04-17]
      assert pci_fup.pfup_complications_after_pci == true
      assert pci_fup.pfup_notes == "some pfup_notes"
      assert pci_fup.pfup_diuretics_yn == true
      assert pci_fup.pfup_reason == "some pfup_reason"
      assert pci_fup.pfup_clinical_improvement_yn == true
      assert pci_fup.pfup_xa_inhibitors == "some pfup_xa_inhibitors"
      assert pci_fup.pfup_angina_duration == "some pfup_angina_duration"
      assert pci_fup.pfup_old_infarction_location == "some pfup_old_infarction_location"
      assert pci_fup.pfup_stroke_dt == ~D[2010-04-17]
    end

    test "create_pci_fup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Followups.create_pci_fup(@invalid_attrs)
    end

    test "update_pci_fup/2 with valid data updates the pci_fup" do
      pci_fup = pci_fup_fixture()
      assert {:ok, %Pci_fup{} = pci_fup} = Followups.update_pci_fup(pci_fup, @update_attrs)
      assert pci_fup.pfup_cabg_after_yn == false
      assert pci_fup.pfup_aspirin_yn == false
      assert pci_fup.pfup_nyha == "some updated pfup_nyha"
      assert pci_fup.pfup_type == "some updated pfup_type"
      assert pci_fup.pfup_stent_thrombosis_yn == false
      assert pci_fup.pfup_thienopyridines == "some updated pfup_thienopyridines"
      assert pci_fup.pfup_stroke_yn == false
      assert pci_fup.pfup_angina_type == "some updated pfup_angina_type"
      assert pci_fup.pfup_anticoagulant_yn == false
      assert pci_fup.pfup_angina_total_num == "some updated pfup_angina_total_num"
      assert pci_fup.pfup_cabg_after_dt == ~D[2011-05-18]
      assert pci_fup.pfup_death_cause == "some updated pfup_death_cause"
      assert pci_fup.pfup_new_infarction_treatment == "some updated pfup_new_infarction_treatment"
      assert pci_fup.pfup_infarction_yn == false
      assert pci_fup.pfup_primary_fup_method == "some updated pfup_primary_fup_method"
      assert pci_fup.pfup_pci_location == []
      assert pci_fup.pfup_statin_yn == false
      assert pci_fup.pfup_other_intevention_notes == "some updated pfup_other_intevention_notes"
      assert pci_fup.pfup_antiplatelet_yn == false
      assert pci_fup.pfup_rehabilitation == "some updated pfup_rehabilitation"
      assert pci_fup.pfup_readmission_reason == "some updated pfup_readmission_reason"
      assert pci_fup.pfup_chest_pain == "some updated pfup_chest_pain"
      assert pci_fup.pfup_death_dt == ~D[2011-05-18]
      assert pci_fup.pfup_angina_class_canadian == "some updated pfup_angina_class_canadian"
      assert pci_fup.pfup_ace_yn == false
      assert pci_fup.pfup_pci_after_yn == false
      assert pci_fup.pfup_new_infarction_location == "some updated pfup_new_infarction_location"
      assert pci_fup.pfup_new_infarction_dt == ~D[2011-05-18]
      assert pci_fup.pfup_angio_after_dt == ~D[2011-05-18]
      assert pci_fup.pfup_cabage_notes == "some updated pfup_cabage_notes"
      assert pci_fup.pfup_angio_after_results == "some updated pfup_angio_after_results"
      assert pci_fup.pfup_no_statin_yn == false
      assert pci_fup.pfup_nitrates_yn == false
      assert pci_fup.pfup_thienopyridines_types == "some updated pfup_thienopyridines_types"
      assert pci_fup.pfup_other_intevention_yn == false
      assert pci_fup.pfup_pci_after_dt == ~D[2011-05-18]
      assert pci_fup.pfup_assessment_dt == ~D[2011-05-18]
      assert pci_fup.pfup_survival_status == "some updated pfup_survival_status"
      assert pci_fup.pfup_angina_last_episode_dt == ~D[2011-05-18]
      assert pci_fup.pfup_beta_blocker_yn == false
      assert pci_fup.pfup_stent_thrombosis_timing == "some updated pfup_stent_thrombosis_timing"
      assert pci_fup.pfup_arb_yn == false
      assert pci_fup.pfup_infarction_notes == "some updated pfup_infarction_notes"
      assert pci_fup.pfup_readmission_dt == ~D[2011-05-18]
      assert pci_fup.pfup_angio_after_yn == false
      assert pci_fup.pfup_prior_stent_type == "some updated pfup_prior_stent_type"
      assert pci_fup.pfup_readmission_yn == false
      assert pci_fup.pfup_stent_thrombosis_dt == ~D[2011-05-18]
      assert pci_fup.pfup_complications_after_pci == false
      assert pci_fup.pfup_notes == "some updated pfup_notes"
      assert pci_fup.pfup_diuretics_yn == false
      assert pci_fup.pfup_reason == "some updated pfup_reason"
      assert pci_fup.pfup_clinical_improvement_yn == false
      assert pci_fup.pfup_xa_inhibitors == "some updated pfup_xa_inhibitors"
      assert pci_fup.pfup_angina_duration == "some updated pfup_angina_duration"
      assert pci_fup.pfup_old_infarction_location == "some updated pfup_old_infarction_location"
      assert pci_fup.pfup_stroke_dt == ~D[2011-05-18]
    end

    test "update_pci_fup/2 with invalid data returns error changeset" do
      pci_fup = pci_fup_fixture()
      assert {:error, %Ecto.Changeset{}} = Followups.update_pci_fup(pci_fup, @invalid_attrs)
      assert pci_fup == Followups.get_pci_fup!(pci_fup.id)
    end

    test "delete_pci_fup/1 deletes the pci_fup" do
      pci_fup = pci_fup_fixture()
      assert {:ok, %Pci_fup{}} = Followups.delete_pci_fup(pci_fup)
      assert_raise Ecto.NoResultsError, fn -> Followups.get_pci_fup!(pci_fup.id) end
    end

    test "change_pci_fup/1 returns a pci_fup changeset" do
      pci_fup = pci_fup_fixture()
      assert %Ecto.Changeset{} = Followups.change_pci_fup(pci_fup)
    end
  end
end
