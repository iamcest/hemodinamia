defmodule Angio.Caths.Cath_radiation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_radiations" do
    field(:car_area_product_units, :string)
    field(:car_comulative_kerma, :string)
    field(:car_dose_area_meas_method, :string)
    field(:car_dose_area_product, :string)
    field(:car_fluoro_time, :string)
    field(:car_notes, :string)
    field(:patient_id, :integer)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(cath_radiation, attrs) do
    cath_radiation
    |> cast(attrs, [
      :car_fluoro_time,
      :car_dose_area_product,
      :car_area_product_units,
      :car_dose_area_meas_method,
      :car_comulative_kerma,
      :car_notes,
      :patient_id
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :cath_radiations_info_coronary_id_index,
      message: "Error: Record For  in Radiations  Was Inserted"
    )

    #    |> validate_required([:car_fluoro_time, :car_dose_area_product, :car_area_product_units, :car_dose_area_meas_method, :car_comulative_kerma, :car_notes, :patient_id])
  end
end
