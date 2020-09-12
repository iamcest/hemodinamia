defmodule Angio.Repo.Migrations.AlterSatsPressuresAddDistal do
  use Ecto.Migration

  def change do
 alter table(:sats_pressures) do
  add(:ao_pres_sys_distal, :string, size: 50)
  add(:ao_pres_dias_distal, :string, size: 50)
  add(:height, :string, size: 50)
  add(:weigth , :string, size: 50)
 end
  end
end
