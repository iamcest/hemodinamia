defmodule Angio.Histories.Infect_history do
  use Ecto.Schema
  import Ecto.Changeset

  schema "infect_histories" do
    field(:infh_endocarditis_type, :string)
    field(:infh_endocarditis_yn, :boolean, default: false)
    field(:infh_hepatitis_b_yn, :boolean, default: false)
    field(:infh_hepatitis_c_yn, :boolean, default: false)
    field(:infh_histories_notes, :string)
    field(:infh_hiv_yn, :boolean, default: false)
    field(:infh_influenza_vacc_dt, :date)
    field(:infh_influenza_vacc_yn, :boolean, default: false)
    field(:infh_malaria_yn, :boolean, default: false)
    field(:infh_pneumococcal_vacc_dt, :date)
    field(:infh_pneumococcal_vacc_yn, :boolean, default: false)
    field(:infh_pneumonia_yn, :boolean, default: false)
    field(:infh_tubercolosis_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(infect_history, attrs) do
    infect_history
    |> cast(attrs, [
      :infh_endocarditis_yn,
      :infh_endocarditis_type,
      :infh_hepatitis_b_yn,
      :infh_hepatitis_c_yn,
      :infh_hiv_yn,
      :infh_malaria_yn,
      :infh_tubercolosis_yn,
      :infh_pneumonia_yn,
      :infh_influenza_vacc_dt,
      :infh_pneumococcal_vacc_dt,
      :infh_influenza_vacc_yn,
      :infh_pneumococcal_vacc_yn,
      :infh_histories_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :infect_histories_info_coronary_id_index,
      message: "Error: Record For  in table  Infection History Was completed"
    )

    # |> validate_required([:infh_endocarditis_yn, :infh_endocarditis_type, :infh_hepatitis_b_yn, :infh_hepatitis_c_yn, :infh_hiv_yn, :infh_malaria_yn, :infh_tubercolosis_yn, :infh_pneumonia_yn, :infh_influenza_vacc_dt, :infh_pneumococcal_vacc_dt, :infh_influenza_vacc_yn, :"", :infh_pneumococcal_vacc_yn, :infh_histories_notes])
  end
end
