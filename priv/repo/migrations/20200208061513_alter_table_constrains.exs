defmodule Angio.Repo.Migrations.AlterTableConstrains do
  use Ecto.Migration

  def change do
    create(unique_index(:core_histories, [:info_coronary_id]))
    create(unique_index(:infect_histories, [:info_coronary_id]))
    create(unique_index(:chd_risk_factors, [:info_coronary_id]))
  end
end
