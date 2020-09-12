defmodule Angio.Repo.Migrations.AlterVitalSignsAddRelation do
  use Ecto.Migration

  def change do
    alter table(:vital_signs) do
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
    end

    drop_if_exists(table(:vital_sighns))
  end
end
