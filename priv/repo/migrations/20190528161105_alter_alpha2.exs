defmodule Angio.Repo.Migrations.AlterAlpha2 do
  use Ecto.Migration

  def change do
    alter table(:languages) do
      remove(:alpgha2)
      add(:alpha2, :string)
    end
  end
end
