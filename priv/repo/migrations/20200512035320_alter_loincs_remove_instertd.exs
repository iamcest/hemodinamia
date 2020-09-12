defmodule Angio.Repo.Migrations.AlterLoincsRemoveInstertd do
  use Ecto.Migration

  def change do
    alter table(:loincs) do
      remove(:inserted_at)
      remove(:updated_at)
    end
  end
end
