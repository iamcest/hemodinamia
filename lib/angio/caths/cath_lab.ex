defmodule Angio.Caths.Cath_lab do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_labs" do
    field(:cath_biomarker_positive_post_yn, :boolean, default: false)
    field(:cath_ck_post_normal_ckmb_na, :boolean, default: false)
    field(:cath_ck_pre_normal_ckmb_pre_na, :boolean, default: false)
    field(:cath_ckmb_peak_post_na, :boolean, default: false)
    field(:cath_ckmb_post_val, :string)
    field(:cath_ckmb_pre_na, :boolean, default: false)
    field(:cath_ckmb_pre_val, :string)
    field(:cath_creatinine_highest_na, :boolean, default: false)
    field(:cath_creatinine_highest_val, :string)
    field(:cath_creatinine_post_na, :boolean, default: false)
    field(:cath_creatinine_post_val, :string)
    field(:cath_creatinine_pre_discharge, :string)
    field(:cath_creatinine_pre_discharge_na, :boolean, default: false)
    field(:cath_creatinine_pre_na, :boolean, default: false)
    field(:cath_creatinine_pre_val, :string)
    field(:cath_hb_post_lowest_val, :string)
    field(:cath_hb_post_na, :boolean, default: false)
    field(:cath_hb_post_val, :string)
    field(:cath_hb_pre_na, :boolean, default: false)
    field(:cath_hb_pre_val, :string)
    field(:cath_tropo_i_peak_post_na, :boolean, default: false)
    field(:cath_tropo_i_peak_post_val, :string)
    field(:cath_tropo_i_pre_na, :boolean, default: false)
    field(:cath_tropo_i_pre_val, :string)
    field(:cath_tropo_t_peak_post_na, :boolean, default: false)
    field(:cath_tropo_t_peak_post_val, :string)
    field(:cath_tropo_t_pre_na, :boolean, default: false)
    field(:cath_tropo_t_pre_val, :string)
    field(:cath_lab_notes, :string)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(cath_lab, attrs) do
    cath_lab
    |> cast(attrs, [
      :cath_hb_pre_val,
      :cath_hb_pre_na,
      :cath_hb_post_val,
      :cath_hb_post_lowest_val,
      :cath_hb_post_na,
      :cath_biomarker_positive_post_yn,
      :cath_ck_pre_normal_ckmb_pre_na,
      :cath_ck_post_normal_ckmb_na,
      :cath_ckmb_pre_val,
      :cath_ckmb_pre_na,
      :cath_ckmb_post_val,
      :cath_ckmb_peak_post_na,
      :cath_tropo_t_pre_val,
      :cath_tropo_t_pre_na,
      :cath_tropo_t_peak_post_val,
      :cath_tropo_t_peak_post_na,
      :cath_tropo_i_pre_val,
      :cath_tropo_i_pre_na,
      :cath_tropo_i_peak_post_val,
      :cath_tropo_i_peak_post_na,
      :cath_creatinine_pre_val,
      :cath_creatinine_pre_na,
      :cath_creatinine_highest_val,
      :cath_creatinine_highest_na,
      :cath_creatinine_post_val,
      :cath_creatinine_post_na,
      :cath_creatinine_pre_discharge,
      :cath_creatinine_pre_discharge_na,
      :cath_lab_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :cath_labs_info_coronary_id_index,
      message: "Error: Record For  Cath Events  Was Inserted"
    )

    # |> validate_required([:cath_hb_pre_val, :cath_hb_pre_na, :cath_hb_post_val, :cath_hb_post_lowest_val, :cath_hb_post_na, :cath_biomarker_positive_post_yn, :cath_ck_pre_normal_ckmb_pre_na, :cath_ck_post_normal_ckmb_na, :cath_ckmb_pre_val, :cath_ckmb_pre_na, :cath_ckmb_post_val, :cath_ckmb_peak_post_na, :cath_tropo_t_pre_val, :cath_tropo_t_pre_na, :cath_tropo_t_peak_post_val, :cath_tropo_t_peak_post_na, :cath_tropo_i_pre_val, :cath_tropo_i_pre_na, :cath_tropo_i_peak_post_val, :cath_tropo_i_peak_post_na, :cath_creatinine_pre_val, :cath_creatinine_pre_na, :cath_creatinine_highest_val, :cath_creatinine_highest_na, :cath_creatinine_post_val, :cath_creatinine_post_na, :cath_creatinine_pre_discharge, :cath_creatinine_pre_discharge_na])
  end
end
