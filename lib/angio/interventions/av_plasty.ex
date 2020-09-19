defmodule Angio.Interventions.Av_plasty do
  use Ecto.Schema
  import Ecto.Changeset

  schema "av_plasties" do
    field(:avp_av_ann_diam_us, :string)
    field(:avp_av_morphology, :string)
    field(:avp_av_reg_degree_pre, :string)
    field(:avp_dt, :date)
    field(:avp_notes, :string)
    field(:avp_operator_fname, :string)
    field(:avp_operator_lname, :string)
    field(:avp_operator_mname, :string)
    field(:avp_operator_npi, :string)
    field(:avp_peak_sys_gradient_pre, :string)
    field(:avp_primary_indication, :string)
    field(:avp_tm, :time)
    field(:info_coronary_id, :integer)

    has_many(
      :av_plasties_inflations,
      Angio.Interventions.Av_plasties_inflation,
      foreign_key: :av_plasty_id
    )

    timestamps()
  end

  @doc false
  def changeset(av_plasty, attrs) do
    av_plasty
    |> cast(attrs, [
      :avp_dt,
      :avp_tm,
      :avp_operator_lname,
      :avp_operator_fname,
      :avp_operator_mname,
      :avp_operator_npi,
      :avp_primary_indication,
      :avp_av_morphology,
      :avp_av_reg_degree_pre,
      :avp_av_ann_diam_us,
      :avp_peak_sys_gradient_pre,
      :avp_notes
    ])
    |> validate_required([])

    # |> validate_required([:avp_dt, :avp_tm, :avp_operator_lname, :avp_operator_fname, :avp_operator_mname, :avp_operator_npi, :avp_primary_indication, :avp_av_morphology, :avp_av_reg_degree_pre, :avp_av_ann_diam_us, :avp_peak_sys_gradient_pre, :avp_notes])
  end
end
