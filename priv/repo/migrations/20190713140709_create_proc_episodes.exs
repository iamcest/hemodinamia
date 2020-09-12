defmodule Angio.Repo.Migrations.CreateProcEpisodes do
  use Ecto.Migration

  def change do
    create table(:proc_episodes) do
      add :proc_epis_request_dt, :date
      add :proc_epis_request_tm, :time
      add :proc_epis_cor_machine, :string, size: 50
      add :proc_epis_cor_machine_loc, :string, size: 50
      add :proc_epis_cor_machine_id, :string, size: 50
      add :proc_epis_refer_person, :string, size: 50
      add :proc_epis_prim_operetor_fname, :string, size: 50
      add :proc_epis_prim_operator_lname, :string, size: 50
      add :proc_epis_prim_operator_mname, :string, size: 50
      add :proc_epis_prim_operator_npi, :string, size: 50
      add :proc_epis_art_access_r_femoral, :string, size: 50
      add :proc_epis_art_access_l_femoral, :string, size: 50
      add :proc_epis_art_access_r_brachial, :string, size: 50
      add :proc_epis_art_access_l_brachial, :string, size: 50
      add :caepsds_art_access_r_radial, :string, size: 50
      add :proc_epis_art_access_l_radial, :string, size: 50
      add :proc_epis_closure_device, :string, size: 50
      add :proc_epis_icd10_pcs_1, :string, size: 50
      add :proc_epis_icd10_pcs_2, :string, size: 50
      add :proc_epis_icd10_pcs_3, :string, size: 50
      add :proc_epis_icd10_pcs_4, :string, size: 50
      add :proc_epis_contrast_volume, :string, size: 50
      add :proc_epis_contrast_name, :string, size: 50
      add :proc_epis_catheter_l_name, :string, size: 50
      add :proc_epis_catheter_l_size, :string, size: 50
      add :proc_epis_catheter_r_name, :string, size: 50
      add :proc_epis_catheter_r_size, :string, size: 50
      add :proc_epis_catheter_lv_name, :string, size: 50
      add :proc_epis_catheter_lv_size, :string, size: 50
      add :proc_epis_notes, :text
      add :info_coronary_id, references(:info_coronaries, on_delete: :delete_all)
      timestamps(type: :utc_datetime)
    end
  end
end
