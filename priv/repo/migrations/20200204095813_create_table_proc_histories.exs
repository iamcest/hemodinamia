defmodule Angio.Repo.Migrations.CreateTableProcHistories do
  use Ecto.Migration

  def change do
    create table(:proc_histories) do
      add(:proch_pci_prior_dt, :date)
      add(:proch_prior_valve_interv_dt, :date)
      add(:proch_transplant_prior_yn, :boolean, default: false)
      add(:proch_pacer_prior_yn, :boolean, default: false)
      add(:proch_prior_icd_dt, :date)
      add(:proch_prior_rv_biopsy_yn, :boolean, default: false)
      add(:proc_epis_request_dt, :date)
      add(:proch_carotid_surg_stent_yn, :boolean, default: false)
      add(:proch_prior_icd_yn, :boolean, default: false)
      add(:proch_carotid_surg_stent_dt, :date)
      add(:proch_cabg_prior_dt, :date)
      add(:proch_cabg_prior_yn, :boolean, default: false)
      add(:proch_transplant_prior_dt, :date)
      add(:proch_pacer_prior_dt, :date)
      add(:proch_cardiac_surg_other_yn, :boolean, default: false)
      add(:proch_prior_rv_biopsy_dt, :date)
      add(:proch_prior_valve_interv_yn, :boolean, default: false)
      add(:proch_pci_prior_yn, :boolean, default: false)
      add(:proch_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end

    create(unique_index(:proc_histories, [:info_coronary_id]))
  end
end
