defmodule Angio.Repo.Migrations.CreateCathGraft do
  use Ecto.Migration

  def change do
    create table(:cath_graft) do
      add :cath_graft_header, :string
      add :graft_morphology, :string
      add :graft_index, :string
      add :graft_total_occlusion_yn, :boolean, default: false, null: false
      add :graft_sten_yn, :boolean, default: false, null: false
      add :graft_ostial_sten_yn, :boolean, default: false, null: false
      add :graft_ostial_sten_pct, :string
      add :graft_ostial_device_present_yn, :boolean, default: false, null: false
      add :graft_ostial_prior_treated_yn, :boolean, default: false, null: false
      add :graft_ostial_prior_treated_dt, :date
      add :graft_ostial_sten_ffr, :string
      add :graft_ostial_sten_ivus, :string
      add :graft_prox_sten_yn, :boolean, default: false, null: false
      add :graft_prox_sten_pct, :string
      add :graft_prox_sten_device_present_yn, :boolean, default: false, null: false
      add :graft_prox_sten_prior_treated_yn, :boolean, default: false, null: false
      add :graft_prox_sten_prior_treated_dt, :date
      add :graft_prox_sten_ffr, :string
      add :graft_prox_sten_ivus, :string
      add :graft_mid_sten_yn, :boolean, default: false, null: false
      add :graft_mid_sten_pct, :string
      add :graft_mid_sten_device_present_yn, :boolean, default: false, null: false
      add :graft_mid_sten_prior_treated_yn, :boolean, default: false, null: false
      add :graft_mid_sten_prior_treated_dt, :date
      add :graft_mid_sten_ffr, :string
      add :graft_mid_sten_ivus, :string
      add :graft_dist_sten_yn, :boolean, default: false, null: false
      add :graft_dist_sten_pct, :string
      add :graft_dist_sten_device_present_yn, :boolean, default: false, null: false
      add :graft_dist_sten_prior_treated_yn, :boolean, default: false, null: false
      add :graft_dist_sten_prior_treated_dt, :date
      add :graft_dist_sten_ffr, :string
      add :graft_dist_sten_ivus, :string
      add :graft_dist_anast_sten_yn, :boolean, default: false, null: false
      add :graft_dist_anast_type, :string
      add :graft_dist_anast_device_present_yn, :boolean, default: false, null: false
      add :graft_dist_anast_sten_pct, :string
      add :graft_dist_anast_prior_treated_yn, :boolean, default: false, null: false
      add :graft_dist_anast_prior_treated_dt, :date
      add :graft_dist_anast_sten_ffr, :string
      add :graft_dist_anast_sten_ivus, :string
      add :cath_graft_prox_site, :string
      add :cath_graft_conduit_type, :string
      add :cath_graft_segments_main_vessel, :string
      add :cath_graft_segments_ncdr, {:array, :string}
      add :cath_graft_segments_cdisc, {:array, :string}
      add :cath_graft_segments_sts, {:array, :string}
      add :patient_id, :integer
      add :graft_notes, :text

      timestamps()
    end
  end
end
