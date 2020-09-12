defmodule Angio.Repo.Migrations.CreateCorCollaterals do
  use Ecto.Migration

  def change do
    create table(:cor_collaterals) do
      add :collat_yn, :boolean, null: false, default: false
      add :collat_donor_seg, :string, size: 50
      add :collat_recipient_seg, :string, size: 50
      add :collat_via_seg, :string, size: 50
      add :collat_rentrop_grade, :string, size: 50
      add :collat_flow_idx_calc_yn, :boolean, null: false, default: false
      add :collat_flow_idx_method, :string, size: 50
      add :collat_flow_idx_result, :string, size: 50
      add :collat_qualitative_class, :string, size: 50
      add :collat_notes, :text
      add(:patient_id, :integer)
      add :info_coronary_id, references(:info_coronaries, on_delete: :delete_all)
      timestamps()
    end
  end
end
