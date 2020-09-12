defmodule Angio.Repo.Migrations.CreateTableSocialHistories do
  use Ecto.Migration

  def change do
  create table(:social_histories) do
  add(:soh_alcohol_depend, :string, size: 50)
  add(:soh_alcohol_depend_amount, :string, size: 50)
  add(:soh_employ_status, :string, size: 50)
  add(:soh_sleep_apnea_yn, :boolean, default: false)
  add(:soh_depressed_mood_yn, :boolean, default: false)
  add(:soh_illicit_drug_yn, :boolean, default: false)
  add(:soh_erectile_dysfunc_yn, :boolean, default: false)
  add(:soh_life_expect_1yr_yn, :boolean, default: false)
  add(:soh_sleep_apnea_on_cpap_yn, :boolean, default: false)
  add(:soh_marital_status, :string, size: 50)
  add(:soh_education_level, :string, size: 50)
 add(:soh_notes, :text)
 add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
 timestamps()
  end
create unique_index(:social_histories, [:info_coronary_id])

  end
end
