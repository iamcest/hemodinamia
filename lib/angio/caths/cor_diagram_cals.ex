defmodule Angio.Caths.Cor_diagram_calcs do
  use Ecto.Schema
  # import Ecto.Query
  # alias Angio.Persons.Patient
  # alias Angio.Caths.Cath_procedure
  # alias Angio.Caths.Info_coronary
  def get_info_coronary_data(_patient_id, id) do
    response =
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
        id,
        cor_les_pct,
        cor_les_major_branch,
         cor_les_seg_ncdr,
        cor_les_seg_cdisc ,
        cor_les_seg_sts ,
        cor_les_vessel_size,
        cor_les_type_scai ,
        cor_les_type_aha,
        cor_les_length ,
        cor_les_chronic_total_yn,
        cor_les_calcium_yn,
        cor_les_thrombus_yn,
        cor_les_bifurcation_yn,
        cor_les_tandem_yn,
        cor_les_aneurysm_yn,
        cor_les_protected_yn ,
        cor_les_graft_pct,
        cor_les_prior_treated_yn,
        cor_les_prior_treated_dt,
        cor_les_prior_stent_yn,
        cor_les_stent_dt ,
        cor_les_stent_pct,
        cor_les_ffr,
        cor_les_ivus ,
        cor_les_counter,
        patient_id,
      info_coronary_id ,
        cor_les_ostial_loc_yn,
      cor_les_prior_treated_other




      }
      cathGrafts{
        id
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
        info_coronary_id,
        }
       corCollaterals{
      id,
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

      corAnatomies{
        id,
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
      cor_anat_variations_yn



      }

      }
      }
      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    # |> Absinthe.run(AngioWeb.Schema, variables: %{"patient_id" => patient_id, "id" => id})
    response_map = elem(response, 1)
    # IO.puts("jgour1111---------------------")
    # IO.inspect(response_map)
    data = response_map |> Map.get(:data)
    # IO.puts("jgour---------------------")
    # IO.inspect(data)
    report = data |> Map.fetch("getInfoCoronary")

    result = elem(report, 1)
  end

  def get_info_coronary_data_2(_patient_id, id) do
    response =
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
      id,
      cor_les_aneurysm_yn,
      cor_les_bifurcation_yn,
      cor_les_calcium_yn,
      cor_les_chronic_total_yn,
      cor_les_counter,
      cor_les_ffr,
      cor_les_graft_pct,
      cor_les_ivus,
      cor_les_length,
      cor_les_major_branch,
      cor_les_ostial_loc_yn,
      cor_les_pct,
      cor_les_prior_stent_yn,
      cor_les_prior_treated_dt,
      cor_les_prior_treated_other,
      cor_les_prior_treated_yn,
      cor_les_protected_yn,
      cor_les_seg_cdisc,
      cor_les_seg_ncdr,
      cor_les_seg_sts,
      cor_les_stent_dt,
      cor_les_stent_pct,
      cor_les_tandem_yn,
      cor_les_thrombus_yn,
      cor_les_type_aha,
      cor_les_type_scai,
      cor_les_vessel_size,
      info_coronary_id,
      patient_id,
      }
      cathGrafts{
        id
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
        info_coronary_id,
        }
       corCollaterals{
      id,
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

      corAnatomies{
        id,
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

      }
      }
      """
      |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => id})

    # |> Absinthe.run(AngioWeb.Schema, variables: %{"patient_id" => patient_id, "id" => id})
    response_map = elem(response, 1)
    # IO.puts("jgour1111---------------------")
    # IO.inspect(response_map)
    data = response_map |> Map.get(:data)
    # IO.puts("jgour---------------------")
    # IO.inspect(data)
    report = data |> Map.fetch("getInfoCoronary")

    result = elem(report, 1)
  end
end
