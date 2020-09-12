defmodule Angio.Repo.Migrations.CreateCathRadiations do
  use Ecto.Migration

  def change do
    create table(:cath_radiations) do
      add :car_area_product_units, :string
      add :car_comulative_kerma, :string
      add :car_dose_area_meas_method, :string
      add :car_dose_area_product, :string
      add :car_fluoro_time, :string
      add :car_notes, :text
      add :patient_id, :integer
      add :info_coronary_id, references(:info_coronaries, on_delete: :delete_all)
      timestamps()
    end
  end
end
