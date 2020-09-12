defmodule Angio.Caths.Cor_anatomy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cor_anatomies" do
    field(:cor_anat_anomalies_yn, :boolean, default: false)
    field(:cor_anat_conus_type, :string)
    field(:cor_anat_dominance, :string)
    field(:cor_anat_lad_d1_type, :string)
    field(:cor_anat_lad_d2_type, :string)
    field(:cor_anat_lad_d3_type, :string)
    field(:cor_anat_lad_distal_type, :string)
    field(:cor_anat_lad_mid_type, :string)
    field(:cor_anat_lad_ostium_type, :string)
    field(:cor_anat_lad_prox_type, :string)
    field(:cor_anat_lcx_distal_type, :string)
    field(:cor_anat_lcx_mid_type, :string)
    field(:cor_anat_lcx_om1_type, :string)
    field(:cor_anat_lcx_om2_type, :string)
    field(:cor_anat_lcx_om3_type, :string)
    field(:cor_anat_lcx_ostium_type, :string)
    field(:cor_anat_lcx_prox_type, :string)
    field(:cor_anat_lcx_type, :string)
    field(:cor_anat_lm_ostium_type, :string)
    field(:cor_anat_lm_type, :string)
    field(:cor_anat_notes, :string)
    field(:cor_anat_pl_type, :string)
    field(:cor_anat_ramus_type, :string)
    field(:cor_anat_rca_distal_type, :string)
    field(:cor_anat_rca_mid_type, :string)
    field(:cor_anat_rca_ostium_type, :string)
    field(:cor_anat_rca_pda_type, :string)
    field(:cor_anat_rca_rv_branch_type, :string)
    field(:cor_anat_rca_type, :string)
    field(:cor_anat_septal_ostium_type, :string)
    field(:cor_anat_sino_atrial_type, :string)
    field(:cor_anat_variations_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(cor_anatomy, attrs) do
    cor_anatomy
    |> cast(attrs, [
      :cor_anat_variations_yn,
      :cor_anat_anomalies_yn,
      :cor_anat_dominance,
      :cor_anat_lm_ostium_type,
      :cor_anat_lm_type,
      :cor_anat_rca_type,
      :cor_anat_rca_ostium_type,
      :cor_anat_rca_mid_type,
      :cor_anat_rca_rv_branch_type,
      :cor_anat_rca_distal_type,
      :cor_anat_rca_pda_type,
      :cor_anat_lad_ostium_type,
      :cor_anat_lad_prox_type,
      :cor_anat_lad_mid_type,
      :cor_anat_septal_ostium_type,
      :cor_anat_lad_distal_type,
      :cor_anat_lad_d1_type,
      :cor_anat_lad_d2_type,
      :cor_anat_lad_d3_type,
      :cor_anat_sino_atrial_type,
      :cor_anat_lcx_type,
      :cor_anat_lcx_ostium_type,
      :cor_anat_lcx_prox_type,
      :cor_anat_lcx_mid_type,
      :cor_anat_lcx_distal_type,
      :cor_anat_lcx_om1_type,
      :cor_anat_lcx_om2_type,
      :cor_anat_lcx_om3_type,
      :cor_anat_ramus_type,
      :cor_anat_pl_type,
      :cor_anat_conus_type,
      :cor_anat_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :cor_anatomies_info_coronary_id_index,
      message: "Error: Record For  Coronary Anatomy Was Inserted"
    )

    # |> validate_required([:cor_anat_variations_yn, :cor_anat_anomalies_yn, :cor_anat_dominance, :cor_anat_lm_ostium_type, :cor_anat_lm_type, :cor_anat_rca_type, :cor_anat_rca_ostium_type, :cor_anat_rca_mid_type, :cor_anat_rca_rv_branch_type, :cor_anat_rca_distal_type, :cor_anat_rca_pda_type, :cor_anat_lad_ostium_type, :cor_anat_lad_prox_type, :cor_anat_lad_mid_type, :cor_anat_septal_ostium_type, :cor_anat_lad_distal_type, :cor_anat_lad_d1_type, :cor_anat_lad_d2_type, :cor_anat_lad_d3_type, :cor_anat_sino_atrial_type, :cor_anat_lcx_type, :cor_anat_lcx_ostium_type, :cor_anat_lcx_prox_type, :cor_anat_lcx_mid_type, :cor_anat_lcx_distal_type, :cor_anat_lcx_om1_type, :cor_anat_lcx_om2_type, :cor_anat_lcx_om3_type, :cor_anat_ramus_type, :cor_anat_pl_type, :cor_anat_conus_type, :cor_anat_notes])
  end
end
