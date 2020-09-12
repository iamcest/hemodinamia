defmodule Angio.Repo.Migrations.AlterTreeNativeDropTimestamps do
  use Ecto.Migration

  def change do
   alter table(:tree_native) do
    remove :updated_at
    remove :inserted_at
  end
end
end
