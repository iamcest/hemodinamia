defmodule Angio.Ivestigations.Echo_right_atrium do
  use Ecto.Schema
  import Ecto.Changeset

  schema "echo_right_atriums" do
    field(:era_area_val, :string)
    field(:era_cath_wire_yn, :boolean, default: false)
    field(:era_chiari_prominent_yn, :boolean, default: false)
    field(:era_coronary_sinus_dilated_yn, :boolean, default: false)
    field(:era_eustachian_prominent_yn, :boolean, default: false)
    field(:era_ivc_thrombus_tumour_yn, :boolean, default: false)
    field(:era_max_diameter_val, :string)
    field(:era_ml_diameter_val, :string)
    field(:era_notes, :string)
    field(:era_persistent_svc_yn, :boolean, default: false)
    field(:era_septum_bowed_left_yn, :boolean, default: false)
    field(:era_si_diameter_val, :string)
    field(:era_size_volume_desc, :string)
    field(:era_size_volume_method, :string)
    field(:era_svc_thrombus_tumour_yn, :boolean, default: false)
    field(:era_thrombus_tumour_yn, :boolean, default: false)
    field(:era_volume_val, :string)
    field(:cardiac_echo_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(echo_right_atrium, attrs) do
    echo_right_atrium
    |> cast(attrs, [
      :era_si_diameter_val,
      :era_ml_diameter_val,
      :era_max_diameter_val,
      :era_area_val,
      :era_size_volume_desc,
      :era_volume_val,
      :era_size_volume_method,
      :era_coronary_sinus_dilated_yn,
      :era_eustachian_prominent_yn,
      :era_chiari_prominent_yn,
      :era_septum_bowed_left_yn,
      :era_thrombus_tumour_yn,
      :era_ivc_thrombus_tumour_yn,
      :era_svc_thrombus_tumour_yn,
      :era_persistent_svc_yn,
      :era_cath_wire_yn,
      :era_notes
    ])
    |> validate_required([])
    |> unique_constraint(:cardiac_echo_id,
    name: :echo_right_atriums_cardiac_echo_id_index,
    message: "Error: Record For  in table Echo For Rigth Atrium Was Inserted"
  )
    # |> validate_required([:era_si_diameter_val, :era_ml_diameter_val, :era_max_diameter_val, :era_area_val, :era_size_volume_desc, :era_volume_val, :era_size_volume_method, :era_coronary_sinus_dilated_yn, :era_eustachian_prominent_yn, :era_chiari_prominent_yn, :era_septum_bowed_left_yn, :era_thrombus_tumour_yn, :era_ivc_thrombus_tumour_yn, :era_svc_thrombus_tumour_yn, :era_persistent_svc_yn, :era_cath_wire_yn, :era_notes])
  end
end
