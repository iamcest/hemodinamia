defmodule Angio.Repo.Migrations.CreateTableElectrocardiograms do
  use Ecto.Migration

  def change do
  create table(:electrocardiograms) do
 add(:ecg_dt, :date )
 add(:ecg_tm, :time)
 add(:ecg_with_symptoms_yn, :boolean, default: false)
 add(:ecg_first_tm, :time)
 add(:ecg_normal_yn, :boolean, default: false)
 add(:ecg_heart_rate, :string, size: 50)
 add(:ecg_rhythm, :string, size: 50)
 add(:ecg_p_duration_val, :string, size: 50)
 add(:ecg_pr_interval_val, :string, size: 50)
 add(:ecg_qrs_duration_val, :string, size: 50)
 add(:ecg_qtc_long_yn, :boolean, default: false)
 add(:ecg_st_depression_yn, :boolean, default: false)
 add(:ecg_st_elevation_yn, :boolean, default: false)
 add(:ecg_st_with_symptoms, :string, size: 50)
 add(:ecg_inverted_t_waves_yn, :boolean, default: false)
 add(:ecg_t_with_symptoms, :string, size: 50)
 add(:ecg_pathological_q_yn, :boolean, default: false)
 add(:ecg_infarct_pattern_yn, :boolean, default: false)
 add(:ecg_infarct_pattern_location, :string, size: 50)
 add(:ecg_lv_hypertrophy, :string, size: 50)
 add(:ecg_rv_hypertrophy_yn, :boolean, default: false)
 add(:ecg_av_conduction, :string, size: 50)
 add(:ecg_lbbb, :string, size: 50)
 add(:ecg_rbbb_yn, :boolean, default: false)
 add(:ecg_epsilon_wave_yn, :boolean, default: false)
 add(:ecg_notes, :text)
 add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
 timestamps()

   end
  end
end
