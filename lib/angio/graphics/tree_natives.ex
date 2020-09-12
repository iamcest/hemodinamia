defmodule Angio.Graphics.Tree_natives do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "tree_native" do
    field :seg_def, :string
    field :aor_les_thrombus_yn, :string
    field :visible, :string
    field :path, :string
    field :default_draw, :string
    field :device_present, :string
    field :collateral_points, :string
    field :graft_x, :string
    field :graft_y, :string
    field :cor_les_segments_cdisc, :string
    field :lesion_present, :string
    field :lesion_y, :string
    field :lesion_path, :string
    field :course_benign, :string
    field :irregularities_has, :string
    field :cor_les_stent_ptc, :string
    field :graft_id, :string
    field :stent_y, :string
    field :add, :string
    field :description_name, :string
    field :cor_les_stent_pct, :string
    field :vessel_group, :string
    field :lesion_x, :string
    field :graft_path, :string
    field :balanced_dom_draw, :string
    field :cor_les_pct, :string
    field :cor_les_calcium_yn, :string
    field :cor_les_prior_stent_yn, :string
    field :cor_les_thrombus_yn, :string
    field :vessel_id, :string
    field :course_malignant, :string
    field :lad_type_draw, :string
    field :cor_les_prior_treated_yn, :string
    field :stent_x, :string
    field :graft_present, :string
    field :lcx_dom_draw, :string
    field :lesion_id, :string
    field :prior_treated_date, :string
    field :device_id, :string
    field :is_anomaly, :string
    field :size, :string
    field :vessel, :string
    field :is_variant, :string
    field :vessel_group_aha, :string
    field :stent_path, :string
    field :rca_dom_draw, :string

    timestamps()
  end

  @doc false
  def changeset(tree_natives, attrs) do
    tree_natives
    |> cast(attrs, [:vessel_id, :path, :size, :vessel, :visible, :default_draw, :course_benign, :course_malignant, :is_variant, :is_anomaly, :description_name, :lesion_present, :lesion_id, :device_present, :device_id, :cor_les_prior_treated_yn, :prior_treated_date, :graft_present, :graft_id, :collateral_points, :rca_dom_draw, :lcx_dom_draw, :balanced_dom_draw, :cor_les_calcium_yn, :vessel_group, :cor_les_thrombus_yn, :irregularities_has, :seg_def, :cor_les_segments_cdisc, :cor_les_pct, :cor_les_prior_stent_yn, :cor_les_stent_ptc, :lesion_path, :graft_path, :stent_path, :lesion_x, :lesion_y, :stent_x, :stent_y, :graft_x, :graft_y, :vessel_group_aha, :lad_type_draw, :add, :aor_les_thrombus_yn, :cor_les_stent_pct])
    |> validate_required([])
    #|> validate_required([:vessel_id, :path, :size, :vessel, :visible, :default_draw, :course_benign, :course_malignant, :is_variant, :is_anomaly, :description_name, :lesion_present, :lesion_id, :device_present, :device_id, :cor_les_prior_treated_yn, :prior_treated_date, :graft_present, :graft_id, :collateral_points, :rca_dom_draw, :lcx_dom_draw, :balanced_dom_draw, :cor_les_calcium_yn, :vessel_group, :cor_les_thrombus_yn, :irregularities_has, :seg_def, :cor_les_segments_cdisc, :cor_les_pct, :cor_les_prior_stent_yn, :cor_les_stent_ptc, :lesion_path, :graft_path, :stent_path, :lesion_x, :lesion_y, :stent_x, :stent_y, :graft_x, :graft_y, :vessel_group_aha, :lad_type_draw, :add, :aor_les_thrombus_yn, :cor_les_stent_pct])
  end

  def order_by_vessel_id(query) do
    _query = from(c in query, order_by: [asc: c.vessel_id])
  end


end
