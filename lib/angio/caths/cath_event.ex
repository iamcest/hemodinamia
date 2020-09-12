defmodule Angio.Caths.Cath_event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_events" do
    field(:cath_ev_shock_start_yn, :boolean, default: false)
    field(:cath_ev_expired_yn, :boolean, default: false)
    field(:cath_ev_shock_new_post_yn, :boolean, default: false)
    field(:cath_ev_tamponate_yn, :boolean, default: false)
    field(:cath_ev_stroke_prior_yn, :boolean, default: false)
    field(:cath_ev_chf_new_post_yn, :boolean, default: false)
    field(:cath_ev_bleed_gi_yn, :boolean, default: false)
    field(:cath_ev_av_fistula_yn, :boolean, default: false)
    field(:cath_ev_shock_cath_induced_yn, :boolean, default: false)
    field(:cath_ev_valve_injury_yn, :boolean, default: false)
    field(:cath_ev_blood_transfusion_yn, :boolean, default: false)
    field(:uni_currently_on_dialysis, :boolean, default: false)
    field(:cath_ev_vasc_compl_yn, :boolean, default: false)
    field(:cath_ev_for_cabg_indication, :string)
    field(:cath_ev_cor_art_thrombus_yn, :boolean, default: false)
    field(:cath_ev_cardiac_perforation_yn, :boolean, default: false)
    field(:cath_ev_death_at_proc_yn, :boolean, default: false)
    field(:cath_ev_event_yn, :boolean, default: false)
    field(:cath_event_notes, :string)
    field(:uni_dialysis_new_req_dt, :date)
    field(:cath_ev_vasc_pseudoaneurysm_yn, :boolean, default: false)
    field(:cath_ev_cor_art_dissection_yn, :boolean, default: false)
    field(:cath_ev_hb_prior_transfer, :boolean, default: false)
    field(:cath_ev_hematoma_treat, :string)
    field(:uni_dialysis_new_req_yn, :boolean, default: false)
    field(:cath_ev_bleed_yn, :boolean, default: false)
    field(:cath_ev_header, :string)
    field(:cath_ev_stroke_new_24h_yn, :boolean, default: false)
    field(:cath_ev_stroke_new_hemo_yn, :boolean, default: false)
    field(:cath_ev_cabg_dt, :date)
    field(:cath_ev_cor_art_perforation_yn, :boolean, default: false)

    field(:res_term_infarction_type, :string)
    field(:cath_ev_vasc_dissection_yn, :boolean, default: false)
    field(:cath_ev_bleed_gu_yn, :boolean, default: false)
    field(:cath_ev_bleed_dt_tm_utc, :utc_datetime)
    field(:cath_ev_heart_block_yn, :boolean, default: false)
    field(:cath_ev_hematoma_at_access_yn, :boolean, default: false)
    # field :uni_bleed_barc_class, :string
    field(:cath_ev_bleed_dt, :date)
    field(:cath_ev_vasc_limb_ischemia_yn, :boolean, default: false)
    field(:cath_ev_bleed_retroperi_yn, :boolean, default: false)
    field(:cath_ev_cardioversion_yn, :boolean, default: false)
    field(:cath_ev_bleed_tm, :time)
    field(:cath_ev_infarction_yn, :boolean, default: false)
    field(:cath_ev_for_cabg_status, :string)
    field(:cath_ev_cabg_dt_tm_utc, :utc_datetime)
    field(:cath_ev_cabg_location, :string)
    field(:cath_ev_hematoma_size, :string)
    field(:cath_ev_cor_vein_dissection_yn, :boolean, default: false)
    field(:cath_ev_cabg_tm, :time)
    field(:cath_ev_bleed_other_yn, :boolean, default: false)
    field(:cath_ev_prior_mi_yn, :boolean, default: false)
    field(:cath_ev_bleed_access_yn, :boolean, default: false)
    field(:cath_ev_stroke_new_yn, :boolean, default: false)
    field(:uni_cardiac_perforation_site, :string)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(cath_event, attrs) do
    cath_event
    |> cast(attrs, [
      :cath_ev_header,
      :cath_ev_event_yn,
      :cath_ev_expired_yn,
      :cath_ev_death_at_proc_yn,
      :cath_ev_infarction_yn,
      :res_term_infarction_type,
      :cath_ev_prior_mi_yn,
      :cath_ev_shock_start_yn,
      :cath_ev_shock_cath_induced_yn,
      :cath_ev_shock_new_post_yn,
      :cath_ev_cardiac_perforation_yn,
      :uni_cardiac_perforation_site,
      :cath_ev_tamponate_yn,
      :cath_ev_chf_new_post_yn,
      :cath_ev_cor_art_perforation_yn,
      :cath_ev_cor_art_dissection_yn,
      :cath_ev_cor_vein_dissection_yn,
      :cath_ev_cor_art_thrombus_yn,
      :cath_ev_stroke_new_yn,
      :cath_ev_stroke_new_hemo_yn,
      :cath_ev_stroke_new_24h_yn,
      :cath_ev_stroke_prior_yn,
      :uni_dialysis_new_req_yn,
      :uni_dialysis_new_req_dt,
      :uni_currently_on_dialysis,
      :cath_ev_bleed_yn,
      :cath_ev_bleed_dt,
      :cath_ev_bleed_tm,
      :cath_ev_bleed_dt_tm_utc,
      :cath_ev_blood_transfusion_yn,
      :cath_ev_hb_prior_transfer,
      :cath_ev_bleed_access_yn,
      :cath_ev_bleed_gu_yn,
      :cath_ev_bleed_gi_yn,
      :cath_ev_bleed_retroperi_yn,
      # :uni_bleed_barc_class,
      :cath_ev_bleed_other_yn,
      :cath_ev_vasc_compl_yn,
      :cath_ev_hematoma_at_access_yn,
      :cath_ev_hematoma_size,
      :cath_ev_hematoma_treat,
      :cath_ev_vasc_pseudoaneurysm_yn,
      :cath_ev_vasc_dissection_yn,
      :cath_ev_av_fistula_yn,
      :cath_ev_vasc_limb_ischemia_yn,
      :cath_ev_for_cabg_indication,
      :cath_ev_for_cabg_status,
      :cath_ev_cabg_location,
      :cath_ev_cabg_dt,
      :cath_ev_cabg_tm,
      :cath_ev_cabg_dt_tm_utc,
      :cath_ev_valve_injury_yn,
      :cath_ev_heart_block_yn,
      :cath_ev_cardioversion_yn,
      :cath_event_notes
    ])
    |> validate_required([])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :cath_events_info_coronary_id_index,
      message: "Error: Record For  Cath Events  Was Inserted"
    )

    #    |> validate_required([:cath_ev_header, :cath_ev_event_yn, :cath_ev_expired_yn, :cath_ev_death_at_proc_yn, :cath_ev_infarction_yn, :res_term_infarction_type, :cath_ev_prior_mi_yn, :cath_ev_shock_start_yn, :cath_ev_shock_cath_induced_yn, :cath_ev_shock_new_post_yn, :cath_ev_cardiac_perforation_yn, :uni_cardiac_perforation_site, :cath_ev_tamponate_yn, :cath_ev_chf_new_post_yn, :cath_ev_cor_art_perforation_yn, :"", :cath_ev_cor_art_dissection_yn, :cath_ev_cor_vein_dissection_yn, :cath_ev_cor_art_thrombus_yn, :cath_ev_stroke_new_yn, :cath_ev_stroke_new_hemo_yn, :cath_ev_stroke_new_24h_yn, :cath_ev_stroke_prior_yn, :uni_dialysis_new_req_yn, :uni_dialysis_new_req_dt, :uni_currently_on_dialysis, :cath_ev_bleed_yn, :cath_ev_bleed_dt, :cath_ev_bleed_tm, :cath_ev_bleed_dt_tm_utc, :cath_ev_blood_transfusion_yn, :cath_ev_hb_prior_transfer, :cath_ev_bleed_access_yn, :"", :cath_ev_bleed_gu_yn, :cath_ev_bleed_gi_yn, :cath_ev_bleed_retroperi_yn, :uni_bleed_barc_class, :cath_ev_bleed_other_yn, :cath_ev_vasc_compl_yn, :cath_ev_hematoma_at_access_yn, :cath_ev_hematoma_size, :cath_ev_hematoma_treat, :cath_ev_vasc_pseudoaneurysm_yn, :cath_ev_vasc_dissection_yn, :cath_ev_av_fistula_yn, :cath_ev_vasc_limb_ischemia_yn, :cath_ev_for_cabg_indication, :cath_ev_for_cabg_status, :cath_ev_cabg_location, :cath_ev_cabg_dt, :cath_ev_cabg_tm, :cath_ev_cabg_dt_tm_utc, :cath_ev_valve_injury_yn, :cath_ev_heart_block_yn, :cath_ev_cardioversion_yn, :cath_ev_notes])
  end
end
