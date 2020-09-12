defmodule Angio.Repo.Migrations.CreateLanguageTable do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add(:alpgha2, :string)
      add(:english, :string)
    end
  end
end
