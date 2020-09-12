defmodule Angio.Repo.Migrations.CreateEchoRightAtriums do
  use Ecto.Migration

  def change do
    create table(:echo_right_atriums) do
      add(:era_si_diameter_val, :string)
      add(:era_ml_diameter_val, :string)
      add(:era_max_diameter_val, :string)
      add(:era_area_val, :string)
      add(:era_size_volume_desc, :string)
      add(:era_volume_val, :string)
      add(:era_size_volume_method, :string)
      add(:era_coronary_sinus_dilated_yn, :boolean, default: false, null: false)
      add(:era_eustachian_prominent_yn, :boolean, default: false, null: false)
      add(:era_chiari_prominent_yn, :boolean, default: false, null: false)
      add(:era_septum_bowed_left_yn, :boolean, default: false, null: false)
      add(:era_thrombus_tumour_yn, :boolean, default: false, null: false)
      add(:era_ivc_thrombus_tumour_yn, :boolean, default: false, null: false)
      add(:era_svc_thrombus_tumour_yn, :boolean, default: false, null: false)
      add(:era_persistent_svc_yn, :boolean, default: false, null: false)
      add(:era_cath_wire_yn, :boolean, default: false, null: false)
      add(:era_notes, :text)
      add(:cardiac_echo_id, references(:cardiac_echoes, on_delete: :delete_all))
      timestamps()
    end
  end
end
