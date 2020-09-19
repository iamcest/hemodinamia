defmodule Angio.Repo.Migrations.AlterCorLesionsOstialLoc do
  use Ecto.Migration

  def change do
    alter table(:cor_lesions) do
      remove(:cor_les_ostial_loc)
      add(:cor_les_ostial_loc_yn, :boolean, null: false, default: false)
      remove(:cor_les_prior_treated_other)
      add(:cor_les_prior_treated_other, :string, size: 50)
    end
  end
end
