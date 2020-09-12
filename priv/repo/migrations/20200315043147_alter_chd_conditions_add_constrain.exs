defmodule Angio.Repo.Migrations.AlterChdConditionsAddConstrain do
  use Ecto.Migration

  def change do
    create unique_index(:chd_conditions, [:info_coronary_id])
    #create unique_index(:defs_ooptions, [:defs_options_id])

  end
end
