defmodule Angio.Caths.Care_episode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "care_episodes" do
    field(:caepsds_arrival_dt, :date)
    field(:caepsds_arrival_location, :string)
    field(:caepsds_arrival_tm, :time)
    field(:caepsds_city, :string)
    field(:caepsds_institution_id, :string)
    field(:caepsds_notes, :string)
    field(:caepsds_phone_home, :string)
    field(:caepsds_phone_mobile, :string)
    field(:caepsds_photo, :binary)
    field(:caepsds_post_box, :string)
    field(:caepsds_provider_fname, :string)
    field(:caepsds_provider_lname, :string)
    field(:caepsds_provider_mname, :string)
    field(:caepsds_provider_npi, :string)
    field(:caepsds_street, :string)
    field(:caepsds_street_num, :string)
    field(:caepsds_telecom, :string)
    field(:caepsds_zip, :string)
    field(:caepsds_zip_na, :boolean, default: false)
    field(:parent_id, :integer)
    field(:patient_id, :integer)
    field(:pt_restriction_yn, :boolean, default: false)
    field(:uni_hic, :string)
    field(:uni_insurance, :string)
    field(:uni_insurance_non_us, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(care_episode, attrs) do
    care_episode
    |> cast(attrs, [
      :pt_restriction_yn,
      :caepsds_institution_id,
      :caepsds_phone_home,
      :caepsds_phone_mobile,
      :caepsds_telecom,
      :caepsds_photo,
      :caepsds_city,
      :caepsds_street,
      :caepsds_street_num,
      :caepsds_zip,
      :caepsds_zip_na,
      :caepsds_post_box,
      :caepsds_arrival_dt,
      :caepsds_arrival_tm,
      :caepsds_arrival_location,
      :uni_hic,
      :uni_insurance,
      :uni_insurance_non_us,
      :caepsds_provider_npi,
      :caepsds_provider_fname,
      :caepsds_provider_lname,
      :caepsds_provider_mname,
      :patient_id,
      :parent_id,
      :caepsds_notes
    ])
    |> validate_required([])

    # |> validate_required([:pt_restriction_yn, :caepsds_institution_id, :caepsds_phone_home, :caepsds_phone_mobile, :caepsds_telecom, :caepsds_photo, :caepsds_city, :caepsds_street, :caepsds_street_num, :caepsds_zip, :caepsds_zip_na, :caepsds_post_box, :caepsds_arrival_dt, :caepsds_arrival_tm, :caepsds_arrival_location, :uni_hic, :uni_insurance, :uni_insurance_non_us, :caepsds_provider_npi, :caepsds_provider_fname, :caepsds_provider_lname, :caepsds_provider_mname, :patient_id, :parent_id, :caepsds_notes])
  end
end
