defmodule Angio.Repo.Migrations.CreateAvPlasties do
  use Ecto.Migration

  def change do
    create table(:av_plasties) do
      add(:avp_dt, :date)
      add(:avp_tm, :time)
      add(:avp_operator_lname, :string)
      add(:avp_operator_fname, :string)
      add(:avp_operator_mname, :string)
      add(:avp_operator_npi, :string)
      add(:avp_primary_indication, :string)
      add(:avp_av_morphology, :string)
      add(:avp_av_reg_degree_pre, :string)
      add(:avp_av_ann_diam_us, :string)
      add(:avp_peak_sys_gradient_pre, :string)
      add(:avp_notes, :text)

      timestamps()
    end
  end
end
