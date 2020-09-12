defmodule Angio.Assements.Clinical_exam_cardio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clinical_exams_cardios" do
    field(:cle_mv_prosthetic_sound_yn, :boolean, default: false)
    field(:cle_tr_abnormal_yn, :boolean, default: false)
    field(:cle_pv_dias_murmur_grade, :string)
    field(:cle_normal_yn, :boolean, default: false)
    field(:cle_killip_class, :string)
    field(:cle_peri_rub_yn, :boolean, default: false)
    field(:cle_pv_abnormal_yn, :boolean, default: false)
    field(:cle_pv_sys_murmur_yn, :boolean, default: false)
    field(:cle_mv_notes, :string)
    field(:cle_complain_notes, :string)
    field(:cle_no_ejection_click_yn, :boolean, default: false)
    field(:cle_av_dias_murmur_yn, :boolean, default: false)
    field(:cle_complain_yn, :boolean, default: false)
    field(:cle_mv_opening_snap_yn, :boolean, default: false)
    field(:cle_av_sys_murmur_grade, :string)
    field(:cle_s4_heart_sound_yn, :boolean, default: false)
    field(:cle_murmur_notes, :string)
    field(:cle_complain_cough_yn, :boolean, default: false)
    field(:cle_pv_notes, :string)
    field(:cle_mv_dias_murmur_yn, :boolean, default: false)
    field(:cle_av_prosthetic_sound_yn, :boolean, default: false)
    field(:cle_av_dias_murmur_grade, :string)
    field(:cle_mv_sys_murmur_yn, :boolean, default: false)
    field(:cle_av_abnormal_yn, :boolean, default: false)
    field(:cle_mv_sys_murmur_grade, :string)
    field(:cle_tr_dias_murmur_yn, :boolean, default: false)
    field(:cle_av_sys_murmur_yn, :boolean, default: false)
    field(:cle_mv_dias_murmur_grade, :string)
    field(:cle_dt, :date)
    field(:cle_complain_dysp, :string)
    field(:cle_pv_dias_murmur_yn, :boolean, default: false)
    field(:cle_tr_sys_murmur_yn, :boolean, default: false)
    field(:cle_s1_heart_sound, :string)
    field(:cle_continuous_murmur, :string)
    field(:cle_s3_heart_sound_yn, :boolean, default: false)
    field(:cle_mv_abnormal_yn, :boolean, default: false)
    field(:cle_temperature, :string)
    field(:cle_s2_heart_sound, :string)
    field(:cle_heart_sounds_abnormal_yn, :boolean, default: false)
    field(:cle_complain_palpitations_yn, :boolean, default: false)
    field(:cle_tr_notes, :string)
    field(:cle_tm, :time)
    field(:cle_complain_chest_pain_yn, :boolean, default: false)
    field(:cle_pv_sys_murmur_grade, :string)
    field(:cle_av_ejection_click_yn, :boolean, default: false)
    field(:cle_sounds_notes, :string)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(clinical_exam_cardio, attrs) do
    clinical_exam_cardio
    |> cast(attrs, [
      :cle_dt,
      :cle_tm,
      :cle_normal_yn,
      :cle_complain_yn,
      :cle_complain_dysp,
      :cle_complain_chest_pain_yn,
      :cle_complain_palpitations_yn,
      :cle_complain_cough_yn,
      :cle_complain_notes,
      :cle_temperature,
      :cle_killip_class,
      :cle_heart_sounds_abnormal_yn,
      :cle_s1_heart_sound,
      :cle_s2_heart_sound,
      :cle_s3_heart_sound_yn,
      :cle_s4_heart_sound_yn,
      :cle_peri_rub_yn,
      :cle_sounds_notes,
      :cle_mv_abnormal_yn,
      :cle_mv_sys_murmur_yn,
      :cle_mv_sys_murmur_grade,
      :cle_mv_dias_murmur_yn,
      :cle_mv_dias_murmur_grade,
      :cle_mv_opening_snap_yn,
      :cle_mv_prosthetic_sound_yn,
      :cle_mv_notes,
      :cle_av_abnormal_yn,
      :cle_av_sys_murmur_yn,
      :cle_av_sys_murmur_grade,
      :cle_av_dias_murmur_yn,
      :cle_av_dias_murmur_grade,
      :cle_av_ejection_click_yn,
      :cle_av_prosthetic_sound_yn,
      :cle_no_ejection_click_yn,
      :cle_continuous_murmur,
      :cle_murmur_notes,
      :cle_pv_abnormal_yn,
      :cle_pv_sys_murmur_yn,
      :cle_pv_sys_murmur_grade,
      :cle_pv_dias_murmur_yn,
      :cle_pv_dias_murmur_grade,
      :cle_pv_notes,
      :cle_tr_abnormal_yn,
      :cle_tr_sys_murmur_yn,
      :cle_tr_dias_murmur_yn,
      :cle_tr_notes
    ])
    |> validate_required([])

    # |> validate_required([:cle_dt, :cle_tm, :cle_normal_yn, :cle_complain_yn, :cle_complain_dysp, :cle_complain_chest_pain_yn, :cle_complain_palpitations_yn, :cle_complain_cough_yn, :cle_complain_notes, :cle_temperature, :cle_killip_class, :cle_heart_sounds_abnormal_yn, :cle_s1_heart_sound, :cle_s2_heart_sound, :cle_s3_heart_sound_yn, :cle_s4_heart_sound_yn, :cle_peri_rub_yn, :cle_sounds_notes, :cle_mv_abnormal_yn, :cle_mv_sys_murmur_yn, :cle_mv_sys_murmur_grade, :cle_mv_dias_murmur_yn, :cle_mv_dias_murmur_grade, :cle_mv_opening_snap_yn, :cle_mv_prosthetic_sound_yn, :cle_mv_notes, :cle_av_abnormal_yn, :cle_av_sys_murmur_yn, :cle_av_sys_murmur_grade, :cle_av_dias_murmur_yn, :cle_av_dias_murmur_grade, :cle_av_ejection_click_yn, :cle_av_prosthetic_sound_yn, :cle_no_ejection_click_yn, :cle_continuous_murmur, :cle_murmur_notes, :cle_pv_abnormal_yn, :cle_pv_sys_murmur_yn, :cle_pv_sys_murmur_grade, :cle_pv_dias_murmur_yn, :cle_pv_dias_murmur_grade, :cle_pv_notes, :cle_tr_abnormal_yn, :cle_tr_sys_murmur_yn, :cle_tr_dias_murmur_yn, :cle_tr_notes])
  end
end
