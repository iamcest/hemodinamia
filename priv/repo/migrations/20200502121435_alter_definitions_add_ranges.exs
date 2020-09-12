defmodule Angio.Repo.Migrations.AlterDefinitionsAddRanges do
  use Ecto.Migration

  def change do
    alter table(:definitions) do
      add(:upper_value, :string)
      add(:low_value, :string)
    end
  end
end
