defmodule Angio.Repo.Migrations.CreateCountriesTable do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add(:value_id, :string, size: 10)
      add(:value, :string, size: 64)
    end
  end
end
