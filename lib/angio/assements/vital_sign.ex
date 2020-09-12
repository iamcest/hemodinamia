defmodule Angio.Assements.Vital_sign do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vital_signs" do
    field(:vital_sgns_bmi, :string)
    field(:vital_sgns_body_temp, :string)
    field(:vital_sgns_bp_diast, :string)
    field(:vital_sgns_bp_sys, :string)
    field(:vital_sgns_dt, :date)
    field(:vital_sgns_head_circumference, :string)
    field(:vital_sgns_height, :string)
    field(:vital_sgns_height_lying, :string)
    field(:vital_sgns_notes, :string)
    field(:vital_sgns_pulse_rate, :string)
    field(:vital_sgns_respiratory_rate, :string)
    field(:vital_sgns_sat_val, :string)
    field(:vital_sgns_tm, :time)
    field(:vital_sgns_waist_val, :string)
    field(:vital_sgns_weight_val, :string)
    field(:patient_id, :integer)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(vital_sign, attrs) do
    vital_sign
    |> cast(attrs, [
      :vital_sgns_dt,
      :vital_sgns_tm,
      :vital_sgns_bp_sys,
      :vital_sgns_bp_diast,
      :vital_sgns_pulse_rate,
      :vital_sgns_body_temp,
      :vital_sgns_respiratory_rate,
      :vital_sgns_sat_val,
      :vital_sgns_height,
      :vital_sgns_height_lying,
      :vital_sgns_weight_val,
      :vital_sgns_waist_val,
      :vital_sgns_head_circumference,
      :vital_sgns_bmi,
      :vital_sgns_notes,
      :patient_id,
      :info_coronary_id
    ])
    |> validate_required([])

    # |> validate_required([:vital_sgns_dt, :vital_sgns_tm, :vital_sgns_bp_sys, :vital_sgns_bp_diast, :vital_sgns_pulse_rate, :vital_sgns_body_temp, :vital_sgns_respiratory_rate, :vital_sgns_sat_val, :vital_sgns_height, :vital_sgns_height_lying, :vital_sgns_weight_val, :vital_sgns_waist_val, :vital_sgns_head_circumference, :vital_sgns_bmi, :vital_sgns_notes])
  end
end
