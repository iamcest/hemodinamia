defmodule Angio.Congenitals.Chd_condition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chd_conditions" do
    field(:chd_conditions_notes, :string)
    field(:chd_diaphragm_hernia_yn, :boolean, default: false)
    field(:chd_heterotaxy_yn, :boolean, default: false)
    field(:chd_rubella_prior_yn, :boolean, default: false)
    field(:chd_syndrome_alagille_yn, :boolean, default: false)
    field(:chd_syndrome_digeorge_yn, :boolean, default: false)
    field(:chd_syndrome_down_yn, :boolean, default: false)
    field(:chd_syndrome_marfan_yn, :boolean, default: false)
    field(:chd_syndrome_noonan_yn, :boolean, default: false)
    field(:chd_syndrome_turner_yn, :boolean, default: false)
    field(:chd_syndrome_williams_yn, :boolean, default: false)
    field(:chd_trisomy_13_yn, :boolean, default: false)
    field(:chd_trisomy_18_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(chd_condition, attrs) do
    chd_condition
    |> cast(attrs, [
      :chd_heterotaxy_yn,
      :chd_rubella_prior_yn,
      :chd_syndrome_noonan_yn,
      :chd_syndrome_marfan_yn,
      :chd_syndrome_turner_yn,
      :chd_syndrome_alagille_yn,
      :chd_syndrome_digeorge_yn,
      :chd_syndrome_down_yn,
      :chd_trisomy_13_yn,
      :chd_trisomy_18_yn,
      :chd_syndrome_williams_yn,
      :chd_diaphragm_hernia_yn,
      :chd_conditions_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
    name: :chd_conditions_info_coronary_id_index,
    message: "Error: Record For  the table  Congentital Conditions Was already Inserted"
     )


    # |> validate_required([:chd_heterotaxy_yn, :chd_rubella_prior_yn, :chd_syndrome_noonan_yn, :chd_syndrome_marfan_yn, :chd_syndrome_turner_yn, :chd_syndrome_alagille_yn, :chd_syndrome_digeorge_yn, :chd_syndrome_down_yn, :chd_trisomy_13_yn, :chd_trisomy_18_yn, :chd_syndrome_williams_yn, :chd_diaphragm_hernia_yn, :chd_conditions_notes])
  end
end
