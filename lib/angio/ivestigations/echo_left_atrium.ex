defmodule Angio.Ivestigations.Echo_left_atrium do
  use Ecto.Schema
  import Ecto.Changeset

  schema "echo_left_atriums" do
    field :ela_appearance_trasplantation_yn, :boolean, default: false
    field :ela_area_4ch_2d_us, :string
    field :ela_asd_yn, :boolean, default: false
    field :ela_chatheter_loc_desc, :string
    field :ela_chatheter_yn, :boolean, default: false
    field :ela_cor_triatrium_yn, :boolean, default: false
    field :ela_diam_ap_val, :string
    field :ela_diam_ml_val, :string
    field :ela_diam_si_val, :string
    field :ela_mas_attachment_site, :string
    field :ela_mas_location_desc, :string
    field :ela_mas_yn, :boolean, default: false
    field :ela_notes, :string
    field :ela_pum_veins_thrombus_tumour_yn, :boolean, default: false
    field :ela_spontaneous_contrast_loc, :string
    field :ela_spontaneous_contrast_persist, :string
    field :ela_spontaneous_contrast_yn, :boolean, default: false
    field :ela_thromus_tumour_body_loc, :string
    field :ela_volume_desc, :string
    field :ela_volume_index, :string
    field :ela_volume_method, :string
    field :ela_volume_val, :string
    field :cardiac_echo_id, :integer
    timestamps()
  end

  @doc false
  def changeset(echo_left_atrium, attrs) do
    echo_left_atrium
    |> cast(attrs, [:ela_volume_val, :ela_chatheter_loc_desc, :ela_volume_desc, :ela_diam_si_val, :ela_volume_index, :ela_diam_ml_val, :ela_appearance_trasplantation_yn, :ela_mas_location_desc, :ela_cor_triatrium_yn, :ela_asd_yn, :ela_pum_veins_thrombus_tumour_yn, :ela_chatheter_yn, :ela_area_4ch_2d_us, :ela_spontaneous_contrast_yn, :ela_thromus_tumour_body_loc, :ela_mas_attachment_site, :ela_volume_method, :ela_mas_yn, :ela_spontaneous_contrast_persist, :ela_diam_ap_val, :ela_spontaneous_contrast_loc, :ela_notes])
    |> validate_required([])
    |> unique_constraint(:cardiac_echo_id,
    name: :echo_left_atriums_cardiac_echo_id_index,
    message: "Error: Record For  in table Echo For Left Atrium Was Inserted"
  )

    #|> validate_required([:ela_volume_val, :ela_chatheter_loc_desc, :ela_volume_desc, :ela_diam_si_val, :ela_volume_index, :ela_diam_ml_val, :ela_appearance_trasplantation_yn, :ela_mas_location_desc, :ela_cor_triatrium_yn, :ela_asd_yn, :ela_pum_veins_thrombus_tumour_yn, :ela_chatheter_yn, :ela_area_4ch_2d_us, :ela_spontaneous_contrast_yn, :ela_thromus_tumour_body_loc, :ela_mas_attachment_site, :ela_volume_method, :ela_mas_yn, :ela_spontaneous_contrast_persist, :ela_diam_ap_val, :ela_spontaneous_contrast_loc, :ela_notes])
  end
end
