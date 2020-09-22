defmodule Angio.Ivestigations.Echo_ventricle_left_systolic_func do
  use Ecto.Schema
  import Ecto.Changeset

  schema "echo_ventricle_left_systolic_funcs" do
    field :elvsf_cardiac_index, :string
    field :elvsf_cardiac_output_method, :string
    field :elvsf_cardiac_output_val, :string
    field :elvsf_dyssynchrony, :string
    field :elvsf_ejection, :string
    field :elvsf_ejection_fraction_calculated, :string
    field :elvsf_ejection_fraction_desc, :string
    field :elvsf_fractional_shortening_desc, :string
    field :elvsf_fractional_shortening_method, :string
    field :elvsf_fractional_shortening_val, :string
    field :elvsf_global_long_strain, :string
    field :elvsf_is_normal_yn, :boolean, default: false
    field :elvsf_lvot_area_val, :string
    field :elvsf_lvot_diameter_val, :string
    field :elvsf_lvot_peak_velocity_val, :string
    field :elvsf_lvot_vti_val, :string
    field :elvsf_mean_dp_dt, :string
    field :elvsf_measurment_dt, :string
    field :elvsf_notes, :string
    field :elvsf_peak_dp_dt, :string
    field :elvsf_pulsed_tissue_doppler_s, :string
    field :elvsf_stroke_distance, :string
    field :elvsf_stroke_volume_doppler, :string
    field :elvsf_stroke_volume_method, :string
    field :elvsf_stroke_volume_valumetric, :string
    field :elvsf_stroke_work_index, :string
    field :elvsf_stroke_work_val, :string
    field :elvsf_systolic_function_desc, :string
    field :elvsf_tei_index, :string
    field :elvsf_vti_a_wave_us_val, :string
    field :elvsf_vti_e_wave_us_val, :string
    field :elvsf_wall_seg_doppler_val, :string
    field(:cardiac_echo_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(echo_ventricle_left_systolic_func, attrs) do
    echo_ventricle_left_systolic_func
    |> cast(attrs, [:elvsf_is_normal_yn, :elvsf_systolic_function_desc, :elvsf_measurment_dt, :elvsf_cardiac_output_val, :elvsf_cardiac_output_method, :elvsf_ejection_fraction_calculated, :elvsf_ejection_fraction_desc, :elvsf_ejection, :elvsf_fractional_shortening_method, :elvsf_fractional_shortening_val, :elvsf_fractional_shortening_desc, :elvsf_wall_seg_doppler_val, :elvsf_lvot_vti_val, :elvsf_lvot_area_val, :elvsf_lvot_diameter_val, :elvsf_lvot_peak_velocity_val, :elvsf_cardiac_index, :elvsf_stroke_work_val, :elvsf_stroke_work_index, :elvsf_stroke_volume_method, :elvsf_peak_dp_dt, :elvsf_stroke_distance, :elvsf_stroke_volume_valumetric, :elvsf_stroke_volume_doppler, :elvsf_vti_a_wave_us_val, :elvsf_vti_e_wave_us_val, :elvsf_pulsed_tissue_doppler_s, :elvsf_tei_index, :elvsf_dyssynchrony, :elvsf_mean_dp_dt, :elvsf_global_long_strain, :elvsf_notes])
    #|> validate_required([:elvsf_is_normal_yn, :elvsf_systolic_function_desc, :elvsf_measurment_dt, :elvsf_cardiac_output_val, :elvsf_cardiac_output_method, :elvsf_ejection_fraction_calculated, :elvsf_ejection_fraction_desc, :elvsf_ejection, :elvsf_fractional_shortening_method, :elvsf_fractional_shortening_val, :elvsf_fractional_shortening_desc, :elvsf_wall_seg_doppler_val, :elvsf_lvot_vti_val, :elvsf_lvot_area_val, :elvsf_lvot_diameter_val, :elvsf_lvot_peak_velocity_val, :elvsf_cardiac_index, :elvsf_stroke_work_val, :elvsf_stroke_work_index, :elvsf_stroke_volume_method, :elvsf_peak_dp_dt, :elvsf_stroke_distance, :elvsf_stroke_volume_valumetric, :elvsf_stroke_volume_doppler, :elvsf_vti_a_wave_us_val, :elvsf_vti_e_wave_us_val, :elvsf_pulsed_tissue_doppler_s, :elvsf_tei_index, :elvsf_dyssynchrony, :elvsf_mean_dp_dt, :elvsf_global_long_strain, :elvsf_notes])
    |> validate_required([])
    |> unique_constraint(:cardiac_echo_id,
    name: :echo_ventricle_left_systolic_funcs_cardiac_echo_id_index,
    message: "Error: Record For  in table Echo For LV Sys Function Was Inserted"
  )

  end
end
