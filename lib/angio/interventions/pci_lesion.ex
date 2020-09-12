defmodule Angio.Interventions.Pci_lesion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pci_lesions" do
    field(:pci_les_bifurcation_yn, :boolean, default: false)
    field(:pci_les_stent_2_code, :string)
    field(:pci_les_stent_2_diam, :string)
    field(:pci_les_involved_seg_sts, {:array, :string})
    field(:pci_les_involved_seg_cdisc, {:array, :string})
    field(:pci_les_guide_size, :string)
    field(:pci_les_success_yn, :boolean, default: false)
    field(:pci_lesev_re_interven_yn, :boolean, default: false)
    field(:pci_les_prior_treat_stent_yn, :boolean, default: false)
    field(:pci_lesev_hosp_stent_thrombosis_category, :string)
    field(:pci_les_no_reflow_type, :string)
    field(:pci_les_after_graft_type, :string)
    field(:pci_les_balloon_size_pre, :string)
    field(:pci_les_graft_prox_site, :string)
    field(:pci_les_prior_stent_thromb_yn, :boolean, default: false)
    field(:pci_les_stent_length_total, :string)
    field(:pci_les_balloon_size_post, :string)
    field(:pci_les_stent_1_diam, :string)
    field(:pci_les_prior_treated_yn, :boolean, default: false)
    field(:pci_les_bifurc_sb_treat_yn, :boolean, default: false)
    field(:pci_les_direct_stenting_yn, :boolean, default: false)
    field(:pci_les_timi_flow_pre, :string)
    field(:pci_les_no_reflow_treat, :string)
    field(:pci_les_main_technique, :string)
    field(:pci_les_cto_yn, :boolean, default: false)
    field(:pci_les_stent_4_diam, :string)
    field(:pci_les_sten_pct_pre, :string)
    field(:pci_les_stent_4_code, :string)
    field(:pci_lesev_dissection_yn, :boolean, default: false)
    field(:pci_les_status_isr_class, :string)
    field(:pci_lesev_acute_clossure_treat, :string)
    field(:pci_les_des_type, :string)
    field(:pci_lesev_perforation_yn, :boolean, default: false)
    field(:pci_les_involved_seg_ncdr, {:array, :string})
    field(:pci_les_culprit_yn, :boolean, default: false)
    field(:pci_les_stent_2_len, :string)
    field(:pci_les_event_yn, :boolean, default: false)
    field(:pci_les_aha_type, :string)
    field(:pci_les_graft_conduit_type, :string)
    field(:pci_les_stented_yn, :boolean, default: false)
    field(:pci_les_sten_pct_post, :string)
    field(:pci_les_complexity, :string)
    field(:pci_les_no_reflow_yn, :boolean, default: false)
    field(:pci_les_prior_stent_type, :string)
    field(:pci_les_length, :string)
    field(:pci_les_guide_types, :string)
    field(:pci_les_stent_4_len, :string)
    field(:pci_les_stent_3_len, :string)
    field(:pci_les_balloon_type_post, :string)
    field(:pci_les_graft_segments_ncdr, :string)
    field(:pci_lesev_perforation_treat, :string)
    field(:pci_les_prior_treat_timeframe, :string)
    field(:pci_les_calcium_yn, :boolean, default: false)
    field(:pci_les_device_counter, :string)
    field(:pci_lesev_perforation_class, :string)
    field(:pci_les_graft_segments_cdisc, :string)
    field(:pci_les_counter, :string)
    field(:pci_les_de_novo_yn, :boolean, default: false)
    field(:pci_les_stent_1_code, :string)
    field(:pci_les_stent_3_diam, :string)
    field(:pci_les_branch_occlusion_yn, :boolean, default: false)
    field(:pci_les_status_isr_yn, :boolean, default: false)
    field(:pci_les_balloon_type_pre, :string)
    field(:pci_les_stent_type, :string)
    field(:pci_les_status_isr_duration, :string)
    field(:pci_les_devices_used, {:array, :string})
    field(:pci_les_status, :string)
    field(:pci_lesev_acute_clossure_yn, :boolean, default: false)
    field(:pci_les_rest_no_prior_stent_yn, :boolean, default: false)
    field(:pci_les_graft_segment_pos, :string)
    field(:pci_les_status_isr_stent_type, :string)
    field(:pci_les_status_stent_thrombus, :string)
    field(:pci_les_embolic_protect_type, :string)
    field(:pci_les_in_graft_yn, :boolean, default: false)
    field(:pci_les_notes, :string)
    field(:pci_lesev_dissection_type, :string)
    field(:pci_les_stent_3_code, :string)
    field(:pci_les_gw_cossed_yn, :boolean, default: false)
    field(:pci_les_in_native_yn, :boolean, default: false)
    field(:pci_les_balloon_pres_post, :string)
    field(:pci_les_graft_segments_sts, :string)
    field(:pci_les_stent_1_len, :string)
    field(:pci_les_timi_flow_post, :string)
    field(:pci_les_prior_stent_for_isr_yn, :boolean, default: false)
    field(:pci_procedure_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(pci_lesion, attrs) do
    pci_lesion
    |> cast(attrs, [
      :pci_les_counter,
      :pci_les_gw_cossed_yn,
      :pci_les_success_yn,
      :pci_les_main_technique,
      :pci_les_de_novo_yn,
      :pci_les_in_native_yn,
      :pci_les_in_graft_yn,
      :pci_les_culprit_yn,
      :pci_les_bifurc_sb_treat_yn,
      :pci_les_rest_no_prior_stent_yn,
      :pci_les_prior_treat_stent_yn,
      :pci_les_status_stent_thrombus,
      :pci_les_status_isr_yn,
      :pci_les_status_isr_stent_type,
      :pci_les_status_isr_duration,
      :pci_les_status_isr_class,
      :pci_les_prior_stent_thromb_yn,
      :pci_les_prior_stent_for_isr_yn,
      :pci_les_status,
      :pci_les_complexity,
      :pci_les_length,
      :pci_les_aha_type,
      :pci_les_calcium_yn,
      :pci_les_cto_yn,
      :pci_les_bifurcation_yn,
      :pci_les_prior_treated_yn,
      :pci_les_prior_stent_type,
      :pci_les_prior_treat_timeframe,
      :pci_les_sten_pct_pre,
      :pci_les_timi_flow_pre,
      :pci_les_sten_pct_post,
      :pci_les_timi_flow_post,
      :pci_les_stented_yn,
      :pci_les_direct_stenting_yn,
      :pci_les_stent_type,
      :pci_les_des_type,
      :pci_les_stent_length_total,
      :pci_les_stent_1_diam,
      :pci_les_stent_1_len,
      :pci_les_stent_1_code,
      :pci_les_stent_2_diam,
      :pci_les_stent_2_len,
      :pci_les_stent_2_code,
      :pci_les_stent_3_diam,
      :pci_les_stent_3_len,
      :pci_les_stent_3_code,
      :pci_les_stent_4_diam,
      :pci_les_stent_4_len,
      :pci_les_stent_4_code,
      :pci_les_balloon_size_pre,
      :pci_les_balloon_type_pre,
      :pci_les_balloon_size_post,
      :pci_les_balloon_type_post,
      :pci_les_balloon_pres_post,
      :pci_les_event_yn,
      :pci_lesev_dissection_yn,
      :pci_lesev_dissection_type,
      :pci_lesev_perforation_yn,
      :pci_lesev_perforation_class,
      :pci_lesev_perforation_treat,
      :pci_lesev_acute_clossure_yn,
      :pci_lesev_acute_clossure_treat,
      :pci_les_branch_occlusion_yn,
      :pci_lesev_hosp_stent_thrombosis_category,
      :pci_lesev_re_interven_yn,
      :pci_les_no_reflow_yn,
      :pci_les_no_reflow_type,
      :pci_les_no_reflow_treat,
      :pci_les_involved_seg_cdisc,
      :pci_les_involved_seg_ncdr,
      :pci_les_involved_seg_sts,
      :pci_les_after_graft_type,
      :pci_les_graft_prox_site,
      :pci_les_graft_segments_cdisc,
      :pci_les_graft_segments_ncdr,
      :pci_les_graft_segments_sts,
      :pci_les_graft_segment_pos,
      :pci_les_graft_conduit_type,
      :pci_les_guide_types,
      :pci_les_guide_size,
      :pci_les_device_counter,
      :pci_les_devices_used,
      :pci_les_embolic_protect_type,
      :pci_les_notes
    ])
    |> validate_required([])
  end
end
