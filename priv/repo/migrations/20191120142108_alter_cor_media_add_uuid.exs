defmodule Angio.Repo.Migrations.AlterCorMediaAddUuid do
  use Ecto.Migration

  def change do
    alter table(:cor_mediae) do
      add(:uuid, :string)
    end
  end
end
