defmodule Angio.Repo.Migrations.AddConstrainsToElvsf do
  use Ecto.Migration

  def change do
    create(unique_index(:echo_ventricle_left_systolic_funcs, [:cardiac_echo_id]))
  end
end
