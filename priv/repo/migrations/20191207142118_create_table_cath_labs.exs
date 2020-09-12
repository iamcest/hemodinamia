defmodule Angio.Repo.Migrations.CreateTableCathLabs do
  use Ecto.Migration

  def change do
    create table(:cath_labs) do
      add(:cath_hb_pre_val, :string, size: 10)
      add(:cath_hb_pre_na, :boolean, null: false, default: false)
      add(:cath_hb_post_val, :string, size: 10)
      add(:cath_hb_post_lowest_val, :string, size: 10)
      add(:cath_hb_post_na, :boolean, null: false, default: false)

      add(:cath_biomarker_positive_post_yn, :boolean, null: false, default: false)
      add(:cath_ck_pre_normal_ckmb_pre_na, :boolean, null: false, default: false)
      add(:cath_ck_post_normal_ckmb_na, :boolean, null: false, default: false)

      add(:cath_ckmb_pre_val, :boolean, null: false, default: false)
      add(:cath_ckmb_pre_na, :boolean, null: false, default: false)
      add(:cath_ckmb_post_val, :string, size: 10)
      add(:cath_ckmb_peak_post_na, :boolean, null: false, default: false)

      add(:cath_tropo_t_pre_val, :string, size: 10)
      add(:cath_tropo_t_pre_na, :boolean, null: false, default: false)
      add(:cath_tropo_t_peak_post_val, :string, size: 10)
      add(:cath_tropo_t_peak_post_na, :boolean, null: false, default: false)

      add(:cath_tropo_i_pre_val, :string, size: 10)
      add(:cath_tropo_i_pre_na, :boolean, null: false, default: false)
      add(:cath_tropo_i_peak_post_val, :string, size: 10)
      add(:cath_tropo_i_peak_post_na, :boolean, null: false, default: false)

      add(:cath_creatinine_pre_val, :string, size: 10)
      add(:cath_creatinine_pre_na, :boolean, null: false, default: false)
      add(:cath_creatinine_highest_val, :string, size: 10)
      add(:cath_creatinine_highest_na, :boolean, null: false, default: false)
      add(:cath_creatinine_post_val, :string, size: 10)
      add(:cath_creatinine_post_na, :boolean, null: false, default: false)
      add(:cath_creatinine_pre_discharge, :string, size: 10)
      add(:cath_creatinine_pre_discharge_na, :boolean, null: false, default: false)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
