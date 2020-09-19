defmodule Angio.Repo.Migrations.AlterLventriclesAddAoPressures do
  use Ecto.Migration

  def change do
    alter table(:lventricles) do
      add(:aortic_pres_sys, :string)
      add(:aortic_pres_dia, :string)
    end
  end
end
