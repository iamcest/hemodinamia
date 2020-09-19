defmodule Angio.Interventions.Coarc_procedure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coarc_procedures" do
    field(:coarc_ao_obstruction_post_sys_gradient, :string)
    field(:coarc_ao_obstruction_pre_sys_gradient, :string)
    field(:coarc_aortic_obstruction_yn, :boolean, default: false)
    field(:coarc_arch_treated_yn, :boolean, default: false)
    field(:coarc_asdcl_operator_fname, :string)
    field(:coarc_asdcl_operator_mname, :string)
    field(:coarc_asdcl_operator_npi, :string)
    field(:coarc_dt, :date)
    field(:coarc_min_diam_post_proc, :string)
    field(:coarc_min_diam_pre_proc, :string)
    field(:coarc_nature, :string)
    field(:coarc_nature_post_prior_treatment, :string)
    field(:coarc_note, :string)
    field(:coarc_operator_lname, :string)
    field(:coarc_peak_sys_gradient_post, :string)
    field(:coarc_peak_sys_gradient_pre, :string)
    field(:coarc_primary_indication, :string)
    field(:coarc_tm, :time)
    field(:info_coronary_id, :integer)

    has_many(
      :coarc_devices,
      Angio.Interventions.Coarc_device,
      foreign_key: :coarc_procedure_id
    )

    timestamps()
  end

  @doc false
  def changeset(coarc_procedure, attrs) do
    coarc_procedure
    |> cast(attrs, [
      :coarc_dt,
      :coarc_tm,
      :coarc_operator_lname,
      :coarc_asdcl_operator_fname,
      :coarc_asdcl_operator_mname,
      :coarc_asdcl_operator_npi,
      :coarc_primary_indication,
      :coarc_nature,
      :coarc_nature_post_prior_treatment,
      :coarc_min_diam_pre_proc,
      :coarc_peak_sys_gradient_pre,
      :coarc_min_diam_post_proc,
      :coarc_peak_sys_gradient_post,
      :coarc_aortic_obstruction_yn,
      :coarc_arch_treated_yn,
      :coarc_note,
      :coarc_ao_obstruction_pre_sys_gradient,
      :coarc_ao_obstruction_post_sys_gradient
    ])
    |> validate_required([])

    # |> validate_required([:coarc_dt, :coarc_tm, :coarc_operator_lname, :coarc_asdcl_operator_fname, :coarc_asdcl_operator_mname, :coarc_asdcl_operator_npi, :coarc_primary_indication, :coarc_nature, :coarc_nature_post_prior_treatment, :coarc_min_diam_pre_proc, :coarc_peak_sys_gradient_pre, :coarc_min_diam_post_proc, :coarc_peak_sys_gradient_post, :coarc_aortic_obstruction_yn, :coarc_arch_treated_yn, :coarc_ao_obstruction_pre_sys_gradient, :coarc_ao_obstruction_post_sys_gradient, :"coarc_notes,", :""])
  end
end
