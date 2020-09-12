defmodule Angio.Repo.Migrations.AlterSatPressuresAddTimeStamps do
  use Ecto.Migration

  def change do
    alter table(:sats_pressures) do
      timestamps()
    end
  end
end
