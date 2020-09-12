defmodule Angio.Repo.Migrations.CreateTableInfectHistories do
  use Ecto.Migration

  def change do
    create table(:infect_histories) do
      add(:infh_endocarditis_yn, :boolean, null: false, default: false)
      add(:infh_hepatitis_b_yn, :boolean, null: false, default: false)
      add(:infh_pneumococcal_vacc_dt, :date)
      add(:infh_hiv_yn, :boolean, null: false, default: false)
      add(:infh_hepatitis_c_yn, :boolean, null: false, default: false)
      add(:infh_malaria_yn, :boolean, null: false, default: false)
      add(:infh_tubercolosis_yn, :boolean, null: false, default: false)
      add(:infh_influenza_vacc_dt, :date)
      add(:infh_pneumonia_yn, :boolean, null: false, default: false)
      add(:infh_influenza_vacc_yn, :boolean, null: false, default: false)
      add(:infh_endocarditis_type, :string, size: 50)
      add(:infh_pneumococcal_vacc_yn, :boolean, null: false, default: false)
      add(:infh_histories_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
