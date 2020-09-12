defmodule Angio.Repo.Migrations.AlterCathClinicalsAddFields do
  use Ecto.Migration

  def change do
    alter table(:cath_clinicals) do
      add(:mech_lv_support_other_dt, :date)
      add(:cath_cl_iabp_start_dt, :date)
      add(:cath_cl_symptom_onset_dt, :date)
      add(:cath_cl_arrest_hypothermia_dt, :date)
      add(:cath_cl_notes, :text)
    end
  end
end
