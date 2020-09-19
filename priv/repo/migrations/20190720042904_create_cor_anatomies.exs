defmodule Angio.Repo.Migrations.CreateCorAnatomies do
  use Ecto.Migration

  def change do
    create table(:cor_anatomies) do
      add(:cor_anat_variations_yn, :boolean, default: false, null: false)
      add(:cor_anat_anomalies_yn, :boolean, default: false, null: false)
      add(:cor_anat_dominance, :string, size: 50)
      add(:cor_anat_lm_ostium_type, :string, size: 50)
      add(:cor_anat_lm_type, :string, size: 50)
      add(:cor_anat_rca_type, :string, size: 50)
      add(:cor_anat_rca_ostium_type, :string, size: 50)
      add(:cor_anat_rca_mid_type, :string, size: 50)
      add(:cor_anat_rca_rv_branch_type, :string, size: 50)
      add(:cor_anat_rca_distal_type, :string, size: 50)
      add(:cor_anat_rca_pda_type, :string, size: 50)
      add(:cor_anat_lad_ostium_type, :string, size: 50)
      add(:cor_anat_lad_prox_type, :string, size: 50)
      add(:cor_anat_lad_mid_type, :string, size: 50)
      add(:cor_anat_septal_ostium_type, :string, size: 50)
      add(:cor_anat_lad_distal_type, :string, size: 50)
      add(:cor_anat_lad_d1_type, :string, size: 50)
      add(:cor_anat_lad_d2_type, :string, size: 50)
      add(:cor_anat_lad_d3_type, :string, size: 50)
      add(:cor_anat_sino_atrial_type, :string, size: 50)
      add(:cor_anat_lcx_type, :string, size: 50)
      add(:cor_anat_lcx_ostium_type, :string, size: 50)
      add(:cor_anat_lcx_prox_type, :string, size: 50)
      add(:cor_anat_lcx_mid_type, :string, size: 50)
      add(:cor_anat_lcx_distal_type, :string, size: 50)
      add(:cor_anat_lcx_om1_type, :string, size: 50)
      add(:cor_anat_lcx_om2_type, :string, size: 50)
      add(:cor_anat_lcx_om3_type, :string, size: 50)
      add(:cor_anat_ramus_type, :string, size: 50)
      add(:cor_anat_pl_type, :string, size: 50)
      add(:cor_anat_conus_type, :string, size: 50)
      add(:cor_anat_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
