defmodule Angio.Repo.Migrations.CreatePciProcedures do
  use Ecto.Migration

  def change do
    create table(:pci_procedures) do
      add :pci_proc_operator_lname, :string
  end
      add :pci_proc_operator_fname, :string
      add :pci_proc_operator_mname, :string
      add :pci_proc_operator_npi, :string
      add :pci_proc_machine_id, :string
      add :pci_proc_lab_num, :string
      add :pci_proc_lab_arrive_dt, :date
      add :pci_proc_lab_arrive_tm, :time
      add :pci_proc_lab_out_tm, :time
      add :pci_proc_indication, :string
      add :pci_proc_status, :string
      add :pci_proc_success_yn, :boolean, default: false, null: false
      add :pci_proc_les_attempt_num, :string
      add :pci_proc_les_treated_num, :string
      add :pci_proc_ballons_used_num, :string
      add :pci_proc_stents_used_num, :string
      add :pci_proc_stents_implanted_num, :string
      add :pci_proc_multivessel_result, :string
      add :pci_proc_primary_transfer_yn, :boolean, default: false, null: false
      add :pci_proc_stemi_onset_dt, :date
      add :pci_proc_stemi_onset_tm, :time
      add :pci_proc_status_stemi, :string
      add :pci_proc_status_acs, :string
      add :pci_proc_surg_consult_yn, :boolean, default: false, null: false
      add :pci_proc_syndax_score, :string
      add :pci_proc_device_deployed_yn, :boolean, default: false, null: false
      add :pci_proc_dev_first_activ_tm, :time
      add :pci_proc_device_first_activ_dt, :date
      add :pci_proc_multivessel_yn, :boolean, default: false, null: false
      add :pci_proc_lv_ef_pre_val, :string
      add :pci_proc_lv_ef_pre_na, :boolean, default: false, null: false
      add :pci_proc_surg_consult, :string
      add :pci_proc_fluoro_tm, :string
      add :pci_proc_fluoro_dose, :string
      add :pci_proc_entry, :string
      add :pci_proc_closure_device, :string
      add :pci_proc_contrast_volume, :string
      add :pci_proc_50pct_lm_yn, :boolean, default: false, null: false
      add :pci_proc_50pct_lad_yn, :boolean, default: false, null: false
      add :pci_proc_50pct_lcx_yn, :boolean, default: false, null: false
      add :pci_proc_50pct_rca_yn, :boolean, default: false, null: false
      add :pci_proc_50pct_graft_yn, :boolean, default: false, null: false
      add :pci_proc_notes, :text

      timestamps()
    end

  end
end
