defmodule Angio.Caths.Cor_collateral do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cor_collaterals" do
    field(:collat_donor_seg, :string)
    field(:collat_flow_idx_calc_yn, :boolean, default: false)
    field(:collat_flow_idx_method, :string)
    field(:collat_flow_idx_result, :string)
    field(:collat_notes, :string)
    field(:collat_qualitative_class, :string)
    field(:collat_recipient_seg, :string)
    field(:collat_rentrop_grade, :string)
    field(:collat_via_seg, :string)
    field(:collat_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)
    field(:patient_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(cor_collateral, attrs) do
    cor_collateral
    |> cast(attrs, [
      :collat_yn,
      :collat_donor_seg,
      :collat_recipient_seg,
      :collat_via_seg,
      :collat_rentrop_grade,
      :collat_flow_idx_calc_yn,
      :collat_flow_idx_method,
      :collat_flow_idx_result,
      :collat_qualitative_class,
      :collat_notes,
      :patient_id,
      :info_coronary_id
    ])
    |> validate_required([])

    # |> validate_required([|> validate_required([:collat_yn, :collat_donor_seg, :collat_recipient_seg, :collat_via_seg, :collat_rentrop_grade, :collat_flow_idx_calc_yn, :collat_flow_idx_method, :collat_flow_idx_result, :collat_qualitative_class, :collat_notes, :patient_id, :info_coronary_id])
  end
end
