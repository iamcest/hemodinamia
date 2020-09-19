defmodule Angio.Repo.Migrations.AlterCareEpisodesAddConstrains do
  use Ecto.Migration

  def change do
    # create unique_index(:care_episodes, [:info_coronary_id])
    create(unique_index(:proc_episodes, [:info_coronary_id]))
    create(unique_index(:cath_radiations, [:info_coronary_id]))
    create(unique_index(:cath_events, [:info_coronary_id]))
    create(unique_index(:lventricles, [:info_coronary_id]))
    create(unique_index(:cor_anatomies, [:info_coronary_id]))
    create(unique_index(:cath_clinicals, [:info_coronary_id]))
    create(unique_index(:cath_labs, [:info_coronary_id]))
  end
end
