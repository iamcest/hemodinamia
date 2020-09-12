defmodule Angio.Repo.Migrations.CreateEchoLeftAtriums do
  use Ecto.Migration

  def change do
    create table(:echo_left_atriums) do
      add(:ela_volume_val, :string)
      add(:ela_chatheter_loc_desc, :string)
      add(:ela_volume_desc, :string)
      add(:ela_diam_si_val, :string)
      add(:ela_volume_index, :string)
      add(:ela_diam_ml_val, :string)
      add(:ela_appearance_trasplantation_yn, :boolean, default: false, null: false)
      add(:ela_mas_location_desc, :string)
      add(:ela_cor_triatrium_yn, :boolean, default: false, null: false)
      add(:ela_asd_yn, :boolean, default: false, null: false)
      add(:ela_pum_veins_thrombus_tumour_yn, :boolean, default: false, null: false)
      add(:ela_chatheter_yn, :boolean, default: false, null: false)
      add(:ela_area_4ch_2d_us, :string)
      add(:ela_spontaneous_contrast_yn, :boolean, default: false, null: false)
      add(:ela_thromus_tumour_body_loc, :string)
      add(:ela_mas_attachment_site, :string)
      add(:ela_volume_method, :string)
      add(:ela_mas_yn, :boolean, default: false, null: false)
      add(:ela_spontaneous_contrast_persist, :string)
      add(:ela_diam_ap_val, :string)
      add(:ela_spontaneous_contrast_loc, :string)
      add(:ela_notes, :text)
      add(:cardiac_echo_id, references(:cardiac_echoes, on_delete: :delete_all))
      timestamps()
    end
  end
end
