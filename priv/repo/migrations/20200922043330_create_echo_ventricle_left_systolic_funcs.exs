defmodule Angio.Repo.Migrations.CreateEchoVentricleLeftSystolicFuncs do
  use Ecto.Migration

  def change do
    create table(:echo_ventricle_left_systolic_funcs) do
      add :elvsf_is_normal_yn, :boolean, default: false, null: false
      add :elvsf_systolic_function_desc, :string
      add :elvsf_measurment_dt, :string
      add :elvsf_cardiac_output_val, :string
      add :elvsf_cardiac_output_method, :string
      add :elvsf_ejection_fraction_calculated, :string
      add :elvsf_ejection_fraction_desc, :string
      add :elvsf_ejection, :string
      add :elvsf_fractional_shortening_method, :string
      add :elvsf_fractional_shortening_val, :string
      add :elvsf_fractional_shortening_desc, :string
      add :elvsf_wall_seg_doppler_val, :string
      add :elvsf_lvot_vti_val, :string
      add :elvsf_lvot_area_val, :string
      add :elvsf_lvot_diameter_val, :string
      add :elvsf_lvot_peak_velocity_val, :string
      add :elvsf_cardiac_index, :string
      add :elvsf_stroke_work_val, :string
      add :elvsf_stroke_work_index, :string
      add :elvsf_stroke_volume_method, :string
      add :elvsf_peak_dp_dt, :string
      add :elvsf_stroke_distance, :string
      add :elvsf_stroke_volume_valumetric, :string
      add :elvsf_stroke_volume_doppler , :string
      add :elvsf_vti_a_wave_us_val, :string
      add :elvsf_vti_e_wave_us_val, :string
      add :elvsf_pulsed_tissue_doppler_s, :string
      add :elvsf_tei_index, :string
      add :elvsf_dyssynchrony, :string
      add :elvsf_mean_dp_dt, :string
      add :elvsf_global_long_strain, :string
      add :elvsf_notes, :text
      add(:cardiac_echo_id, references(:cardiac_echoes, on_delete: :delete_all))
      timestamps()
    end

  end
end
