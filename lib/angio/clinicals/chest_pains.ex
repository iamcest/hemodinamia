defmodule Angio.Clinicals.Chest_pains do
  use Ecto.Schema
  import Ecto.Changeset


  schema "chest_pain" do
    field :chestp_assoc_symptoms, :string
    field :chestp_dt, :date
    field :chestp_duration, :string
    field :chestp_location, :string
    field :chestp_notes, :string
    field :chestp_perciptating_factors, :string
    field :chestp_quality, :string
    field :chestp_relieving_factors, :string
    field :chestp_tm, :time
    field(:info_coronary_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(chest_pains, attrs) do
    chest_pains
    |> cast(attrs, [:chestp_dt,
                    :chestp_tm,
                    :chestp_location,
                    :chestp_quality,
                    :chestp_perciptating_factors,
                    :chestp_relieving_factors,
                    :chestp_assoc_symptoms,
                    :chestp_duration,
                    :chestp_notes
                    ])
    #|> validate_required([:chestp_dt, :chestp_tm, :chestp_location, :chestp_quality, :chestp_perciptating_factors, :chestp_relieving_factors, :chestp_assoc_symptoms, :chestp_duration, :chestp_notes])
    |> validate_required([])

  end
end
