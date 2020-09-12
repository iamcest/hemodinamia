defmodule Angio.Repo.Migrations.CreateCathLventricles do
  use Ecto.Migration

  def change do
    create table(:lventricles) do
      add :cath_lv_normal_yn, :boolean, default: false, null: false
      add :cath_lv_ef_val, :string, size: 50
      add :cath_lv_ef_method, :string, size: 50
      add :cath_lv_heart_rate, :string, size: 50
      add :cath_lv_lv_pres_sys, :string, size: 50
      add :cath_lv_lv_pres_end_dias, :string, size: 50
      add :cath_lv_mvr, :string, size: 50
      add :cath_lv_rao_antero_basal, :string, size: 50
      add :cath_lv_rao_antero_lat, :string, size: 50
      add :cath_lv_rao_apical, :string, size: 50
      add :cath_lv_rao_diaphragmatic, :string, size: 50
      add :cath_lv_rao_post_basal, :string, size: 50
      add :cath_lv_lao_basal_septal, :string, size: 50
      add :cath_lv_lao_apical_septal, :string, size: 50
      add :cath_lv_lao_post_lat, :string, size: 50
      add :cath_lv_lao_inf_lat, :string, size: 50
      add :cath_lv_lao_super_lat, :string, size: 50
      add :cath_lv_wall_seg_func, :string, size: 50
      add :info_coronary_id, references(:info_coronaries, on_delete: :delete_all)
      timestamps()
    end
  end
end
