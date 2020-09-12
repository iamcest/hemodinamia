defmodule Angio.Repo.Migrations.CreateTableAsdClosures do
  use Ecto.Migration

  def change do
    create table(:asd_closures) do
      add(:asdcl_operator_lname, :string, size: 50)
      add(:asdcl_operator_fname, :string, size: 50)
      add(:asdcl_operator_mname, :string, size: 50)
      add(:asdcl_operator_npi, :string, size: 50)
      add(:asdcl_primary_indication, :string, size: 50)
      add(:asdcl_defect_not_treated, :string, size: 50)
      add(:asdcl_treat_attempted_yn, :boolean, default: false)
      add(:asdcl_total_septal_length, :string, size: 50)
      add(:asdcl_atria_septal_aneurysm_yn, :string, size: 50)
      add(:asdcl_multi_fenestrated_yn, :boolean, default: false)
      add(:asdcl_asd_size, :string, size: 50)
      add(:asdcl_bal_sizing_perfomed_yn, :boolean, default: false)
      add(:asdcl_stop_flow_performed_yn, :boolean, default: false)
      add(:asdcl_rim_meas_performed_yn, :boolean, default: false)
      add(:asdcl_aortic_rim_length, :string, size: 50)
      add(:asdcl_ivc_rim_length, :string, size: 50)
      add(:asdcl_stop_flow, :string, size: 50)
      add(:asdcl_stretch_diam_perform_yn, :boolean, default: false)
      add(:asdcl_residual_shunt_size, :string, size: 50)
      add(:asdcl_device_utilized_id, :string, size: 50)
      add(:asdcl_device_utilized_name, :string, size: 50)
      add(:asdcl_device_used_outcome, :string, size: 50)
      add(:asdcl_stretched_diam_size, :string, size: 50)
      add(:asdcl_defect_counter_assoc, :string, size: 50)
      add(:asdcl_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
