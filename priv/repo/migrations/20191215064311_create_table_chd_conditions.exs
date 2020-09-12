defmodule Angio.Repo.Migrations.CreateTableChdConditions do
  use Ecto.Migration

  def change do
    create table(:chd_conditions) do
      add(:chd_heterotaxy_yn, :boolean, default: false, null: false)
      add(:chd_trisomy_13_yn, :boolean, default: false, null: false)
      add(:chd_rubella_prior_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_noonan_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_marfan_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_turner_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_alagille_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_digeorge_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_down_yn, :boolean, default: false, null: false)
      add(:chd_trisomy_18_yn, :boolean, default: false, null: false)
      add(:chd_syndrome_williams_yn, :boolean, default: false, null: false)
      add(:chd_diaphragm_hernia_yn, :boolean, default: false, null: false)
      add(:chd_conditions_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
