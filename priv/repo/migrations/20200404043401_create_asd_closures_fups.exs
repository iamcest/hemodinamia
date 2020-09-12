defmodule Angio.Repo.Migrations.CreateAsdClosuresFups do
  use Ecto.Migration

  def change do
    create table(:asd_closures_fups) do
      add :asdclf_assessment_dt, :date
      add :asdclf_start_dt, :date
      add :asdclf_fup_status, :string
      add :asdclf_visit_status, :string
      add :asdclf_free_events_yn, :boolean, default: false, null: false
      add :asdclf_residual_shunt_size, :string
      add :asdclf_frame_fracture_yn, :boolean, default: false, null: false
      add :asdclf_sbe_yn, :boolean, default: false, null: false
      add :asdclf_sbe_diagnosis_dt, :date
      add :asdclf_sbe_factors, :string
      add :asdclf_erosion_yn, :boolean, default: false, null: false
      add :asdclf_sbe_treatment, :string
      add :asdclf_embolization_yn, :boolean, default: false, null: false
      add :asdclf_retrivied_surgery_yn, :boolean, default: false, null: false
      add :asdclf_reintervention_closure_yn, :string
      add :asdclf_reintervention_closure_dt, :date
      add :asdclf_new_headaches_yn, :boolean, default: false, null: false
      add :asdclf_arrhythmias_yn, :boolean, default: false, null: false
      add :asdclf_anti_platelet_yn, :boolean, default: false, null: false
      add :asdclf_notes, :text

      timestamps()
    end

  end
end
