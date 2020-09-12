defmodule Angio.Interventions.Asd_closure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "asd_closures" do
    field(:asdcl_aortic_rim_length, :string)
    field(:asdcl_asd_size, :string)
    field(:asdcl_atria_septal_aneurysm_yn, :string)
    field(:asdcl_bal_sizing_perfomed_yn, :boolean, default: false)
    field(:asdcl_defect_counter_assoc, :string)
    field(:asdcl_defect_not_treated, :string)
    field(:asdcl_device_used_outcome, :string)
    field(:asdcl_device_utilized_id, :string)
    field(:asdcl_device_utilized_name, :string)
    field(:asdcl_ivc_rim_length, :string)
    field(:asdcl_multi_fenestrated_yn, :boolean, default: false)
    field(:asdcl_notes, :string)
    field(:asdcl_operator_fname, :string)
    field(:asdcl_operator_lname, :string)
    field(:asdcl_operator_mname, :string)
    field(:asdcl_operator_npi, :string)
    field(:asdcl_primary_indication, :string)
    field(:asdcl_residual_shunt_size, :string)
    field(:asdcl_rim_meas_performed_yn, :boolean, default: false)
    field(:asdcl_stop_flow, :string)
    field(:asdcl_stop_flow_performed_yn, :boolean, default: false)
    field(:asdcl_stretch_diam_perform_yn, :boolean, default: false)
    field(:asdcl_stretched_diam_size, :string)
    field(:asdcl_total_septal_length, :string)
    field(:asdcl_treat_attempted_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(asd_closure, attrs) do
    asd_closure
    |> cast(attrs, [
      :asdcl_operator_lname,
      :asdcl_operator_fname,
      :asdcl_operator_mname,
      :asdcl_operator_npi,
      :asdcl_primary_indication,
      :asdcl_defect_not_treated,
      :asdcl_treat_attempted_yn,
      :asdcl_total_septal_length,
      :asdcl_atria_septal_aneurysm_yn,
      :asdcl_multi_fenestrated_yn,
      :asdcl_asd_size,
      :asdcl_bal_sizing_perfomed_yn,
      :asdcl_stop_flow_performed_yn,
      :asdcl_rim_meas_performed_yn,
      :asdcl_aortic_rim_length,
      :asdcl_ivc_rim_length,
      :asdcl_stop_flow,
      :asdcl_stretch_diam_perform_yn,
      :asdcl_residual_shunt_size,
      :asdcl_device_utilized_id,
      :asdcl_device_utilized_name,
      :asdcl_device_used_outcome,
      :asdcl_stretched_diam_size,
      :asdcl_defect_counter_assoc,
      :asdcl_notes
    ])
    |> validate_required([])

    # |> validate_required([:asdcl_operator_lname, :asdcl_operator_fname, :asdcl_operator_mname, :asdcl_operator_npi, :asdcl_primary_indication, :asdcl_defect_not_treated, :asdcl_treat_attempted_yn, :asdcl_total_septal_length, :asdcl_atria_septal_aneurysm_yn, :asdcl_multi_fenestrated_yn, :asdcl_asd_size, :asdcl_bal_sizing_perfomed_yn, :asdcl_stop_flow_performed_yn, :asdcl_rim_meas_performed_yn, :asdcl_aortic_rim_length, :asdcl_ivc_rim_length, :"asdcl_stop_flow,", :"", :asdcl_stretch_diam_perform_yn, :asdcl_residual_shunt_size, :asdcl_device_utilized_id, :asdcl_device_utilized_name, :asdcl_device_used_outcome, :asdcl_stretched_diam_size, :asdcl_defect_counter_assoc, :asdcl_notes])
  end
end
