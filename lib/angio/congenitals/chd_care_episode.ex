defmodule Angio.Congenitals.Chd_care_episode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chd_care_episodes" do
    field(:chd_arrival_dt, :date)
    field(:chd_cath_prior_recent_dt, :date)
    field(:chd_cath_proc_recent_1_id, :string)
    field(:chd_cath_proc_recent_2_id, :string)
    field(:chd_cath_proc_recent_3_id, :string)
    field(:chd_cath_proc_recent_4_id, :string)
    field(:chd_cath_proc_recent_id, {:array, :string})
    field(:chd_caths_prior_num, :string)
    field(:chd_caths_prior_yn, :boolean, default: false)
    field(:chd_country_of_residence, :string)
    field(:chd_episode_notes, :string)
    field(:chd_gestational_age, :string)
    field(:chd_premature_birth_yn, :boolean, default: false)
    field(:chd_pt_international_yn, :boolean, default: false)
    field(:chd_research_study_yn, :boolean, default: false)
    field(:chd_surg_prior_1_id, :string)
    field(:chd_surg_prior_2_id, :string)
    field(:chd_surg_prior_3_id, :string)
    field(:chd_surg_prior_4_id, :string)
    field(:chd_surg_prior_id, {:array, :string})
    field(:chd_surg_prior_num, :string)
    field(:chd_surg_prior_yn, :boolean, default: false)
    field(:chd_surg_recent_dt, :date)
    field(:chd_weight_at_birth, :string)
    field(:pt_restriction_yn, :boolean, default: false)
    field(:uni_hic_num, :string)
    field(:uni_insurance, :string)
    field(:uni_insurance_non_us, :boolean, default: false)
    field(:info_coronary_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(chd_care_episode, attrs) do
    chd_care_episode
    |> cast(attrs, [
      :pt_restriction_yn,
      :chd_research_study_yn,
      :chd_arrival_dt,
      :uni_insurance,
      :uni_insurance_non_us,
      :uni_hic_num,
      :chd_pt_international_yn,
      :chd_country_of_residence,
      :chd_caths_prior_yn,
      :chd_caths_prior_num,
      :chd_cath_prior_recent_dt,
      :chd_cath_proc_recent_id,
      :chd_cath_proc_recent_1_id,
      :chd_cath_proc_recent_2_id,
      :chd_cath_proc_recent_3_id,
      :chd_cath_proc_recent_4_id,
      :chd_premature_birth_yn,
      :chd_weight_at_birth,
      :chd_gestational_age,
      :chd_surg_prior_yn,
      :chd_surg_prior_num,
      :chd_surg_recent_dt,
      :chd_surg_prior_id,
      :chd_surg_prior_1_id,
      :chd_surg_prior_2_id,
      :chd_surg_prior_3_id,
      :chd_surg_prior_4_id,
      :chd_episode_notes
    ])
    |> validate_required([])

    # |> validate_required([:pt_restriction_yn, :chd_research_study_yn, :chd_arrival_dt, :uni_insurance, :uni_insurance_non_us, :uni_hic_num, :chd_pt_international_yn, :chd_country_of_residence, :chd_caths_prior_yn, :chd_caths_prior_num, :chd_cath_prior_recent_dt, :chd_cath_proc_recent_id, :chd_cath_proc_recent_1_id, :chd_cath_proc_recent_2_id, :chd_cath_proc_recent_3_id, :chd_cath_proc_recent_4_id, :chd_premature_birth_yn, :chd_weight_at_birth, :chd_gestational_age, :chd_surg_prior_yn, :chd_surg_prior_num, :chd_surg_recent_dt, :chd_surg_prior_id, :chd_surg_prior_1_id, :chd_surg_prior_2_id, :chd_surg_prior_3_id, :chd_surg_prior_4_id, :chd_episode_notes])
  end
end
