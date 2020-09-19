defmodule Angio.Canons.Report do
  # use Ecto.Schema
  # This is a naive implementation for learnig

  require IEx

  import Ecto.Query
  alias Angio.Canons.Definition, as: Definition
  alias Angio.Canons.Defs_option, as: Defs_option

  # import Pandex

  def make_angio_report_2(id, _language) do
    {:ok, response} =
      """
      query GetInfoCoronary($id: ID) {
      getInfoCoronary(id: $id){
        infoCorDate
        corLesions{
          corLesSegCdisc
        }
        cathGrafts{
          cathGraftSegmentsCdisc
        }

        corCollaterals{
          collatYn
        }
      lventricles{
      cathLvHeartRate
      }
        corAnatomies{
          corAnatDominance
        }




      }
      }

      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    # response_l = response[:data]["getInfoCoronary"]
    # response_l = response[:data]
    # IO.puts("-----response List--------------------")
    # IO.inspect(response_l)

    if response == nil or response == [] do
      nothing_found("Angio Data")
    else
      response
    end
  end

  ####################################
  def make_angio_report(id, language) do
    {:ok, response} =
      """

      query GetInfoCoronary($id: ID) {
        getInfoCoronary(id: $id){

          id,
          cor_les_count,
           icd10cm_code_1,
           icd10cm_code_2,
           icd10cm_code_3,
           icd10cm_code_4,
           info_cor_anomalies_yn,
           info_cor_arrival_dt,
           info_cor_arrival_tm,
           info_cor_cabg_prior_dt,
           info_cor_date,
           info_cor_diagnostic_status,
           info_cor_dis_ves_num,
           info_cor_end_tm,
           info_cor_grafts_dis_yn,
           info_cor_grafts_implanted_num,
           info_cor_grafts_patent_num,
           info_cor_grafts_yn,
           info_cor_main_reason,
           info_cor_normal_natives_yn,
           info_cor_notes,
           info_cor_prior_interv_yn,
           info_cor_rx_recommend,
           info_cor_start_tm,
           info_exam_num,
          patient_id,
          corLesions{
        cor_les_seg_cdisc,
        cor_les_pct,
        cor_les_major_branch,
        cor_les_seg_ncdr,
        cor_les_seg_sts,
        cor_les_vessel_size,
        cor_les_length,
        cor_les_prior_treated_yn,
        cor_les_prior_stent_yn,
        cor_les_prior_treated_dt,
        cor_les_prior_treated_other,
        cor_les_aneurysm_yn,
        cor_les_bifurcation_yn,
        cor_les_calcium_yn,
        cor_les_chronic_total_yn,
        cor_les_counter,
        cor_les_ffr,
        cor_les_graft_pct,
        cor_les_ivus,
        cor_les_ostial_loc_yn,
        cor_les_protected_yn,
        cor_les_stent_dt,
        cor_les_stent_pct,
        cor_les_tandem_yn,
        cor_les_thrombus_yn,
        cor_les_type_aha,
        cor_les_type_scai,
        patient_id,

      }
        cathGrafts{
          graft_prox_sten_prior_treated_dt,
          graft_ostial_sten_ivus,
          graft_prox_sten_ivus,
          graft_mid_sten_device_present_yn,
          graft_dist_sten_prior_treated_dt,
          graft_mid_sten_prior_treated_yn,
          cath_graft_conduit_type,
          graft_prox_sten_ffr,
          graft_dist_anast_sten_yn,
          graft_index,
          cath_graft_segments_sts,
          graft_total_occlusion_yn,
          graft_dist_sten_yn,
          graft_mid_sten_yn,
          graft_prox_sten_yn,
          graft_ostial_sten_ffr,
          graft_dist_sten_ivus,
          graft_morphology,
          graft_mid_sten_ffr,
          cath_graft_header,
          graft_dist_anast_sten_ffr,
          graft_dist_sten_ffr,
          graft_dist_anast_type,
          graft_ostial_prior_treated_dt,
          graft_dist_sten_prior_treated_yn,
          graft_dist_sten_device_present_yn,
          graft_ostial_prior_treated_yn,
          graft_mid_sten_prior_treated_dt,
          graft_prox_sten_device_present_yn,
          graft_ostial_sten_pct,
          cath_graft_prox_site,
          graft_dist_anast_prior_treated_yn,
          patient_id,
          graft_ostial_sten_yn,
          cath_graft_segments_ncdr,
          graft_dist_anast_device_present_yn,
          graft_sten_yn,
          cath_graft_segments_main_vessel,
          graft_ostial_device_present_yn,
          graft_dist_anast_sten_pct,
          graft_prox_sten_pct,
          graft_notes,
          graft_mid_sten_ivus,
          cath_graft_segments_cdisc,
          graft_prox_sten_prior_treated_yn,
          graft_dist_anast_sten_ivus,
          graft_dist_sten_pct,
          graft_mid_sten_pct,
          }
          clinicalExamsCardios{
            cle_dt,
            cle_tm,
            cle_normal_yn,
            cle_complain_yn,
            cle_complain_dysp,
            cle_complain_chest_pain_yn,
            cle_complain_palpitations_yn,
            cle_complain_cough_yn,
            cle_complain_notes,
            cle_temperature,
            cle_killip_class,
            cle_heart_sounds_abnormal_yn,
            cle_s1_heart_sound,
            cle_s2_heart_sound,
            cle_s3_heart_sound_yn,
            cle_s4_heart_sound_yn,
            cle_peri_rub_yn,
            cle_sounds_notes,
            cle_mv_abnormal_yn,
            cle_mv_sys_murmur_yn,
            cle_mv_sys_murmur_grade,
            cle_mv_dias_murmur_yn,
            cle_mv_dias_murmur_grade,
            cle_mv_opening_snap_yn,
            cle_mv_prosthetic_sound_yn,
            cle_mv_notes,
            cle_av_abnormal_yn,
            cle_av_sys_murmur_yn,
            cle_av_sys_murmur_grade,
            cle_av_dias_murmur_yn,
            cle_av_dias_murmur_grade,
            cle_av_ejection_click_yn,
            cle_av_prosthetic_sound_yn,
            cle_no_ejection_click_yn,
            cle_continuous_murmur,
            cle_murmur_notes,
            cle_pv_abnormal_yn,
            cle_pv_sys_murmur_yn,
            cle_pv_sys_murmur_grade,
            cle_pv_dias_murmur_yn,
            cle_pv_dias_murmur_grade,
            cle_pv_notes,
            cle_tr_abnormal_yn,
            cle_tr_sys_murmur_yn,
            cle_tr_dias_murmur_yn,
             cle_tr_notes


          }
         corCollaterals{
        collat_yn,
        collat_donor_seg,
        collat_recipient_seg,
        collat_via_seg,
        collat_rentrop_grade,
        collat_flow_idx_calc_yn,
        collat_flow_idx_method,
        collat_flow_idx_result,
        collat_qualitative_class,
        }
        cathClinicals{
      anesthitist_called_yn,
      anesthitist_at_start_yn,
      angina_class_within_2wk_yn,
      bag_mask_ventilation_yn,
      cabg_most_recent_dt,
      cad_presentation_type,
      cardio_shock_last_24hours_yn,
      cath_cl_arrest_hypothermia_dt,
      cath_cl_arrest_hypothermia_tm,
      cath_cl_arrest_hypothermia_yn,
      cath_cl_arrest_loc,
      cath_cl_arrest_pre_wit_yn,
      cath_cl_iabp_start_dt,
      cath_cl_symptom_onset_dt,
      chf_prior_2wk_yn,
      glasgow_coma_scale,
      iabp_start_tm,
      iabp_support_req_yn,
      intubated_before_cath_yn,
      lv_dysfunction_yn,
      mech_lv_support_other_dt,
      mech_lv_support_other_tm,
      mech_lv_support_other_yn,
      nyha_class_prior_2wk_cath_yn,
      nyha_prior_2wk_category,
      sedation_type,
      symptom_onset_tm,
      symptom_onset_tm_estim,
      symptom_onset_tm_na,
      ventilator_support_yn,
      arrest_cardiac_24h_yn,
      cath_cl_notes,
        }
        lventricles{
          cath_lv_ef_method,
          cath_lv_ef_val,
          cath_lv_heart_rate,
          cath_lv_lao_apical_septal,
          cath_lv_lao_basal_septal,
          cath_lv_lao_inf_lat,
          cath_lv_lao_post_lat,
          cath_lv_lao_super_lat,
          cath_lv_lv_pres_end_dias,
          cath_lv_lv_pres_sys,
          cath_lv_mvr,
          cath_lv_normal_yn,
          cath_lv_rao_antero_basal,
          cath_lv_rao_antero_lat,
          cath_lv_rao_apical,
          cath_lv_rao_diaphragmatic,
          cath_lv_rao_post_basal,
          cath_lv_wall_seg_func,
          aortic_pres_sys,
          aortic_pres_dia,
          cath_lv_notes,
        }
        cathEvents{
          cath_ev_shock_start_yn,
          cath_ev_expired_yn,
          cath_ev_shock_new_post_yn,
          cath_ev_tamponate_yn,
          cath_ev_stroke_prior_yn,
          cath_ev_chf_new_post_yn,
          cath_ev_bleed_gi_yn,
          cath_ev_av_fistula_yn,
          cath_ev_shock_cath_induced_yn,
          cath_ev_valve_injury_yn,
          cath_ev_blood_transfusion_yn,
          uni_currently_on_dialysis,
          cath_ev_vasc_compl_yn,
          cath_ev_for_cabg_indication,
          cath_ev_cor_art_thrombus_yn,
          cath_ev_cardiac_perforation_yn,
          cath_ev_death_at_proc_yn,
          cath_ev_event_yn,
          cath_event_notes,
          uni_dialysis_new_req_dt,
          cath_ev_vasc_pseudoaneurysm_yn,
          cath_ev_cor_art_dissection_yn,
          cath_ev_hb_prior_transfer,
          cath_ev_hematoma_treat,
          uni_dialysis_new_req_yn,
          cath_ev_bleed_yn,
          cath_ev_header,
          cath_ev_stroke_new_24h_yn,
          cath_ev_stroke_new_hemo_yn,
          cath_ev_cabg_dt,
          cath_ev_cor_art_perforation_yn,
          res_term_infarction_type,
          cath_ev_vasc_dissection_yn,
          cath_ev_bleed_gu_yn,
          cath_ev_heart_block_yn,
          cath_ev_hematoma_at_access_yn,
          cath_ev_bleed_dt,
          cath_ev_vasc_limb_ischemia_yn,
          cath_ev_bleed_retroperi_yn,
          cath_ev_cardioversion_yn,
          cath_ev_bleed_tm,
          cath_ev_infarction_yn,
          cath_ev_for_cabg_status,
          cath_ev_cabg_location,
          cath_ev_hematoma_size,
          cath_ev_cor_vein_dissection_yn,
          cath_ev_cabg_tm,
          cath_ev_bleed_other_yn,
          cath_ev_prior_mi_yn,
          cath_ev_bleed_access_yn,
          cath_ev_stroke_new_yn,
          uni_cardiac_perforation_site,
        }
        infectHistories{
          infh_endocarditis_yn,
          infh_endocarditis_type,
          infh_hepatitis_b_yn,
          infh_hepatitis_c_yn,
          infh_hiv_yn,
          infh_malaria_yn,
          infh_tubercolosis_yn,
          infh_pneumonia_yn,
          infh_influenza_vacc_dt,
          infh_pneumococcal_vacc_dt,
          infh_influenza_vacc_yn,
          infh_pneumococcal_vacc_yn,
          infh_histories_notes,
        }
        cathMeds{
          cmed_atropine_yn,
          cmed_antiarrhythmics_yn,
          cmed_ca_channel_pre_yn,
          cmed_gp_iib_iiia_yn,
          cmed_ranolazine_yn,
      cmed_inotrops_yn,
      cmed_bblocker_yn,
      cmed_statin_yn,
      cmed_lmwh_yn,
      cmed_pde_inhibitor_yn,
      cmed_direct_thrombin,
      cmed_anticoagulants_yn,
      cmed_anti_anginal_other_yn,
      cmed_ufh_dose,
      cmed_lytics_bolus_tm,
      cmed_no_statin_agent_yn,
      cmed_ufh_yn,
      cmed_thienopyridines,
      cmed_anti_anginal_yn,
      cmed_nitrates_long_act_yn,
      cmed_vaso_dilators_yn,
      cmed_lytics_bolus_dt,
      cmed_antiplatelets_yn,
      cmed_notes,
      cmed_arb_yn,
      cmed_xa_inhibitors,
      cmed_ace_yn,
      cmed_antihypertensives_yn,
      cmed_lytics_yn,
      cmed_aspirin_yn,
      cmed_medications_other_yn,
      cmed_prostaglandins_yn,
      cmed_diuretics_yn,

        }
        cathRadiations{
          car_fluoro_time,
          car_dose_area_product,
          car_area_product_units,
          car_dose_area_meas_method,
          car_comulative_kerma,
        }
        procEpisodes{
      proc_epis_request_dt,
      proc_epis_request_tm,
      proc_epis_cor_machine,
      proc_epis_cor_machine_loc,
      proc_epis_cor_machine_id,
      proc_epis_refer_person,
      proc_epis_prim_operetor_fname,
      proc_epis_prim_operator_lname,
      proc_epis_prim_operator_mname,
      proc_epis_prim_operator_npi,
      proc_epis_art_access_r_femoral,
      proc_epis_art_access_l_femoral,
      proc_epis_art_access_r_brachial,
      proc_epis_art_access_l_brachial,
      caepsds_art_access_r_radial,
      proc_epis_art_access_l_radial,
      proc_epis_closure_device,
      proc_epis_icd10_pcs_1,
      proc_epis_icd10_pcs_2,
      proc_epis_icd10_pcs_3,
      proc_epis_icd10_pcs_4,
      proc_epis_contrast_volume,
      proc_epis_contrast_name,
      proc_epis_catheter_l_name,
      proc_epis_catheter_l_size,
      proc_epis_catheter_r_name,
      proc_epis_catheter_r_size,
      proc_epis_catheter_lv_name,
      proc_epis_catheter_lv_size,
      proc_epis_notes
        }
        chdConditions{
          chd_heterotaxy_yn,
          chd_rubella_prior_yn,
          chd_syndrome_noonan_yn,
          chd_syndrome_marfan_yn,
          chd_syndrome_turner_yn,
          chd_syndrome_alagille_yn,
          chd_syndrome_digeorge_yn,
          chd_syndrome_down_yn,
          chd_trisomy_13_yn,
          chd_trisomy_18_yn,
          chd_syndrome_williams_yn,
          chd_diaphragm_hernia_yn,
          chd_conditions_notes

        }
        chdRiskFactors{
          chd_cardiomyopathy_yn,
          chd_cardiomyopathy_history,
          chd_chronic_lung_disease_yn,
          chd_coagulation_disorder_yn,
          chd_hyper_coagulable_state_yn,
          chd_hypo_coagulable_state_yn,
          chd_diabetes_yn,
          chd_endocarditis_yn,
          chd_hf_1_month_yn,
          chd_nyha,
          chd_heart_transplant_yn,
          chd_hepatic_disease_yn,
          chd_ischemic_heart_disease_yn,
          chd_kawasaki_yn,
          chd_renal_insufficiency_yn,
          chd_rheumatic_heart_disease_yn,
          chd_seizure_disorder_yn,
          chd_sickle_cell_anemia_yn,
          chd_stroke_prior_yn,
          chd_arrhythmia_history,
          chd_risk_factors_notes

        }
       asdClosures{
         asdcl_aortic_rim_length,
      asdcl_asd_size,
      asdcl_atria_septal_aneurysm_yn
      asdcl_bal_sizing_perfomed_yn,
      asdcl_defect_counter_assoc,
      asdcl_defect_not_treated,
      asdcl_device_used_outcome,
      asdcl_device_utilized_id,
      asdcl_device_utilized_name,
      asdcl_ivc_rim_length,
      asdcl_multi_fenestrated_yn,
      asdcl_notes,
      asdcl_operator_fname,
      asdcl_operator_lname
      asdcl_operator_mname,
      asdcl_operator_npi,
      asdcl_primary_indication,
      asdcl_residual_shunt_size,
      asdcl_rim_meas_performed_yn,
      asdcl_stop_flow_performed_yn,
      asdcl_stretch_diam_perform_yn,
      asdcl_stretched_diam_size,
      asdcl_total_septal_length,
      asdcl_treat_attempted_yn
       },
       electrocardiograms{
        ecg_dt,
       ecg_tm,
      ecg_first_tm,
      ecg_normal_yn,
      ecg_with_symptoms_yn,
      ecg_with_symptoms_yn,
      ecg_heart_rate,
      ecg_rhythm,
      ecg_p_duration_val,
      ecg_pr_interval_val,
      ecg_qrs_duration_val,
      ecg_qtc_long_yn,
      ecg_st_depression_yn,
      ecg_st_elevation_yn,
      ecg_st_with_symptoms,
      ecg_inverted_t_waves_yn,
      ecg_t_with_symptoms,
      ecg_pathological_q_yn,
      ecg_infarct_pattern_yn,
      ecg_infarct_pattern_location,
      ecg_lv_hypertrophy,
      ecg_rv_hypertrophy_yn,
      ecg_av_conduction,
      ecg_lbbb,
      ecg_rbbb_yn,
      ecg_epsilon_wave_yn,
      ecg_notes
       },
       corAnatomies{
        cor_anat_dominance,
        cor_anat_anomalies_yn,
        cor_anat_conus_type,
        cor_anat_lad_d1_type,
        cor_anat_lad_d2_type,
        cor_anat_lad_d3_type,
        cor_anat_lad_distal_type,
        cor_anat_lad_mid_type,
        cor_anat_lad_ostium_type,
        cor_anat_lad_prox_type,
        cor_anat_lcx_distal_type,
        cor_anat_lcx_mid_type,
        cor_anat_lcx_om1_type,
        cor_anat_lcx_om2_type,
        cor_anat_lcx_om3_type,
        cor_anat_lcx_ostium_type,
        cor_anat_lcx_prox_type,
        cor_anat_lcx_type,
        cor_anat_lm_ostium_type,
        cor_anat_lm_type,
        cor_anat_notes,
        cor_anat_pl_type,
        cor_anat_ramus_type,
        cor_anat_rca_distal_type,
        cor_anat_rca_mid_type,
        cor_anat_rca_ostium_type,
        cor_anat_rca_pda_type,
        cor_anat_rca_rv_branch_type,
        cor_anat_rca_type,
        cor_anat_septal_ostium_type,
        cor_anat_sino_atrial_type,
        cor_anat_variations_yn,
        }
       functionalStates{
        funs_basic_adl,
        funs_cognition_level,
        funs_frailty_scale_csha,
        funs_katz_index,
        funs_kccq12_score,
        funs_notes,
        funs_status_assess_dt,
        funs_stroke_rankin_dt,
        funs_stroke_rankin_modified,
        funs_walking_level,

        }

        }
        }
      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    if response == nil do
      nothing_found("Angio Data")
    else
      response
    end
  end

  def get_all_definition(id, language) do
    {:ok, response} =
      """
      query GetDefinition($id: ID) {
        getDefinition(id: $id){
          id
          name
           defsSentences{
            definitionId
                 sentence
                 language
               }
          defsCodes{
            code
            codeSystem

          }
          defsSentences{
            language
            sentence
          }
          defsOptions{
            code
            selectionText

          optsSentences{
            language
            sentence
          }

          optsCodes{
            code
            code_system
            defs_option_id
           }

        }


       }
      }

      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    field = response[:data]["getDefinition"]
  end

  ##########################

  ###############################
  ## Fix the booleans
  def make_patient_report(id, language) do
    # response =
    {:ok, response} =
      """
         query GetPatientReport($id: ID) {
         getPatientReport(id: $id){
          patnts_language_preferred,
          patnts_ssn_na,
          patnts_ssn,
          patnts_race,
          patnts_gender,
          patnts_birth_dt,
          patnts_middle_name,
          patnts_first_name,
          patnts_father_name,
          patnts_last_name,
          patnts_ethnicity_hispanic,



       }
      }
      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    result = response[:data]["getPatientReport"]
    result = format_info(result, language)
  end

  ########################

  def make_ext_report(id, language) do
    {:ok, response} =
      """
         query GetPatientReport($id: ID) {
         getPatientReport(id: $id){
           patntsSsn
           patntsLastName
           treadmillExercises{
             ext_medications_yn
             ext_stopping_reason_notes
             ext_stop_reason_other_yn
             ext_angina_severe_post_yn
             ext_cardio_shock_post_yn
             ext_cpx_vo2_ventilatory_response
             ext_lab_num
             ext_heart_rate_at_max_st_depres
             ext_referral_person
             ext_st_depres_recovery_location
             ext_cpr_post_yn
             ext_compl_other_yn
             ext_heart_rate_max_predicted
             ext_vt_post_yn
             ext_indication_notes
             ext_afib_pre_yn
             ext_st_depres_max
             ext_stages_completed
             ext_anginal_meds_yn
             ext_technician_lname
             ext_t_wave_inversion_pre_yn
             ext_qrs_morphology_pre
             ext_bradycardia_post_yn
             ext_lab_yr
             ext_main_problem_notes
             ext_bp_diast_max
             ext_ecg_normal_pre_yn
             ext_heart_rate_achieved
             ext_mets
             ext_limitations
             ext_bp_diast_recovery
             ext_pvc_pre_yn
             ext_duke_score
             ext_mi_post_yn
             ext_doctor_fname
             ext_need_hold_handrails_yn
             ext_st_slop_max
             ext_main_problem_pulm_yn
             ext_recommendations
             ext_st_depres_pre_val
             ext_qwaves_pre
             ext_cad_pretest_probability
             ext_complication_yn
             ext_on_digoxin_yn
             ext_mortality_cad_risk
             ext_cpx_age_vo2
             ext_heart_rate_rest
             ext_bp_sys_rest
             ext_st_depres_max_duration
             ext_compl_notes
             ext_athens_score
             ext_on_bblockers_yn
             ext_main_problem_medical_yn
             ext_aerobic_capacity_max
             ext_cpx_ve_vco2_slope
             ext_borg_scale
             ext_compl_afib_post_yn
             ext_dt
             ext_lab_id
             ext_stop_reason_angina_yn
             ext_bp_diast_rest
             ext_st_depres_recovery_val
             ext_not_done_reason
             ext_st_elevation_max
             ext_lv_hypertrophy_pre_yn
             ext_limitations_relative
             ext_cpx_peak_mets
             ext_main_problem_cardiac_yn
             ext_bp_sys_recovery
             ext_technician_fname
             ext_result_notes
             ext_indication
             ext_is_done_yn
             ext_notes
             ext_cpx_peak_vo2
             ext_doctor_lname
             ext_va_treadmill_score
             ext_watts
             ext_bp_sys_max
             ext_tm
             ext_consent_yn
             ext_st_depres_max_location
             ext_result
             ext_stop_reason
             ext_st_depres_pre_yn
             ext_protocole_used

         }
         }
       }

      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    list = response[:data]["getPatientReport"]["treadmillExercises"]

    if list !== nil do
      manage_elements(list, language)
    else
      nothing_found("Functional States")
    end
  end

  def make_lab_admissions(id, language) do
    {:ok, response} =
      """
      query GetInfoCoronary($id: ID) {
        getInfoCoronary(id: $id){

          cor_les_count,
           icd10cm_code_1,
           icd10cm_code_2,
           icd10cm_code_3,
           icd10cm_code_4,
           info_cor_anomalies_yn,
           info_cor_arrival_dt,
           info_cor_arrival_tm,
           info_cor_cabg_prior_dt,
           info_cor_date,
           info_cor_diagnostic_status,
           info_cor_dis_ves_num,
           info_cor_end_tm,
           info_cor_grafts_dis_yn,
           info_cor_grafts_implanted_num,
           info_cor_grafts_patent_num,
           info_cor_grafts_yn,
           info_cor_main_reason,
           info_cor_normal_natives_yn,
           info_cor_notes,
           info_cor_prior_interv_yn,
           info_cor_rx_recommend,
           info_cor_start_tm,
           info_exam_num,

        }
      }
      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    list = response[:data]["getInfoCoronary"]

    if list !== nil do
      manage_elements([list], language)
    else
      nothing_found("Lab Admissions")
    end
  end

  #####################

  def make_partial_report(id, language, partial) do
    response = make_angio_report(id, language)

    partial_list = response[:data]["getInfoCoronary"][partial]

    if partial_list !== nil do
      manage_elements(partial_list, language)
    else
      nothing_found(:title)
    end
  end

  #####################

  def make_proc_episodes(id, language) do
    response = make_angio_report(id, language)

    episode_list = response[:data]["getInfoCoronary"]["procEpisodes"]

    if episode_list !== nil do
      manage_elements(episode_list, language)
    else
      nothing_found("Procedure Episode")
    end
  end

  #####################
  def make_functional_states(id, language) do
    response = make_angio_report(id, language)

    states_list = response[:data]["getInfoCoronary"]["functionalStates"]

    if states_list !== nil do
      manage_elements(states_list, language)
    else
      nothing_found("Functional States")
    end
  end

  ########################################
  def make_chd_conditions(id, language) do
    response = make_angio_report(id, language)

    chd_conditions_list = response[:data]["getInfoCoronary"]["chdConditions"]

    if chd_conditions_list !== nil do
      manage_elements(chd_conditions_list, language)
    else
      nothing_found("Congenital Conditions")
    end
  end

  ##############################

  def make_cle_cardio(id, language) do
    response = make_angio_report(id, language)

    cle_cardio_list = response[:data]["getInfoCoronary"]["clinicalExamsCardios"]

    if cle_cardio_list !== nil do
      manage_elements(cle_cardio_list, language)
    else
      nothing_found("On Cardiac Clinical Examination")
    end
  end

  def make_infect_history(id, language) do
    response = make_angio_report(id, language)

    infect_list = response[:data]["getInfoCoronary"]["infectHistories"]

    if infect_list !== nil do
      manage_elements(infect_list, language)
    else
      nothing_found("Infections History")
    end
  end

  def make_chd_risk_factors(id, language) do
    response = make_angio_report(id, language)

    episode_list = response[:data]["getInfoCoronary"]["chdRiskFactors"]

    if episode_list !== nil do
      manage_elements(episode_list, language)
    else
      nothing_found("Congenital Risk Factors")
    end
  end

  ###############################
  @spec make_medications(any, any) :: none
  def make_medications(id, language) do
    response = make_angio_report(id, language)

    med_list = response[:data]["getInfoCoronary"]["cathMeds"]

    if med_list !== nil do
      manage_elements(med_list, language)
    else
      nothing_found("Medications")
    end
  end

  ##############################
  def make_radiations(id, language) do
    response = make_angio_report(id, language)

    rad_list = response[:data]["getInfoCoronary"]["cathRadiations"]

    if rad_list !== nil do
      manage_elements(rad_list, language)
    else
      nothing_found("Radiations")
    end
  end

  ##############################
  def make_clinical(id, language) do
    response = make_angio_report(id, language)

    clinical_list = response[:data]["getInfoCoronary"]["cathClinicals"]

    if clinical_list !== nil do
      manage_elements(clinical_list, language)
    else
      nothing_found("Clinical Data")
    end
  end

  ########################
  def make_cath_events(id, language) do
    response = make_angio_report(id, language)

    event_list = response[:data]["getInfoCoronary"]["cathEvents"]

    if event_list !== nil do
      manage_elements(event_list, language)
    else
      nothing_found("Cath Events")
    end
  end

  ############################
  #########################
  def make_lventricles(id, language) do
    response = make_angio_report(id, language)

    lv_list = response[:data]["getInfoCoronary"]["lventricles"]

    if lv_list !== nil do
      manage_elements(lv_list, language)
    else
      nothing_found("Left Ventricle")
    end
  end

  ############################
  def make_collaterals(id, language) do
    response = make_angio_report(id, language)

    collaterals_list = response[:data]["getInfoCoronary"]["corCollaterals"]

    if collaterals_list !== nil do
      manage_elements(collaterals_list, language)
    else
      nothing_found("Collaterals")
    end
  end

  ###############################

  ######################
  def make_lesions(id, language) do
    response = make_angio_report(id, language)

    lesions_list = response[:data]["getInfoCoronary"]["corLesions"]

    if lesions_list !== nil do
      manage_elements(lesions_list, language)
    else
      nothing_found("lesions")
    end
  end

  ###################
  def make_grafts(id, language) do
    response = make_angio_report(id, language)

    grafts_list = response[:data]["getInfoCoronary"]["cathGrafts"]

    if grafts_list !== nil do
      manage_elements(grafts_list, language)
    else
      nothing_found(" Grafts")
    end
  end

  ###################
  def make_electrocardiograms(info_coronary_id, language) do
    response = make_angio_report(info_coronary_id, language)

    ecg_list = response[:data]["getInfoCoronary"]["electrocardiograms"]

    if ecg_list !== nil do
      manage_elements(ecg_list, language)
    else
      nothing_found(" ECG ")
    end
  end

  @spec manage_elements(any, any) :: :ok
  def manage_elements(elements, language) do
    for element <- elements do
      data = format_info(element, language)
      make_page(data)
    end
  end

  #############################
  def make_asd_closures(id, language) do
    response = make_angio_report(id, language)

    closures_list = response[:data]["getInfoCoronary"]["asdClosures"]

    if closures_list !== nil do
      manage_elements(closures_list, language)
    else
      nothing_found("ASD Closures")
    end
  end

  ###############################
  def show_separator() do
    # separator = "<p /> <span class='fa fa-check '; style='color:#fff; height:20px;'> </span>"

    _separator = " <p /> <hr class= 'hr'> <p />"
  end

  ###########################

  def format_info(result, language) do
    {:ok, res_agent} = Agent.start_link(fn -> [] end)

    Enum.each(result, fn {field_name, value} ->
      allow_value = allow_value(value)
      # IO.puts("----field name---value -----------------------")
      # IO.inspect(field_name)
      IO.inspect(value)
      # allow_value = allow_value_2.(value)
      if allow_value !== nil do
        a_value = check_type(allow_value)

        output_l = transform_narrative(field_name, a_value, language)

        # convert(output_l)

        Agent.update(res_agent, fn res ->
          res ++ [output_l]
        end)

        ############### update angent
      end
    end)

    results = Agent.get(res_agent, fn res -> res end)
    Agent.stop(res_agent)

    for result <- results do
      _data = layout_element(result)
    end
  end

  #################################
  def make_page(data) do
    {:ok, page_agent} = Agent.start_link(fn -> [] end)

    Agent.update(page_agent, fn res ->
      res ++ data
    end)

    results = Agent.get(page_agent, fn res -> res end)

    Agent.stop(page_agent)
    separator = show_separator()

    _data = [separator] ++ results
  end

  ###############################

  def make_template_2(data) do
    # Enum.each(data, fn d ->
    # _d_data = Mustache.render("Hello {{field_name}}, my name is {{sentence}}", d)
    #
    #  end)

    # data_1 = %{subject: "world", name: "John"}
    # name = Mustache.render("Hello {{subject}}, my name is {{name}}", data_1)
    # name = Mustache.render("Hello {{field_name}}, my name is {{sentence}}", data)
    # actual = Mustache.render(template, data)
  end

  #####################
  def layout_element(results) do
    field_name = results[:field_name]
    sentence = results[:sentence]
    value = results[:value]

    # f_name = Mustache.render("{{f_name}}", %{field_name: field_name})
    # m_name = Mustache.render("{{sentence}}", %{sentence: sentence})
    # v_name = Mustache.render("{{value}}}", %{value: value})

    # data = %{pagetitle: "User details", content: "<strong>Foo</strong>",
    # user: %{
    #  name: "Alice",
    #  email: "alice@example.org"
    # }}
    # template = """

    field_format =
      "<span style='color:#fff'>" <>
        " ( " <>
        field_name <>
        "</span>" <>
        " ) " <>
        " "

    say =
      sentence <>
        "  " <>
        "<b><em style='font-size:17px'>" <>
        value <>
        "</b></em>" <>
        ". \t \t  " <>
        "<br \>"

    # say = %{field_name: field_name, sentence: sentence, value: value}
  end

  allow_value_2 = fn value ->
    cond do
      value == nil ->
        nil

      value == true ->
        value

      value == false ->
        nil

      is_list(value) ->
        List.first(value)

      value ->
        value
    end
  end

  ###################################
  def allow_value(value) do
    cond do
      value == nil ->
        nil

      value == true ->
        value

      value == false ->
        nil

      is_list(value) ->
        List.first(value)

      value ->
        value
    end
  end

  #########################
  def check_type(value) do
    cond do
      is_list(value) ->
        _a_value = List.first(value)

      is_boolean(value) ->
        _a_value = boolean_to_string(value)

      is_binary(value) ->
        _a_value = value

      "" ->
        ""
    end
  end

  ######################
  def transform_narrative(field_name, value, language) do
    definition_id = get_definition_id(field_name)

    defs_sentence = get_defs_sentence(definition_id, language)
    defs_codes = get_defs_codes(definition_id, language)

    option_id = get_defs_option_id(value, field_name)
    opts_sentence = get_opts_sentence(option_id, language)

    # $opts_codes = get_opts_codes(definition_id, language, option_id)
    # opts_codes = Angio.Canons.get_opts_codes(option_id)

    defs_options_selection_text = get_defs_options_selection_text(definition_id, value, language)

    a_value =
      cond do
        opts_sentence !== nil ->
          opts_sentence

        opts_sentence == nil && defs_options_selection_text !== nil ->
          " " <> defs_options_selection_text

        value == "Yes" ->
          ""

        true ->
          value
      end

    sentence =
      cond do
        defs_sentence !== nil ->
          defs_sentence <>
            " " <>
            defs_codes <>
            " "

        true ->
          "<span style='color:#33FF33;'> Check Field:  " <> field_name <> " </span> "
      end

    #####################
    sentence_str = "#{sentence}"

    a_sentence =
      sentence_str
      |> String.replace("<p>", " \t ")
      |> String.replace("</p>", " \t ")

    _struct = [{:field_name, field_name}, {:sentence, a_sentence}, {:value, a_value}]

    #########################
  end

  ###############################
  def nothing_found(message) do
    "<h3 class= 'title is-4'> Nothing found in:  " <> message <> "<h4>"
  end

  #################################

  @spec get_opts_sentence(any, any) :: none

  ##################################
  def get_defs_option_id(code, field_name) do
    query =
      from(
        d in Defs_option,
        # where: d.name == ^field_name and d.code == type(^code, ,
        where: d.name == ^field_name and d.code == ^code,
        select: d.id
      )

    _res = Angio.Repo.one(query)
  end

  ###############################
  def get_option_text(code, name) do
    query =
      from(
        d in Defs_option,
        # where: d.name == ^name and d.code == type(^code, ,
        where: d.name == ^name and d.code == ^code,
        select: d.selection_text
      )

    res = Angio.Repo.one(query)

    if(res !== nil) do
      res
    else
      code
    end
  end

  # end make_patient_report
  ##################

  def get_definition_id(field_name) do
    query =
      from(
        d in Definition,
        where: d.name == ^field_name,
        select: d.id
      )

    _definition_id = Angio.Repo.one(query)
  end

  ########################

  #####################
  def get_defs_sentence(definition_id, language) do
    {:ok, response} =
      """
         query GetSentence($definition_id: ID, $language: String!) {
         getSentence(definition_id: $definition_id, language: $language){
         sentence
       }
      }
      """
      |> Absinthe.run(AngioWeb.Schema,
        variables: %{"definition_id" => definition_id, "language" => language}
      )

    _results = response[:data]["getSentence"]["sentence"]
  end

  #######################
  def get_opts_sentence(defs_option_id, language) do
    response =
      """
         query GetReportOptsSentence($defs_option_id: ID, $language: String!) {
          getReportOptsSentence(defs_option_id: $defs_option_id, language: $language){
          language
         sentence
       }
      }
      """
      |> Absinthe.run(AngioWeb.Schema,
        variables: %{"defs_option_id" => defs_option_id, "language" => language}
      )

    case response do
      {:ok, response} ->
        opts_language = response[:data]["getReportOptsSentence"]["language"]

        if opts_language == language do
          _opts_sentence = response[:data]["getReportOptsSentence"]["sentence"]
        end
    end

    #################
  end

  def get_opts_codes(definition_id, language, option_id) do
    response = get_all_definition(definition_id, language)
    defs_options = response["defsOptions"]

    opts_codes =
      Enum.map(defs_options, fn x ->
        codes = Map.get(x, "optsCodes")

        Enum.map(codes, fn a_code ->
          if a_code["defs_option_id"] == option_id do
            a_code
          else
            ""
          end
        end)
      end)

    ##########################################

    tmp_codes = Angio.Canons.get_opts_codes(option_id)

    ###############################################
  end

  ## function

  ###############################
  def get_defs_options_selection_text(definition_id, code, language) do
    response = get_all_definition(definition_id, language)
    defs_options = response["defsOptions"]

    if defs_options !== nil do
      selection_list =
        Enum.filter(defs_options, fn x ->
          x["code"] == code
        end)

      sel = get_in(selection_list, [Access.all(), "selectionText"])
      _selection_text = List.first(sel)
    else
      ""
    end
  end

  ###################################
  def get_defs_codes(definition_id, language) do
    response = get_all_definition(definition_id, language)

    all_defs_codes = response["defsCodes"]

    if all_defs_codes !== nil do
      defs_codes_table =
        Enum.map(all_defs_codes, fn x ->
          code = x["code"]
          code_system = x["codeSystem"]

          "<span style= 'font-size: 14px; color:#abdda4'  >" <>
            "  " <>
            "<span>" <>
            "[ " <>
            code_system <>
            "</span>" <>
            " " <>
            "<span>" <>
            code <>
            "</span>" <>
            "  " <>
            " ] " <>
            "</span>"
        end)

      List.to_string(defs_codes_table)
    else
      ""
    end

    ## if != nil
  end

  ################################

  @spec get_defs_options_selection_text(any, any, any) :: none

  ######################################

  ############################################
  @doc """
  formats output
  Tables
   definitions (fields) = cah_angina_class
  defs_sentences = English: Angina Class - Greek: Κατηγορία Στηθάγχης
  defs_codes = SNOMED-CT 194828000 for cah_angina_class

  defs_options (Pick-List) = Code 1,2,3,4 selection_text = Class I, II ..

  opts_sentences: English: Class I - GR: Κατηγορία Ι (for angina class I)
  opts_codes for Class I = SNOMED-CT = 61490001

  """

  ############################
  defp boolean_to_string(bool) do
    if is_boolean(bool) do
      if bool, do: "Yes", else: "No"
    else
      bool
    end
  end

  #########################

  #################################
  defp do_flatten([], acc), do: acc

  defp do_flatten([{_k, v} | rest], acc) when is_map(v) do
    v = Map.to_list(v)
    flattened_subtree = do_flatten(v, acc)
    do_flatten(flattened_subtree ++ rest, acc)
  end

  defp do_flatten([kv | rest], acc) do
    do_flatten(rest, [kv | acc])
  end

  ############################

  def convert(res) do
    # [
    #  field_name: "cor_les_seg_cdisc",
    #  sentence: "Coronary Segment (CDISC)",
    #  value: "lad_d1"
    # ]
    field = res[:field_name]
    sentence = res[:sentence]
    a_res = field <> sentence

    input1 = """
    $if(field)$
     $sentence$
     $endif$
    """

    input2 = """
    $if(info_cor_date)$
    <h3 class="date">$date$</h3>
    $endif$
    """

    # {:ok, output_html} = Pandex.markdown_to_html(a_res)
    # IO.puts("=========convert=================")
    # IO.inspect(output_html)
    # IO.inspect(res)
    # IO.inspect(field)
  end

  ## end module###############
end
