defmodule Angio.Repo.Migrations.CreateTableCorLesions do
  use Ecto.Migration

  def change do
    create table(:cor_lesions) do
      add(:cor_les_pct, :string, size: 10)
      add(:cor_les_major_branch, :string, size: 10)
      add(:cor_les_seg_ncdr, {:array, :string})
      add(:cor_les_seg_cdisc, {:array, :string})
      add(:cor_les_seg_sts, {:array, :string})
      ## Note in mix.gen.html put cor_les_seg_cdisc:array:string
      add(:cor_les_vessel_size, :string, size: 10)
      add(:cor_les_type_scai, :string, size: 10)
      add(:cor_les_type_aha, :string, size: 10)
      add(:cor_les_length, :string, size: 10)
      add(:cor_les_chronic_total_yn, :boolean, null: false, default: false)
      add(:cor_les_ostial_loc, :string, size: 10)
      add(:cor_les_calcium_yn, :boolean, null: false, default: false)
      add(:cor_les_thrombus_yn, :boolean, null: false, default: false)
      add(:cor_les_bifurcation_yn, :boolean, null: false, default: false)
      add(:cor_les_tandem_yn, :boolean, null: false, default: false)
      add(:cor_les_aneurysm_yn, :boolean, null: false, default: false)
      add(:cor_les_protected_yn, :boolean, null: false, default: false)
      add(:cor_les_graft_pct, :string, size: 10)
      add(:cor_les_prior_treated_yn, :boolean, null: false, default: false)
      add(:cor_les_prior_treated_other, :string, size: 10)
      add(:cor_les_prior_treated_dt, :date)
      add(:cor_les_prior_stent_yn, :boolean, null: false, default: false)
      add(:cor_les_stent_dt, :date)
      add(:cor_les_stent_pct, :string, size: 10)
      add(:cor_les_ffr, :string, size: 10)
      add(:cor_les_ivus, :string, size: 10)
      add(:cor_les_counter, :integer)
      add(:patient_id, :integer)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
