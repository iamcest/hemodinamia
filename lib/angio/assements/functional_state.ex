defmodule Angio.Assements.Functional_state do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functional_states" do
    field(:funs_basic_adl, :string)
    field(:funs_cognition_level, :string)
    field(:funs_frailty_scale_csha, :string)
    field(:funs_katz_index, :string)
    field(:funs_kccq12_score, :string)
    field(:funs_notes, :string)
    field(:funs_status_assess_dt, :date)
    field(:funs_stroke_rankin_dt, :date)
    field(:funs_stroke_rankin_modified, :string)
    field(:funs_walking_level, :string)
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(functional_state, attrs) do
    functional_state
    |> cast(attrs, [
      :funs_status_assess_dt,
      :funs_cognition_level,
      :funs_katz_index,
      :funs_frailty_scale_csha,
      :funs_stroke_rankin_dt,
      :funs_stroke_rankin_modified,
      :funs_kccq12_score,
      :funs_walking_level,
      :funs_basic_adl,
      :funs_notes
    ])
    # |> validate_required([:funs_status_assess_dt, :funs_cognition_level, :funs_katz_index, :funs_frailty_scale_csha, :funs_stroke_rankin_dt, :funs_stroke_rankin_modified, :funs_kccq12_score, :funs_walking_level, :funs_basic_adl, :funs_notes])
    |> validate_required([])
  end
end
