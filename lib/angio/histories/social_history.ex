defmodule Angio.Histories.Social_history do
  use Ecto.Schema
  import Ecto.Changeset

  schema "social_histories" do
    field(:soh_alcohol_depend, :string)
    field(:soh_alcohol_depend_amount, :string)
    field(:soh_depressed_mood_yn, :boolean, default: false)
    field(:soh_education_level, :string)
    field(:soh_employ_status, :string)
    field(:soh_erectile_dysfunc_yn, :boolean, default: false)
    field(:soh_illicit_drug_yn, :boolean, default: false)
    field(:soh_life_expect_1yr_yn, :boolean, default: false)
    field(:soh_marital_status, :string)
    field(:soh_notes, :string)
    field(:soh_sleep_apnea_on_cpap_yn, :boolean, default: false)
    field(:soh_sleep_apnea_yn, :boolean, default: false)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(social_history, attrs) do
    social_history
    |> cast(attrs, [
      :soh_alcohol_depend,
      :soh_alcohol_depend_amount,
      :soh_employ_status,
      :soh_sleep_apnea_yn,
      :soh_depressed_mood_yn,
      :soh_illicit_drug_yn,
      :soh_erectile_dysfunc_yn,
      :soh_life_expect_1yr_yn,
      :soh_sleep_apnea_on_cpap_yn,
      :soh_marital_status,
      :soh_education_level,
      :soh_notes
    ])
    |> validate_required([])
    |> unique_constraint(:info_coronary_id,
      name: :social_histories_info_coronary_id_index,
      message: "Error: Record For  in table  Social History Was completed"
    )

    # |> validate_required([:soh_alcohol_depend, :soh_alcohol_depend_amount, :soh_employ_status, :soh_sleep_apnea_yn, :soh_depressed_mood_yn, :soh_illicit_drug_yn, :soh_erectile_dysfunc_yn, :soh_life_expect_1yr_yn, :soh_sleep_apnea_on_cpap_yn, :soh_marital_status, :soh_education_level, :soh_notes])
  end
end
