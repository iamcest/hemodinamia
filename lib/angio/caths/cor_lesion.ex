defmodule Angio.Caths.Cor_lesion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cor_lesions" do
    field(:cor_les_aneurysm_yn, :boolean, default: false)
    field(:cor_les_bifurcation_yn, :boolean, default: false)
    field(:cor_les_calcium_yn, :boolean, default: false)
    field(:cor_les_chronic_total_yn, :boolean, default: false)
    field(:cor_les_counter, :integer)
    field(:cor_les_ffr, :string)
    field(:cor_les_graft_pct, :string)
    field(:cor_les_ivus, :string)
    field(:cor_les_length, :string)
    field(:cor_les_major_branch, :string)
    field(:cor_les_ostial_loc_yn, :boolean)
    field(:cor_les_pct, :string)
    field(:cor_les_prior_stent_yn, :boolean, default: false)
    field(:cor_les_prior_treated_dt, :date)
    field(:cor_les_prior_treated_other, :string)
    field(:cor_les_prior_treated_yn, :boolean)
    field(:cor_les_protected_yn, :boolean, default: false)
    field(:cor_les_seg_cdisc, {:array, :string})
    field(:cor_les_seg_ncdr, {:array, :string})
    field(:cor_les_seg_sts, {:array, :string})
    field(:cor_les_stent_dt, :date)
    field(:cor_les_stent_pct, :string)
    field(:cor_les_tandem_yn, :boolean, default: false)
    field(:cor_les_thrombus_yn, :boolean, default: false)
    field(:cor_les_type_aha, :string)
    field(:cor_les_type_scai, :string)
    field(:cor_les_vessel_size, :string)
    field(:info_coronary_id, :integer)
    field(:patient_id, :integer)
    field(:cor_les_notes, :string)

    timestamps()
  end

  @doc false
  def changeset(cor_lesion, attrs) do
    cor_lesion
    |> cast(attrs, [
      :cor_les_pct,
      :cor_les_major_branch,
      :cor_les_seg_ncdr,
      :cor_les_seg_cdisc,
      :cor_les_seg_sts,
      :cor_les_vessel_size,
      :cor_les_type_scai,
      :cor_les_type_aha,
      :cor_les_length,
      :cor_les_chronic_total_yn,
      :cor_les_ostial_loc_yn,
      :cor_les_calcium_yn,
      :cor_les_thrombus_yn,
      :cor_les_bifurcation_yn,
      :cor_les_tandem_yn,
      :cor_les_aneurysm_yn,
      :cor_les_protected_yn,
      :cor_les_graft_pct,
      :cor_les_prior_treated_yn,
      :cor_les_prior_treated_other,
      :cor_les_prior_treated_dt,
      :cor_les_prior_stent_yn,
      :cor_les_stent_dt,
      :cor_les_stent_pct,
      :cor_les_ffr,
      :cor_les_ivus,
      :cor_les_counter,
      :patient_id,
      :cor_les_notes
      # :info_coronary_id
    ])
    |> validate_required([])

    # |> validate_required([:"cor_les_pct,", :"", :"cor_les_major_branch,", :"", :cor_les_seg_ncdr, :cor_les_seg_cdisc, :cor_les_seg_sts, :"cor_les_vessel_size,", :"", :"cor_les_type_scai,", :"", :"cor_les_type_aha,", :"", :"cor_les_length,", :"", :"cor_les_chronic_total_yn,", :"", :"cor_les_ostial_loc,", :"", :"cor_les_calcium_yn,", :"", :"cor_les_thrombus_yn,", :"", :"cor_les_bifurcation_yn,", :"", :"cor_les_tandem_yn,", :"", :"cor_les_aneurysm_yn,", :"", :"cor_les_protected_yn,", :"", :"cor_les_graft_pct,", :"", :"cor_les_prior_treated_yn,", :"", :"cor_les_prior_treated_other,", :"", :"cor_les_prior_treated_dt,", :"", :"cor_les_prior_stent_yn,", :"", :"cor_les_stent_dt,", :"", :"cor_les_stent_pct,", :"", :"cor_les_ffr,", :"", :"cor_les_ivus,", :"", :"cor_les_counter,", :"", :"patient_id,", :"", :"info_coronary_id,", :""])
  end
end
