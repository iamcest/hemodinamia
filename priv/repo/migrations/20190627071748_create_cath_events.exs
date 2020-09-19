defmodule Angio.Repo.Migrations.CreateCathEvents do
  use Ecto.Migration

  def change do
    create table(:cath_events) do
      ############### 3

      add(:cath_ev_header, :string, size: 50)
      add(:cath_ev_event_yn, :boolean, null: false, default: false)

      add(:cath_ev_expired_yn, :boolean, null: false, default: false)
      add(:cath_ev_death_at_proc_yn, :boolean, null: false, default: false)

      add(:cath_ev_infarction_yn, :boolean, null: false, default: false)
      add(:res_term_infarction_type, :string, size: 50)
      add(:cath_ev_prior_mi_yn, :boolean, null: false, default: false)

      add(:cath_ev_shock_start_yn, :boolean, null: false, default: false)
      add(:cath_ev_shock_cath_induced_yn, :boolean, null: false, default: false)
      add(:cath_ev_shock_new_post_yn, :boolean, null: false, default: false)

      add(:cath_ev_cardiac_perforation_yn, :boolean, null: false, default: false)
      add(:uni_cardiac_perforation_site, :string, size: 50)
      add(:cath_ev_tamponate_yn, :boolean, null: false, default: false)

      add(:cath_ev_chf_new_post_yn, :boolean, null: false, default: false)

      add(:cath_ev_cor_art_perforation_yn, :boolean, null: false, default: false)
      add(:cath_ev_cor_art_dissection_yn, :boolean, null: false, default: false)
      add(:cath_ev_cor_vein_dissection_yn, :boolean, null: false, default: false)
      add(:cath_ev_cor_art_thrombus_yn, :boolean, null: false, default: false)

      add(:cath_ev_stroke_new_yn, :boolean, null: false, default: false)
      add(:cath_ev_stroke_new_hemo_yn, :boolean, null: false, default: false)
      add(:cath_ev_stroke_new_24h_yn, :boolean, null: false, default: false)
      add(:cath_ev_stroke_prior_yn, :boolean, null: false, default: false)

      add(:uni_dialysis_new_req_yn, :boolean, null: false, default: false)
      add(:uni_dialysis_new_req_dt, :date)
      add(:uni_currently_on_dialysis, :boolean, null: false, default: false)

      add(:cath_ev_bleed_yn, :boolean, null: false, default: false)
      add(:cath_ev_bleed_dt, :date)
      add(:cath_ev_bleed_tm, :time)
      add(:cath_ev_bleed_dt_tm_utc, :utc_datetime)
      add(:cath_ev_blood_transfusion_yn, :boolean, null: false, default: false)
      add(:cath_ev_hb_prior_transfer, :boolean, null: false, default: false)
      add(:cath_ev_bleed_access_yn, :boolean, null: false, default: false)
      add(:cath_ev_bleed_gu_yn, :boolean, null: false, default: false)
      add(:cath_ev_bleed_gi_yn, :boolean, null: false, default: false)
      add(:cath_ev_bleed_retroperi_yn, :boolean, null: false, default: false)
      add(:cath_ev_bleed_other_yn, :boolean, null: false, default: false)

      add(:cath_ev_vasc_compl_yn, :boolean, null: false, default: false)
      add(:cath_ev_hematoma_at_access_yn, :boolean, null: false, default: false)
      add(:cath_ev_hematoma_size, :string, size: 50)
      add(:cath_ev_hematoma_treat, :string, size: 50)
      add(:cath_ev_vasc_pseudoaneurysm_yn, :boolean, null: false, default: false)
      add(:cath_ev_vasc_dissection_yn, :boolean, null: false, default: false)
      add(:cath_ev_av_fistula_yn, :boolean, null: false, default: false)
      add(:cath_ev_vasc_limb_ischemia_yn, :boolean, null: false, default: false)

      add(:cath_ev_for_cabg_indication, :string, size: 50)
      add(:cath_ev_for_cabg_status, :string, size: 50)
      add(:cath_ev_cabg_location, :string, size: 50)
      add(:cath_ev_cabg_dt, :date)
      add(:cath_ev_cabg_tm, :time)
      add(:cath_ev_cabg_dt_tm_utc, :utc_datetime)

      add(:cath_ev_valve_injury_yn, :boolean, null: false, default: false)

      add(:cath_ev_heart_block_yn, :boolean, null: false, default: false)
      add(:cath_ev_cardioversion_yn, :boolean, null: false, default: false)
      add(:cath_event_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()

      ##################
    end
  end
end
