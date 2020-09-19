defmodule Angio.Interventions.Pci_procedure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pci_procedures" do
    field(:pci_proc_syndax_score, :string)
    field(:pci_proc_notes, :string)
    field(:pci_proc_50pct_rca_yn, :boolean, default: false)
    field(:pci_proc_operator_mname, :string)
    field(:pci_proc_status, :string)
    field(:pci_proc_stents_implanted_num, :string)
    field(:pci_proc_contrast_volume, :string)
    field(:pci_proc_50pct_lm_yn, :boolean, default: false)
    field(:pci_proc_device_deployed_yn, :boolean, default: false)
    field(:pci_proc_lab_out_tm, :time)
    field(:pci_proc_fluoro_dose, :string)
    field(:pci_proc_lv_ef_pre_val, :string)
    field(:pci_proc_operator_npi, :string)
    field(:pci_proc_surg_consult_yn, :boolean, default: false)
    field(:pci_proc_multivessel_yn, :boolean, default: false)
    field(:pci_proc_stents_used_num, :string)
    field(:pci_proc_closure_device, :string)
    field(:pci_proc_lab_arrive_tm, :time)
    field(:pci_proc_50pct_graft_yn, :boolean, default: false)
    field(:pci_proc_status_stemi, :string)
    field(:pci_proc_fluoro_tm, :string)
    field(:pci_proc_lv_ef_pre_na, :boolean, default: false)
    field(:pci_proc_stemi_onset_dt, :date)
    field(:pci_proc_dev_first_activ_tm, :time)
    field(:pci_proc_stemi_onset_tm, :time)
    field(:pci_proc_device_first_activ_dt, :date)
    field(:pci_proc_status_acs, :string)
    field(:pci_proc_operator_lname, :string)
    field(:pci_proc_machine_id, :string)
    field(:pci_proc_50pct_lcx_yn, :boolean, default: false)
    field(:pci_proc_les_attempt_num, :string)
    field(:pci_proc_entry, :string)
    field(:pci_proc_ballons_used_num, :string)
    field(:pci_proc_primary_transfer_yn, :boolean, default: false)
    field(:pci_proc_indication, :string)
    field(:pci_proc_les_treated_num, :string)
    field(:pci_proc_success_yn, :boolean, default: false)
    field(:pci_proc_lab_arrive_dt, :date)
    field(:pci_proc_operator_fname, :string)
    field(:pci_proc_lab_num, :string)
    field(:pci_proc_50pct_lad_yn, :boolean, default: false)
    field(:pci_proc_surg_consult, :string)
    field(:pci_proc_multivessel_result, :string)
    field(:info_coronary_id, :integer)

    has_many(
      :pci_lesions,
      Angio.Interventions.Pci_lesion,
      foreign_key: :pci_procedure_id
    )

    timestamps()
  end

  @doc false
  def changeset(pci_procedure, attrs) do
    pci_procedure
    |> cast(attrs, [
      :pci_proc_operator_lname,
      :pci_proc_operator_fname,
      :pci_proc_operator_mname,
      :pci_proc_operator_npi,
      :pci_proc_machine_id,
      :pci_proc_lab_num,
      :pci_proc_lab_arrive_dt,
      :pci_proc_lab_arrive_tm,
      :pci_proc_lab_out_tm,
      :pci_proc_indication,
      :pci_proc_status,
      :pci_proc_success_yn,
      :pci_proc_les_attempt_num,
      :pci_proc_les_treated_num,
      :pci_proc_ballons_used_num,
      :pci_proc_stents_used_num,
      :pci_proc_stents_implanted_num,
      :pci_proc_multivessel_result,
      :pci_proc_primary_transfer_yn,
      :pci_proc_stemi_onset_dt,
      :pci_proc_stemi_onset_tm,
      :pci_proc_status_stemi,
      :pci_proc_status_acs,
      :pci_proc_surg_consult_yn,
      :pci_proc_syndax_score,
      :pci_proc_device_deployed_yn,
      :pci_proc_dev_first_activ_tm,
      :pci_proc_device_first_activ_dt,
      :pci_proc_multivessel_yn,
      :pci_proc_lv_ef_pre_val,
      :pci_proc_lv_ef_pre_na,
      :pci_proc_surg_consult,
      :pci_proc_fluoro_tm,
      :pci_proc_fluoro_dose,
      :pci_proc_entry,
      :pci_proc_closure_device,
      :pci_proc_contrast_volume,
      :pci_proc_50pct_lm_yn,
      :pci_proc_50pct_lad_yn,
      :pci_proc_50pct_lcx_yn,
      :pci_proc_50pct_rca_yn,
      :pci_proc_50pct_graft_yn,
      :pci_proc_notes
    ])
    |> validate_required([])

    # |> validate_required([:pci_proc_operator_lname, :pci_proc_operator_fname, :pci_proc_operator_mname, :pci_proc_operator_npi, :pci_proc_machine_id, :pci_proc_lab_num, :pci_proc_lab_arrive_dt, :pci_proc_lab_arrive_tm, :pci_proc_lab_out_tm, :pci_proc_indication, :pci_proc_status, :pci_proc_success_yn, :pci_proc_les_attempt_num, :pci_proc_les_treated_num, :pci_proc_ballons_used_num, :pci_proc_stents_used_num, :pci_proc_stents_implanted_num, :pci_proc_multivessel_result, :pci_proc_primary_transfer_yn, :pci_proc_stemi_onset_dt, :pci_proc_stemi_onset_tm, :pci_proc_status_stemi, :pci_proc_status_acs, :pci_proc_surg_consult_yn, :pci_proc_syndax_score, :pci_proc_device_deployed_yn, :pci_proc_dev_first_activ_tm, :pci_proc_device_first_activ_dt, :pci_proc_multivessel_yn, :pci_proc_lv_ef_pre_val, :pci_proc_lv_ef_pre_na, :pci_proc_surg_consult, :pci_proc_fluoro_tm, :pci_proc_fluoro_dose, :pci_proc_entry, :pci_proc_closure_device, :pci_proc_contrast_volume, :pci_proc_50pct_lm_yn, :pci_proc_50pct_lad_yn, :pci_proc_50pct_lcx_yn, :pci_proc_50pct_rca_yn, :pci_proc_50pct_graft_yn, :pci_proc_notes])
  end
end
