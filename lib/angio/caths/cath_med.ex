defmodule Angio.Caths.Cath_med do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cath_meds" do
    field(:cmed_atropine_yn, :boolean, default: false)
    field(:cmed_antiarrhythmics_yn, :boolean, default: false)
    field(:cmed_ca_channel_pre_yn, :boolean, default: false)
    field(:cmed_gp_iib_iiia_yn, :boolean, default: false)
    field(:cmed_ranolazine_yn, :boolean, default: false)
    field(:cmed_inotrops_yn, :boolean, default: false)
    field(:cmed_bblocker_yn, :boolean, default: false)
    field(:cmed_statin_yn, :boolean, default: false)
    field(:cmed_lmwh_yn, :boolean, default: false)
    field(:cmed_pde_inhibitor_yn, :boolean, default: false)
    field(:cmed_direct_thrombin, :string)
    field(:cmed_anticoagulants_yn, :boolean, default: false)
    field(:cmed_anti_anginal_other_yn, :boolean, default: false)
    field(:cmed_ufh_dose, :string)
    field(:cmed_lytics_bolus_tm, :time)
    field(:cmed_no_statin_agent_yn, :boolean, default: false)
    field(:cmed_ufh_yn, :boolean, default: false)
    field(:cmed_thienopyridines, :string)
    field(:cmed_anti_anginal_yn, :boolean, default: false)
    field(:cmed_nitrates_long_act_yn, :boolean, default: false)
    field(:cmed_vaso_dilators_yn, :boolean, default: false)
    field(:cmed_lytics_bolus_dt, :date)
    field(:cmed_antiplatelets_yn, :boolean, default: false)
    field(:cmed_notes, :string)
    field(:cmed_arb_yn, :boolean, default: false)
    field(:cmed_xa_inhibitors, :string)
    field(:cmed_ace_yn, :boolean, default: false)
    field(:cmed_antihypertensives_yn, :boolean, default: false)
    field(:cmed_lytics_yn, :boolean, default: false)
    field(:cmed_aspirin_yn, :boolean, default: false)
    field(:cmed_medications_other_yn, :boolean, default: false)
    field(:cmed_prostaglandins_yn, :boolean, default: false)
    field(:cmed_diuretics_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(cath_med, attrs) do
    cath_med
    |> cast(attrs, [
      :cmed_anti_anginal_yn,
      :cmed_anti_anginal_other_yn,
      :cmed_antiarrhythmics_yn,
      :cmed_anticoagulants_yn,
      :cmed_antihypertensives_yn,
      :cmed_antiplatelets_yn,
      :cmed_aspirin_yn,
      :cmed_atropine_yn,
      :cmed_bblocker_yn,
      :cmed_ca_channel_pre_yn,
      :cmed_direct_thrombin,
      :cmed_diuretics_yn,
      :cmed_gp_iib_iiia_yn,
      :cmed_inotrops_yn,
      :cmed_lytics_bolus_dt,
      :cmed_lytics_bolus_tm,
      :cmed_lytics_yn,
      :cmed_pde_inhibitor_yn,
      :cmed_prostaglandins_yn,
      :cmed_vaso_dilators_yn,
      :cmed_nitrates_long_act_yn,
      :cmed_ranolazine_yn,
      :cmed_ufh_yn,
      :cmed_ufh_dose,
      :cmed_lmwh_yn,
      :cmed_thienopyridines,
      :cmed_xa_inhibitors,
      :cmed_ace_yn,
      :cmed_arb_yn,
      :cmed_statin_yn,
      :cmed_no_statin_agent_yn,
      :cmed_medications_other_yn,
      :cmed_notes
    ])
    |> validate_required([])

    # |> validate_required([:cmed_anti_anginal_yn, :cmed_anti_anginal_other_yn, :cmed_antiarrhythmics_yn, :cmed_anticoagulants_yn, :cmed_antihypertensives_yn, :cmed_antiplatelets_yn, :cmed_aspirin_yn, :cmed_atropine_yn, :cmed_bblocker_yn, :cmed_ca_channel_pre_yn, :cmed_direct_thrombin, :cmed_diuretics_yn, :cmed_gp_iib_iiia_yn, :cmed_inotrops_yn, :cmed_lytics_bolus_dt, :cmed_lytics_bolus_tm, :cmed_lytics_yn, :cmed_pde_inhibitor_yn, :cmed_prostaglandins_yn, :cmed_vaso_dilators_yn, :cmed_nitrates_long_act_yn, :cmed_ranolazine_yn, :cmed_ufh_yn, :cmed_ufh_dose, :cmed_lmwh_yn, :cmed_thienopyridines, :cmed_xa_inhibitors, :cmed_ace_yn, :cmed_arb_yn, :cmed_statin_yn, :cmed_no_statin_agent_yn, :cmed_medications_other_yn, :cmed_notes])
  end
end
