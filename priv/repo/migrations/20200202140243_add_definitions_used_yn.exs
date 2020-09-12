defmodule Angio.Repo.Migrations.AddDefinitionsUsedYn do
  use Ecto.Migration

  def change do
    alter table(:definitions) do
      add(:used_yn, :boolean, default: false, null: false)
    end
  end
end
