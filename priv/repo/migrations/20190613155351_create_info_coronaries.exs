defmodule Angio.Repo.Migrations.CreateInfoCoronaries do
  use Ecto.Migration

  def change do
    create table(:info_coronaries) do
      add :info_cor_diagnostic_status, :string
      add :info_cor_date, :date
      add :info_cor_arrival_dt, :date
      add :info_cor_arrival_tm, :time
      add :info_cor_start_tm, :time
      add :info_cor_end_tm, :time
      add :info_exam_num, :string, size: 50
      add :info_cor_main_reason, :string, size: 50
      add :icd10cm_code_1, :string, size: 50
      add :icd10cm_code_2, :string, size: 50
      add :icd10cm_code_3, :string, size: 50
      add :icd10cm_code_4, :string, size: 50
      add :info_cor_normal_natives_yn, :boolean, null: false, default: false
      add :info_cor_anomalies_yn, :boolean, null: false, default: false
      add :info_cor_dis_ves_num, :string, size: 50
      add :info_cor_prior_interv_yn, :boolean, null: false, default: false
      add :info_cor_grafts_yn, :boolean, null: false, default: false
      add :info_cor_grafts_dis_yn, :boolean, null: false, default: false
      add :info_cor_cabg_prior_dt, :date
      add :info_cor_grafts_implanted_num, :string, size: 50
      add :info_cor_grafts_patent_num, :string, size: 50
      add :info_cor_rx_recommend, :text
      add :info_cor_notes, :text
      add :cor_les_count, :string
      add :patient_id, references(:patients, on_delete: :delete_all)
      timestamps()
    end
  end
end
