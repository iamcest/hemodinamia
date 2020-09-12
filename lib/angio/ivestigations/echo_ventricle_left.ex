defmodule Angio.Ivestigations.Echo_ventricle_left do
  use Ecto.Schema
  import Ecto.Changeset

  schema "echo_ventricle_lefts" do
    field(:elv_lved_septal_thick_val, :string)
    field(:elv_myocardial_mass_qualitative, :string)
    field(:elv_lved_volume_method, :string)
    field(:elv_aneurism_pseudo_shape_desc, :string)
    field(:elv_ste_circ_peak_strain, :string)
    field(:elv_ste_radial_peak_strain, :string)
    field(:elv_lves_septal_thick_val, :string)
    field(:elv_lved_volume_val, :string)
    field(:elv_lves_volume_index, :string)
    field(:elv_lvid_lved_na, :boolean, default: false)
    field(:elv_lv_appearance_desc, :string)
    field(:elv_myocardial_mass_val, :string)
    field(:elv_lvpw_thick_diast_val, :string)
    field(:elv_lvid_lved_val, :string)
    field(:elv_aneurism_shape_desc, :string)
    field(:elv_segment_17model, :string)
    field(:elv_lved_cavity_size_desc, :string)
    field(:elv_wall_thick_asym_hyper_desc, :string)
    field(:elv_lvot_desc, :string)
    field(:elv_lvid_lves_val, :string)
    field(:elv_wall_thick_region_qualitative, :string)
    field(:elv_lved_inferior_lateral_septal_thick_val, :string)
    field(:elv_wall_thick_region_name, :string)
    field(:elv_lved_overall_septal_thick_desc, :string)
    field(:elv_lvpw_thick_sys_val, :string)
    field(:elv_lv_appearance_other_text, :string)
    field(:elv_myocardial_mass_method, :string)
    field(:elv_lves_volume_method, :string)
    field(:elv_non_compaction_yn, :boolean, default: false)
    field(:elv_thrombus_tumour_loc, :string)
    field(:elv_wall_thick_region, :string)
    field(:elv_lved_volume_index, :string)
    field(:elv_thrombus_tumour_yn, :boolean, default: false)
    field(:elv_lves_volume_val, :string)
    field(:elv_lv_geometry_desc, :string)
    field(:elv_concentric_hyper_yn, :boolean, default: false)
    field(:elv_lv_shape_normal_yn, :boolean, default: false)
    field(:elv_notes, :string)
    field(:elv_lvid_lves_na, :boolean, default: false)
    field(:elv_wall_thick_normal_yn, :boolean, default: false)
    field(:cardiac_echo_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(echo_ventricle_left, attrs) do
    echo_ventricle_left
    |> cast(attrs, [
      :elv_lv_appearance_desc,
      :elv_lv_appearance_other_text,
      :elv_concentric_hyper_yn,
      :elv_myocardial_mass_qualitative,
      :elv_myocardial_mass_val,
      :elv_myocardial_mass_method,
      :elv_lv_shape_normal_yn,
      :elv_lv_geometry_desc,
      :elv_lved_cavity_size_desc,
      :elv_lved_volume_val,
      :elv_lved_volume_index,
      :elv_lved_volume_method,
      :elv_lves_volume_val,
      :elv_lves_volume_method,
      :elv_thrombus_tumour_yn,
      :elv_thrombus_tumour_loc,
      :elv_aneurism_shape_desc,
      :elv_aneurism_pseudo_shape_desc,
      :elv_wall_thick_normal_yn,
      :elv_wall_thick_region,
      :elv_wall_thick_region_qualitative,
      :elv_wall_thick_region_name,
      :elv_wall_thick_asym_hyper_desc,
      :elv_lvpw_thick_sys_val,
      :elv_lvpw_thick_diast_val,
      :elv_lved_septal_thick_val,
      :elv_lves_septal_thick_val,
      :elv_lved_inferior_lateral_septal_thick_val,
      :elv_lved_overall_septal_thick_desc,
      :elv_lvid_lved_val,
      :elv_lvid_lved_na,
      :elv_lvid_lves_val,
      :elv_lvid_lves_na,
      :elv_lvot_desc,
      :elv_lves_volume_index,
      :elv_non_compaction_yn,
      :elv_segment_17model,
      :elv_ste_circ_peak_strain,
      :elv_ste_radial_peak_strain,
      :elv_notes
    ])
    # |> validate_required([:elv_lv_appearance_desc, :elv_lv_appearance_other_text, :elv_concentric_hyper_yn, :elv_myocardial_mass_qualitative, :elv_myocardial_mass_val, :elv_myocardial_mass_method, :elv_lv_shape_normal_yn, :elv_lv_geometry_desc, :elv_lved_cavity_size_desc, :elv_lved_volume_val, :elv_lved_volume_index, :elv_lved_volume_method, :elv_lves_volume_val, :elv_lves_volume_method, :elv_thrombus_tumour_yn, :elv_thrombus_tumour_loc, :elv_aneurism_shape_desc, :elv_aneurism_pseudo_shape_desc, :elv_wall_thick_normal_yn, :elv_wall_thick_region, :elv_wall_thick_region_qualitative, :elv_wall_thick_region_name, :elv_wall_thick_asym_hyper_desc, :elv_lvpw_thick_sys_val, :elv_lvpw_thick_diast_val, :elv_lved_septal_thick_val, :elv_lves_septal_thick_val, :elv_lved_inferior_lateral_septal_thick_val, :elv_lved_overall_septal_thick_desc, :elv_lvid_lved_val, :elv_lvid_lved_na, :elv_lvid_lves_val, :elv_lvid_lves_na, :elv_lvot_desc, :elv_lv_appearance_other_text, :elv_lves_volume_index, :elv_non_compaction_yn, :elv_segment_17model, :elv_ste_circ_peak_strain, :elv_ste_radial_peak_strain, :elv_notes])
    |> validate_required([])
    |> unique_constraint(:cardiac_echo_id,
    name: :echo_ventricle_lefts_cardiac_echo_id_index,
    message: "Error: Record For  in table Echo For LV Structure Was Inserted"
  )
  end
end
