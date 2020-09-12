defmodule Angio.Repo.Migrations.AlterTableAvPlastiesAddReletionToInfoCor do
  use Ecto.Migration

  def change do
    alter table(:av_plasties) do
    add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
    end
  end
end
