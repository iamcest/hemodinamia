defmodule Angio.Caths.Sats_pressure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sats_pressures" do
    field(:sao2_rv_mid, :string)
    field(:ra_pres_a, :string)
    field(:ra_pres_dias, :string)
    field(:ra_pres_y, :string)
    field(:sat_pres_end_dt, :date)
    field(:ra_pres_x, :string)
    field(:pcw_pres_sys, :string)
    field(:sao2_pa, :string)
    field(:pcw_pres_y, :string)
    field(:sat_pres_start_dt, :date)
    field(:sat_pres_heart_rate, :string)
    field(:sao2_ao_distal, :string)
    field(:hepatic_veins_pres, :string)
    field(:pa_right_pres_dias, :string)
    field(:uni_bsa, :string)
    field(:ivc_pres_dias, :string)
    field(:pcw_pres_mean, :string)
    field(:pa_left_pres_mean, :string)
    field(:pcw_pres_dias, :string)
    field(:ivc_pres_sys, :string)
    field(:svc_pres_sys, :string)
    field(:sat_pres_start_tm, :time)
    field(:svc_pres_mean, :string)
    field(:rv_pres_sys, :string)
    field(:svc_pres_dias, :string)
    field(:pa_pres_mean, :string)
    field(:pa_pres_mean_na, :string)
    field(:aortic_pres_dias, :string)
    field(:lv_pres_mean, :string)
    field(:pa_pres_sys, :string)
    field(:sat_pres_notes, :string)
    field(:pa_right_pres_sys, :string)
    field(:pa_right_pres_mean, :string)
    field(:sao2_pa_right, :string)
    field(:aortic_pres_sys, :string)
    field(:ra_pres_sys, :string)
    field(:sat_pres_end_tm, :time)
    field(:sat_pres_meds, :string)
    field(:sao2_rv_outflow, :string)
    field(:sao2_ra_low, :string)
    field(:pcw_pres_z, :string)
    field(:sat_pres_hb, :string)
    field(:ventr_sys_ejc_period, :string)
    field(:pcw_pres_a, :string)
    field(:sat_pulm_veins, :string)
    field(:sao2_lv, :string)
    field(:sao2_pa_left, :string)
    field(:sat_pres_oxygen_consumption, :string)
    field(:ra_pres_z, :string)
    field(:lv_pres_end_dias, :string)
    field(:info_coronary_id, :integer)
    field(:ivc_pres_mean, :string)
    field(:sao2_svc_high, :string)
    field(:pcw_pres_v, :string)
    field(:ra_pres_mean, :string)
    field(:sao2_ra_high, :string)
    field(:patient_id, :integer)
    field(:sao2_rv, :string)
    field(:pa_left_pres_sys, :string)
    field(:rv_pres_dias, :string)
    field(:pa_pres_sys_na, :string)
    field(:pa_left_pres_dias, :string)
    field(:sao2_ao_root, :string)
    field(:lv_pres_sys, :string)
    field(:sao2_pcw, :string)
    field(:pcw_pres_c, :string)
    field(:pcw_pres_x, :string)
    field(:pcw_pres_h, :string)
    field(:rv_pres_mean, :string)
    field(:sao2_svc_low, :string)
    field(:aortic_pres_mean, :string)
    field(:ra_pres_v, :string)
    field(:sat_pres_o2_inhalation, :string)
    field(:sao2_rv_apex, :string)
    field(:ra_pres_c, :string)
    field(:uni_qp_qs, :string)
    field(:sao2_ra_mid, :string)
    field(:sao2_hepatic_veins, :string)
    field(:pa_pres_dias, :string)
    field(:ra_pres_h, :string)
    field(:sao2_ivc, :string)
    field(:ventr_dias_fill_period, :string)
    field(:ao_pres_sys_distal, :string)
    field(:ao_pres_dias_distal, :string)
    field(:height, :string)
    field(:weigth, :string)
    timestamps()
  end

  @doc false
  def changeset(sats_pressure, attrs) do
    sats_pressure
    |> cast(attrs, [
      :aortic_pres_mean,
      :pa_right_pres_mean,
      :pa_pres_sys,
      :rv_pres_dias,
      :svc_pres_dias,
      :ivc_pres_mean,
      :svc_pres_mean,
      :sao2_rv,
      :sao2_ra_mid,
      :ra_pres_x,
      :rv_pres_sys,
      :pa_left_pres_sys,
      :sao2_hepatic_veins,
      :sao2_rv_apex,
      :sat_pres_meds,
      :pcw_pres_dias,
      :sao2_svc_low,
      :sao2_pa,
      :sat_pres_o2_inhalation,
      :lv_pres_sys,
      :ra_pres_v,
      :pcw_pres_x,
      :pa_right_pres_sys,
      :pa_right_pres_dias,
      :ventr_dias_fill_period,
      :pcw_pres_h,
      :pcw_pres_a,
      :sao2_pa_left,
      :pcw_pres_z,
      :ra_pres_mean,
      :pa_pres_mean,
      :sao2_rv_mid,
      :pa_left_pres_mean,
      :sao2_lv,
      :pcw_pres_v,
      :aortic_pres_dias,
      :svc_pres_sys,
      :ventr_sys_ejc_period,
      :sao2_ivc,
      :sat_pres_hb,
      :ivc_pres_sys,
      :pcw_pres_c,
      :aortic_pres_sys,
      :uni_bsa,
      :pcw_pres_mean,
      :ra_pres_h,
      :pa_pres_sys_na,
      :ra_pres_dias,
      :sao2_rv_outflow,
      :ra_pres_a,
      :pa_left_pres_dias,
      :ra_pres_z,
      :uni_qp_qs,
      :pa_pres_mean_na,
      :sat_pres_oxygen_consumption,
      :lv_pres_mean,
      :sao2_ao_distal,
      :sao2_pcw,
      :ivc_pres_dias,
      :lv_pres_end_dias,
      :pa_pres_dias,
      :sao2_ra_low,
      :sat_pres_notes,
      :ra_pres_c,
      :ra_pres_sys,
      :sao2_ra_high,
      :sao2_svc_high,
      :rv_pres_mean,
      :sao2_pa_right,
      :sao2_ao_root,
      :pcw_pres_y,
      :pcw_pres_sys,
      :sat_pulm_veins,
      :sat_pres_start_dt,
      :sat_pres_start_tm,
      :sat_pres_end_dt,
      :sat_pres_end_tm,
      :ra_pres_y,
      :sat_pres_heart_rate,
      :hepatic_veins_pres,
      :patient_id,
      :ao_pres_sys_distal,
      :ao_pres_dias_distal,
      :height,
      :weigth
    ])
    |> validate_required([])

    # |> validate_required([:aortic_pres_mean, :pa_right_pres_mean, :pa_pres_sys, :rv_pres_dias, :svc_pres_dias, :ivc_pres_mean, :svc_pres_mean, :sao2_rv, :sao2_ra_mid, :ra_pres_x, :rv_pres_sys, :pa_left_pres_sys, :sao2_hepatic_veins, :sao2_rv_apex, :sat_pres_meds, :pcw_pres_dias, :sao2_svc_low, :sao2_pa, :sat_pres_o2_inhalation, :lv_pres_sys, :ra_pres_v, :pcw_pres_x, :pa_right_pres_sys, :pa_right_pres_dias, :ventr_dias_fill_period, :pcw_pres_h, :pcw_pres_a, :sao2_pa_left, :pcw_pres_z, :ra_pres_mean, :pa_pres_mean, :sao2_rv_mid, :pa_left_pres_mean, :sao2_lv, :pcw_pres_v, :aortic_pres_dias, :svc_pres_sys, :ventr_sys_ejc_period, :sao2_ivc, :sat_pres_hb, :ivc_pres_sys, :pcw_pres_c, :aortic_pres_sys, :uni_bsa, :pcw_pres_mean, :ra_pres_h, :pa_pres_sys_na, :ra_pres_dias, :sao2_rv_outflow, :ra_pres_a, :pa_left_pres_dias, :ra_pres_z, :uni_qp_qs, :pa_pres_mean_na, :sat_pres_oxygen_consumption, :lv_pres_mean, :sao2_ao_distal, :sao2_pcw, :ivc_pres_dias, :lv_pres_end_dias, :pa_pres_dias, :sao2_ra_low, :sat_pres_notes, :ra_pres_c, :ra_pres_sys, :sao2_ra_high, :sao2_svc_high, :rv_pres_mean, :sao2_pa_right, :sao2_ao_root, :pcw_pres_y, :pcw_pres_sys, :sat_pulm_veins, :sat_pres_start_dt, :sat_pres_start_tm, :sat_pres_end_dt, :sat_pres_end_tm, :ra_pres_y, :sat_pres_heart_rate, :hepatic_veins_pres, :patient_id, :info_coronary_id])
  end
end
