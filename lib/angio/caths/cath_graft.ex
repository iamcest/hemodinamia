defmodule Angio.Caths.Cath_graft do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_grafts" do
    field(:graft_prox_sten_prior_treated_dt, :date)
    field(:graft_ostial_sten_ivus, :string)
    field(:graft_prox_sten_ivus, :string)
    field(:graft_mid_sten_device_present_yn, :boolean, default: false)
    field(:graft_dist_sten_prior_treated_dt, :date)
    field(:graft_mid_sten_prior_treated_yn, :boolean, default: false)
    field(:cath_graft_conduit_type, :string)
    field(:graft_prox_sten_ffr, :string)
    field(:graft_dist_anast_prior_treated_dt, :date)
    field(:graft_dist_anast_sten_yn, :boolean, default: false)
    field(:graft_index, :string)
    field(:cath_graft_segments_sts, {:array, :string})
    field(:graft_total_occlusion_yn, :boolean, default: false)
    field(:graft_dist_sten_yn, :boolean, default: false)
    field(:graft_mid_sten_yn, :boolean, default: false)
    field(:graft_prox_sten_yn, :boolean, default: false)
    field(:graft_ostial_sten_ffr, :string)
    field(:graft_dist_sten_ivus, :string)
    field(:graft_morphology, :string)
    field(:graft_mid_sten_ffr, :string)
    field(:cath_graft_header, :string)
    field(:graft_dist_anast_sten_ffr, :string)
    field(:graft_dist_sten_ffr, :string)
    field(:graft_dist_anast_type, :string)
    field(:graft_ostial_prior_treated_dt, :date)
    field(:graft_dist_sten_prior_treated_yn, :boolean, default: false)
    field(:graft_dist_sten_device_present_yn, :boolean, default: false)
    field(:graft_ostial_prior_treated_yn, :boolean, default: false)
    field(:graft_mid_sten_prior_treated_dt, :date)
    field(:graft_prox_sten_device_present_yn, :boolean, default: false)
    field(:graft_ostial_sten_pct, :string)
    field(:cath_graft_prox_site, :string)
    field(:graft_dist_anast_prior_treated_yn, :boolean, default: false)
    field(:patient_id, :integer)
    field(:graft_ostial_sten_yn, :boolean, default: false)
    field(:cath_graft_segments_ncdr, {:array, :string})
    field(:graft_dist_anast_device_present_yn, :boolean, default: false)
    field(:graft_sten_yn, :boolean, default: false)
    field(:cath_graft_segments_main_vessel, :string)
    field(:graft_ostial_device_present_yn, :boolean, default: false)
    field(:graft_dist_anast_sten_pct, :string)
    field(:graft_prox_sten_pct, :string)
    field(:graft_notes, :string)
    field(:graft_mid_sten_ivus, :string)
    field(:cath_graft_segments_cdisc, {:array, :string})
    field(:graft_prox_sten_prior_treated_yn, :boolean, default: false)
    field(:graft_dist_anast_sten_ivus, :string)
    field(:graft_dist_sten_pct, :string)
    field(:graft_mid_sten_pct, :string)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(cath_graft, attrs) do
    cath_graft
    |> cast(attrs, [
      :cath_graft_header,
      :graft_morphology,
      :graft_index,
      :graft_total_occlusion_yn,
      :graft_sten_yn,
      :graft_ostial_sten_yn,
      :graft_ostial_sten_pct,
      :graft_ostial_device_present_yn,
      :graft_ostial_prior_treated_yn,
      :graft_ostial_prior_treated_dt,
      :graft_ostial_sten_ffr,
      :graft_ostial_sten_ivus,
      :graft_prox_sten_yn,
      :graft_prox_sten_pct,
      :graft_prox_sten_device_present_yn,
      :graft_prox_sten_prior_treated_yn,
      :graft_prox_sten_prior_treated_dt,
      :graft_prox_sten_ffr,
      :graft_prox_sten_ivus,
      :graft_mid_sten_yn,
      :graft_mid_sten_pct,
      :graft_mid_sten_device_present_yn,
      :graft_mid_sten_prior_treated_yn,
      :graft_mid_sten_prior_treated_dt,
      :graft_mid_sten_ffr,
      :graft_mid_sten_ivus,
      :graft_dist_sten_yn,
      :graft_dist_sten_pct,
      :graft_dist_sten_device_present_yn,
      :graft_dist_sten_prior_treated_yn,
      :graft_dist_sten_prior_treated_dt,
      :graft_dist_sten_ffr,
      :graft_dist_sten_ivus,
      :graft_dist_anast_sten_yn,
      :graft_dist_anast_type,
      :graft_dist_anast_device_present_yn,
      :graft_dist_anast_sten_pct,
      :graft_dist_anast_prior_treated_yn,
      :graft_dist_anast_prior_treated_dt,
      :graft_dist_anast_sten_ffr,
      :graft_dist_anast_sten_ivus,
      :cath_graft_prox_site,
      :cath_graft_conduit_type,
      :cath_graft_segments_main_vessel,
      :cath_graft_segments_ncdr,
      :cath_graft_segments_cdisc,
      :cath_graft_segments_sts,
      :patient_id,
      :graft_notes
    ])
    |> validate_required([])

    # |> validate_required([:cath_graft_header, :graft_morphology, :graft_index, :graft_total_occlusion_yn, :graft_sten_yn, :graft_ostial_sten_yn, :graft_ostial_sten_pct, :graft_ostial_device_present_yn, :graft_ostial_prior_treated_yn, :graft_ostial_prior_treated_dt, :graft_ostial_sten_ffr, :graft_ostial_sten_ivus, :graft_prox_sten_yn, :graft_prox_sten_pct, :graft_prox_sten_device_present_yn, :graft_prox_sten_prior_treated_yn, :graft_prox_sten_prior_treated_dt, :graft_prox_sten_ffr, :graft_prox_sten_ivus, :graft_mid_sten_yn, :graft_mid_sten_pct, :graft_mid_sten_device_present_yn, :graft_mid_sten_prior_treated_yn, :graft_mid_sten_prior_treated_dt, :graft_mid_sten_ffr, :graft_mid_sten_ivus, :graft_dist_sten_yn, :graft_dist_sten_pct, :graft_dist_sten_device_present_yn, :graft_dist_sten_prior_treated_yn, :graft_dist_sten_prior_treated_dt, :graft_dist_sten_ffr, :graft_dist_sten_ivus, :graft_dist_anast_sten_yn, :graft_dist_anast_type, :graft_dist_anast_device_present_yn, :graft_dist_anast_sten_pct, :graft_dist_anast_prior_treated_yn, :graft_dist_anast_prior_treated_dt, :graft_dist_anast_sten_ffr, :graft_dist_anast_sten_ivus, :cath_graft_prox_site, :cath_graft_conduit_type, :cath_graft_segments_main_vessel, :cath_graft_segments_ncdr, :cath_graft_segments_cdisc, :cath_graft_segments_sts, :patient_id, :graft_notes])
  end
end
