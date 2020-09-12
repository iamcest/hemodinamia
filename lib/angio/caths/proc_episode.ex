defmodule Angio.Caths.Proc_episode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proc_episodes" do
    field(:proc_epis_art_access_l_brachial, :string)
    field(:proc_epis_art_access_l_femoral, :string)
    field(:proc_epis_art_access_l_radial, :string)
    field(:proc_epis_art_access_r_brachial, :string)
    field(:proc_epis_art_access_r_femoral, :string)
    field(:caepsds_art_access_r_radial, :string)
    field(:proc_epis_catheter_l_name, :string)
    field(:proc_epis_catheter_l_size, :string)
    field(:proc_epis_catheter_lv_name, :string)
    field(:proc_epis_catheter_lv_size, :string)
    field(:proc_epis_catheter_r_name, :string)
    field(:proc_epis_catheter_r_size, :string)
    field(:proc_epis_closure_device, :string)
    field(:proc_epis_contrast_name, :string)
    field(:proc_epis_contrast_volume, :string)
    field(:proc_epis_cor_machine, :string)
    field(:proc_epis_cor_machine_id, :string)
    field(:proc_epis_cor_machine_loc, :string)
    field(:proc_epis_icd10_pcs_1, :string)
    field(:proc_epis_icd10_pcs_2, :string)
    field(:proc_epis_icd10_pcs_3, :string)
    field(:proc_epis_icd10_pcs_4, :string)
    field(:proc_epis_notes, :string)
    field(:proc_epis_prim_operator_lname, :string)
    field(:proc_epis_prim_operator_mname, :string)
    field(:proc_epis_prim_operator_npi, :string)
    field(:proc_epis_prim_operetor_fname, :string)
    field(:proc_epis_refer_person, :string)
    field(:proc_epis_request_dt, :date)
    field(:proc_epis_request_tm, :time)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(proc_episode, attrs) do
    proc_episode
    |> cast(attrs, [
      :proc_epis_request_dt,
      :proc_epis_request_tm,
      :proc_epis_cor_machine,
      :proc_epis_cor_machine_loc,
      :proc_epis_cor_machine_id,
      :proc_epis_refer_person,
      :proc_epis_prim_operetor_fname,
      :proc_epis_prim_operator_lname,
      :proc_epis_prim_operator_mname,
      :proc_epis_prim_operator_npi,
      :proc_epis_art_access_r_femoral,
      :proc_epis_art_access_l_femoral,
      :proc_epis_art_access_r_brachial,
      :proc_epis_art_access_l_brachial,
      :caepsds_art_access_r_radial,
      :proc_epis_art_access_l_radial,
      :proc_epis_closure_device,
      :proc_epis_icd10_pcs_1,
      :proc_epis_icd10_pcs_2,
      :proc_epis_icd10_pcs_3,
      :proc_epis_icd10_pcs_4,
      :proc_epis_contrast_volume,
      :proc_epis_contrast_name,
      :proc_epis_catheter_l_name,
      :proc_epis_catheter_l_size,
      :proc_epis_catheter_r_name,
      :proc_epis_catheter_r_size,
      :proc_epis_catheter_lv_name,
      :proc_epis_catheter_lv_size,
      :proc_epis_notes
    ])
    |> validate_required([])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :proc_episodes_info_coronary_id_index,
      message: "Error: Record For  in table  Proc Episodes - Details Was completed"
    )

    # |> validate_required([:proc_epis_request_dt, :proc_epis_request_tm, :proc_epis_cor_machine, :proc_epis_cor_machine_loc, :proc_epis_cor_machine_id, :proc_epis_refer_person, :proc_epis_prim_operetor_fname, :proc_epis_prim_operator_lname, :proc_epis_prim_operator_mname, :proc_epis_prim_operator_npi, :proc_epis_art_access_r_femoral, :proc_epis_art_access_l_femoral, :proc_epis_art_access_r_brachial, :proc_epis_art_access_l_brachial, :proc_epis_art_access_r_radial, :proc_epis_art_access_l_radial, :proc_epis_closure_device, :proc_epis_icd10_pcs_1, :proc_epis_icd10_pcs_2, :proc_epis_icd10_pcs_3, :proc_epis_icd10_pcs_4, :proc_epis_contrast_volume, :proc_epis_contrast_name, :proc_epis_catheter_l_name, :proc_epis_catheter_l_size, :proc_epis_catheter_r_name, :proc_epis_catheter_r_size, :proc_epis_catheter_lv_name, :proc_epis_catheter_lv_size, :proc_epis_notes])
  end
end
