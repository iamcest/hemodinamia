defmodule Angio.Histories.Proc_history do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proc_histories" do
    # field(:"", :date)
    field(:proc_epis_request_dt, :date)
    field(:proch_cabg_prior_dt, :date)
    field(:proch_cabg_prior_yn, :boolean, default: false)
    field(:proch_cardiac_surg_other_yn, :boolean, default: false)
    field(:proch_carotid_surg_stent_dt, :date)
    field(:proch_carotid_surg_stent_yn, :boolean, default: false)
    field(:proch_notes, :string)
    field(:proch_pacer_prior_dt, :date)
    field(:proch_pacer_prior_yn, :boolean, default: false)
    field(:proch_pci_prior_dt, :date)
    field(:proch_pci_prior_yn, :boolean, default: false)
    field(:proch_prior_icd_dt, :date)
    field(:proch_prior_icd_yn, :boolean, default: false)
    field(:proch_prior_rv_biopsy_dt, :date)
    field(:proch_prior_rv_biopsy_yn, :boolean, default: false)
    field(:proch_prior_valve_interv_dt, :date)
    field(:proch_prior_valve_interv_yn, :boolean, default: false)
    field(:proch_transplant_prior_dt, :date)
    field(:proch_transplant_prior_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(proc_history, attrs) do
    proc_history
    |> cast(attrs, [
      :proch_pci_prior_yn,
      :proch_pci_prior_dt,
      :proch_prior_valve_interv_yn,
      :proch_prior_valve_interv_dt,
      :proch_transplant_prior_yn,
      :proch_transplant_prior_dt,
      :proch_pacer_prior_yn,
      :proch_pacer_prior_dt,
      :proch_prior_icd_yn,
      :proch_prior_icd_dt,
      :proch_prior_rv_biopsy_yn,
      :proch_prior_rv_biopsy_dt,
      :proch_carotid_surg_stent_yn,
      :proch_carotid_surg_stent_dt,
      :proch_cabg_prior_yn,
      :proch_cabg_prior_dt,
      :proch_cardiac_surg_other_yn,
      :proch_notes,
      :proc_epis_request_dt
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :proc_histories_info_coronary_id_index,
      message: "Error: Record For  in table  Procedures History Was completed"
    )

    # |> validate_required([:proch_pci_prior_yn, :proch_pci_prior_dt, :proch_prior_valve_interv_yn, :proch_prior_valve_interv_dt, :proch_transplant_prior_yn, :proch_transplant_prior_dt, :proch_pacer_prior_yn, :proch_pacer_prior_dt, :proch_prior_icd_yn, :proch_prior_icd_dt, :proch_prior_rv_biopsy_yn, :proch_prior_rv_biopsy_dt, :proch_carotid_surg_stent_yn, :proch_carotid_surg_stent_dt, :proch_cabg_prior_yn, :proch_cabg_prior_dt, :proch_cardiac_surg_other_yn, :proch_notes, :"", :proc_epis_request_dt, :""])
  end
end
