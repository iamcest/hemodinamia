defmodule Angio.Repo.Migrations.AlterSatPressuresNotes do
  use Ecto.Migration

  def change do
    alter table(:sats_pressures) do
      modify(:sat_pres_notes, :text)
    end
  end
end
