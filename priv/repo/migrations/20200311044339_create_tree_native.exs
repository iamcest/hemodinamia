defmodule Angio.Repo.Migrations.CreateTreeNative do
  use Ecto.Migration

  def change do
    create table(:tree_native) do
      add :vessel_id, :string
      add :path, :text
      add :size, :string
      add :vessel, :string
      add :visible, :string
      add :default_draw, :string
      add :course_benign, :string
      add :course_malignant, :string
      add :is_variant, :string
      add :is_anomaly, :string
      add :description_name, :string
      add :lesion_present, :string
      add :lesion_id, :string
      add :device_present, :string
      add :device_id, :string
      add :cor_les_prior_treated_yn, :string
      add :prior_treated_date, :string
      add :graft_present, :string
      add :graft_id, :string
      add :collateral_points, :string
      add :rca_dom_draw, :string
      add :lcx_dom_draw, :string
      add :balanced_dom_draw, :string
      add :cor_les_calcium_yn, :string
      add :vessel_group, :string
      add :cor_les_thrombus_yn, :string
      add :irregularities_has, :string
      add :seg_def, :string
      add :cor_les_segments_cdisc, :string
      add :cor_les_pct, :string
      add :cor_les_prior_stent_yn, :string
      add :cor_les_stent_ptc, :string
      add :lesion_path, :text
      add :graft_path, :text
      add :stent_path, :text
      add :lesion_x, :string
      add :lesion_y, :string
      add :stent_x, :string
      add :stent_y, :string
      add :graft_x, :string
      add :graft_y, :string
      add :vessel_group_aha, :string
      add :lad_type_draw, :string
      add :add, :string
      add :aor_les_thrombus_yn, :string
      add :cor_les_stent_pct, :string

      timestamps()
    end

  end
end
