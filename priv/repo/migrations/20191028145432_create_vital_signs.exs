defmodule Angio.Repo.Migrations.CreateVitalSigns do
  use Ecto.Migration

  def change do
    create table(:vital_signs) do
      add :vital_sgns_dt, :date
      add :vital_sgns_tm, :time
      add :vital_sgns_bp_sys, :string
      add :vital_sgns_bp_diast, :string
      add :vital_sgns_pulse_rate, :string
      add :vital_sgns_body_temp, :string
      add :vital_sgns_respiratory_rate, :string
      add :vital_sgns_sat_val, :string
      add :vital_sgns_height, :string
      add :vital_sgns_height_lying, :string
      add :vital_sgns_weight_val, :string
      add :vital_sgns_waist_val, :string
      add :vital_sgns_head_circumference, :string
      add :vital_sgns_bmi, :string
      add :vital_sgns_notes, :text

      timestamps()
    end
  end
end
