defmodule Angio.Repo.Migrations.CreateCoarcProcedures do
  use Ecto.Migration

  def change do
    create table(:coarc_procedures) do
      add :coarc_dt, :date
      add :coarc_tm, :time
      add :coarc_operator_lname, :string
      add :coarc_asdcl_operator_fname, :string
      add :coarc_asdcl_operator_mname, :string
      add :coarc_asdcl_operator_npi, :string
      add :coarc_primary_indication, :string
      add :coarc_nature, :string
      add :coarc_nature_post_prior_treatment, :string
      add :coarc_min_diam_pre_proc, :string
      add :coarc_peak_sys_gradient_pre, :string
      add :coarc_min_diam_post_proc, :string
      add :coarc_peak_sys_gradient_post, :string
      add :coarc_aortic_obstruction_yn, :boolean, default: false, null: false
      add :coarc_arch_treated_yn, :boolean, default: false, null: false
      add :coarc_ao_obstruction_pre_sys_gradient, :string
      add :coarc_ao_obstruction_post_sys_gradient, :string
      add :"coarc_notes,", :string
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()

    end

  end
end
