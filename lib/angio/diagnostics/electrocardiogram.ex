defmodule Angio.Diagnostics.Electrocardiogram do
  use Ecto.Schema
  import Ecto.Changeset

  schema "electrocardiograms" do
    field(:ecg_av_conduction, :string)
    field(:ecg_dt, :date)
    field(:ecg_epsilon_wave_yn, :boolean, default: false)
    field(:ecg_first_tm, :time)
    field(:ecg_heart_rate, :string)
    field(:ecg_infarct_pattern_location, :string)
    field(:ecg_infarct_pattern_yn, :boolean, default: false)
    field(:ecg_inverted_t_waves_yn, :boolean, default: false)
    field(:ecg_lbbb, :string)
    field(:ecg_lv_hypertrophy, :string)
    field(:ecg_normal_yn, :boolean, default: false)
    field(:ecg_notes, :string)
    field(:ecg_p_duration_val, :string)
    field(:ecg_pathological_q_yn, :boolean, default: false)
    field(:ecg_pr_interval_val, :string)
    field(:ecg_qrs_duration_val, :string)
    field(:ecg_qtc_long_yn, :boolean, default: false)
    field(:ecg_rbbb_yn, :boolean, default: false)
    field(:ecg_rhythm, :string)
    field(:ecg_rv_hypertrophy_yn, :boolean, default: false)
    field(:ecg_st_depression_yn, :boolean, default: false)
    field(:ecg_st_elevation_yn, :boolean, default: false)
    field(:ecg_st_with_symptoms, :string)
    field(:ecg_t_with_symptoms, :string)
    # field(:id, :id)
    field(:ecg_tm, :time)
    field(:ecg_with_symptoms_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(electrocardiogram, attrs) do
    electrocardiogram
    |> cast(attrs, [
      :ecg_dt,
      :ecg_tm,
      :ecg_first_tm,
      :ecg_normal_yn,
      :ecg_with_symptoms_yn,
      :ecg_with_symptoms_yn,
      :ecg_heart_rate,
      :ecg_rhythm,
      :ecg_p_duration_val,
      :ecg_pr_interval_val,
      :ecg_qrs_duration_val,
      :ecg_qtc_long_yn,
      :ecg_st_depression_yn,
      :ecg_st_elevation_yn,
      :ecg_st_with_symptoms,
      :ecg_inverted_t_waves_yn,
      :ecg_t_with_symptoms,
      :ecg_pathological_q_yn,
      :ecg_infarct_pattern_yn,
      :ecg_infarct_pattern_location,
      :ecg_lv_hypertrophy,
      :ecg_rv_hypertrophy_yn,
      :ecg_av_conduction,
      :ecg_lbbb,
      :ecg_rbbb_yn,
      :ecg_epsilon_wave_yn,
      :ecg_notes
    ])
    |> validate_required([])

    # |> validate_required([:ecg_dt, :ecg_tm, :ecg_first_tm, :ecg_normal_yn, :ecg_with_symptoms_yn, :ecg_with_symptoms_yn, :ecg_heart_rate, :ecg_rhythm, :ecg_p_duration_val, :ecg_pr_interval_val, :ecg_qrs_duration_val, :ecg_qtc_long_yn, :ecg_st_depression_yn, :ecg_st_elevation_yn, :ecg_st_with_symptoms, :ecg_inverted_t_waves_yn, :ecg_t_with_symptoms, :ecg_pathological_q_yn, :ecg_infarct_pattern_yn, :ecg_infarct_pattern_location, :ecg_lv_hypertrophy, :ecg_rv_hypertrophy_yn, :ecg_av_conduction, :ecg_lbbb, :ecg_rbbb_yn, :ecg_epsilon_wave_yn, :ecg_notes])
  end
end
