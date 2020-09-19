defmodule Angio.Repo.Migrations.AddConstrainsToEcho do
  use Ecto.Migration

  def change do
    create(unique_index(:echo_left_atriums, [:cardiac_echo_id]))
    create(unique_index(:echo_right_atriums, [:cardiac_echo_id]))
    create(unique_index(:echo_ventricle_lefts, [:cardiac_echo_id]))
  end
end
