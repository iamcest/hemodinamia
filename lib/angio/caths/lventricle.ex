defmodule Angio.Caths.Lventricle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lventricles" do
    field(:cath_lv_ef_method, :string)
    field(:cath_lv_ef_val, :string)
    field(:cath_lv_heart_rate, :string)
    field(:cath_lv_lao_apical_septal, :string)
    field(:cath_lv_lao_basal_septal, :string)

    field(:cath_lv_lao_inf_lat, :string)
    field(:cath_lv_lao_post_lat, :string)
    field(:cath_lv_lao_super_lat, :string)
    field(:cath_lv_lv_pres_end_dias, :string)
    field(:cath_lv_lv_pres_sys, :string)
    field(:cath_lv_mvr, :string)

    field(:cath_lv_normal_yn, :boolean, default: false)
    field(:cath_lv_rao_antero_basal, :string)
    field(:cath_lv_rao_antero_lat, :string)
    field(:cath_lv_rao_apical, :string)
    field(:cath_lv_rao_diaphragmatic, :string)
    field(:cath_lv_rao_post_basal, :string)
    field(:cath_lv_wall_seg_func, :string)
    field(:info_coronary_id, :integer)
    field(:cath_lv_notes, :string)
    field(:aortic_pres_sys, :string)
    field(:aortic_pres_dia, :string)
    timestamps()
  end

  @doc false
  def changeset(lventricle, attrs) do
    lventricle
    |> cast(attrs, [
      :cath_lv_normal_yn,
      :cath_lv_ef_val,
      :cath_lv_ef_method,
      :cath_lv_heart_rate,
      :cath_lv_lv_pres_sys,
      :cath_lv_lv_pres_end_dias,
      :cath_lv_mvr,
      :cath_lv_rao_antero_basal,
      :cath_lv_rao_antero_lat,
      :cath_lv_rao_apical,
      :cath_lv_rao_diaphragmatic,
      :cath_lv_rao_post_basal,
      :cath_lv_lao_basal_septal,
      :cath_lv_lao_apical_septal,
      :cath_lv_lao_post_lat,
      :cath_lv_lao_inf_lat,
      :cath_lv_lao_super_lat,
      :cath_lv_wall_seg_func,
      :cath_lv_notes,
      :aortic_pres_sys,
      :aortic_pres_dia
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :lventricles_info_coronary_id_index,
      message: "Error: Record For  Cath Events  Was Inserted"
    )

    # |> validate_required([:cath_lv_normal_yn, :cath_lv_ef_val, :cath_lv_ef_method, :cath_lv_heart_rate, :cath_lv_lv_pres_sys, :cath_lv_lv_pres_end_dias, :cath_lv_mvr, :cath_lv_rao_antero_basal, :cath_lv_rao_antero_lat, :cath_lv_rao_apical, :cath_lv_rao_diaphragmatic, :cath_lv_rao_post_basal, :cath_lv_lao_basal_septal, :cath_lv_lao_apical_septal, :cath_lv_lao_post_lat, :cath_lv_lao_inf_lat, :cath_lv_lao_super_lat, :cath_lv_wall_seg_func])
  end
end
