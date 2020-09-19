defmodule Angio.Repo.Migrations.CreateCathMeds do
  use Ecto.Migration

  def change do
    create table(:cath_meds) do
      add(:cmed_anti_anginal_yn, :boolean, default: false, null: false)
      add(:cmed_anti_anginal_other_yn, :boolean, default: false, null: false)
      add(:cmed_antiarrhythmics_yn, :boolean, default: false, null: false)
      add(:cmed_anticoagulants_yn, :boolean, default: false, null: false)
      add(:cmed_antihypertensives_yn, :boolean, default: false, null: false)
      add(:cmed_antiplatelets_yn, :boolean, default: false, null: false)
      add(:cmed_aspirin_yn, :boolean, default: false, null: false)
      add(:cmed_atropine_yn, :boolean, default: false, null: false)
      add(:cmed_bblocker_yn, :boolean, default: false, null: false)
      add(:cmed_ca_channel_pre_yn, :boolean, default: false, null: false)
      add(:cmed_direct_thrombin, :string, size: 50)
      add(:cmed_diuretics_yn, :boolean, default: false, null: false)
      add(:cmed_gp_iib_iiia_yn, :boolean, default: false, null: false)
      add(:cmed_inotrops_yn, :boolean, default: false, null: false)
      add(:cmed_lytics_bolus_dt, :date)
      add(:cmed_lytics_bolus_tm, :time)
      add(:cmed_lytics_yn, :boolean, default: false, null: false)
      add(:cmed_pde_inhibitor_yn, :boolean, default: false, null: false)
      add(:cmed_prostaglandins_yn, :boolean, default: false, null: false)
      add(:cmed_vaso_dilators_yn, :boolean, default: false, null: false)
      add(:cmed_nitrates_long_act_yn, :boolean, default: false, null: false)
      add(:cmed_ranolazine_yn, :boolean, default: false, null: false)
      add(:cmed_ufh_dose, :string, size: 50)
      add(:cmed_ufh_yn, :boolean, default: false, null: false)
      add(:cmed_thienopyridines, :string, size: 50)
      add(:cmed_xa_inhibitors, :string, size: 50)
      add(:cmed_ace_yn, :boolean, default: false, null: false)
      add(:cmed_arb_yn, :boolean, default: false, null: false)
      add(:cmed_statin_yn, :boolean, default: false, null: false)
      add(:cmed_no_statin_agent_yn, :boolean, default: false, null: false)
      add(:cmed_lmwh_yn, :boolean, default: false, null: false)
      add(:cmed_medications_other_yn, :boolean, default: false, null: false)
      add(:cmed_meds_select, :string, size: 50)
      add(:cmed_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
