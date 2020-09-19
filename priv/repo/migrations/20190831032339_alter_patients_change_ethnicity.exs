defmodule Angio.Repo.Migrations.AlterPatientsChangeEthnicity do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove(:patnts_ethnicity_hispanic)
      # modify :patnts_ethnicity_hispanic,  :boolean, null: false, default: false
      add(:patnts_ethnicity_hispanic, :boolean, null: false, default: false)
    end
  end
end
