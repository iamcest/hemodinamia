defmodule Angio.Repo.Migrations.CreateTableChdCareEpisodes do
  use Ecto.Migration

  def change do
    create table(:chd_care_episodes) do
      add(:chd_episode_notes, :text)
      add(:chd_arrival_dt, :date)
      add(:uni_insurance, :string, size: 50)
      add(:uni_insurance_non_us, :boolean)
      add(:uni_hic_num, :string, size: 50)
      add(:chd_pt_international_yn, :boolean)
      add(:chd_country_of_residence, :string, size: 50)
      add(:chd_caths_prior_yn, :boolean)
      add(:chd_caths_prior_num, :string, size: 10)
      add(:chd_cath_prior_recent_dt, :date)
      add(:chd_cath_proc_recent_id, {:array, :string})
      add(:chd_cath_proc_recent_1_id, :string, size: 50)
      add(:chd_cath_proc_recent_2_id, :string, size: 50)
      add(:chd_cath_proc_recent_3_id, :string, size: 50)
      add(:chd_cath_proc_recent_4_id, :string, size: 50)
      add(:chd_premature_birth_yn, :boolean)
      add(:chd_weight_at_birth, :string, size: 10)
      add(:chd_gestational_age, :string, size: 10)
      add(:chd_surg_prior_yn, :boolean)
      add(:chd_surg_prior_num, :string, size: 10)
      add(:chd_surg_recent_dt, :date)
      add(:chd_surg_prior_id, {:array, :string})
      add(:chd_surg_prior_1_id, :string, size: 50)
      add(:chd_surg_prior_2_id, :string, size: 50)
      add(:chd_surg_prior_3_id, :string, size: 50)
      add(:chd_surg_prior_4_id, :string, size: 50)
      add(:chd_research_study_yn, :boolean)
      add(:pt_restriction_yn, :boolean)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
