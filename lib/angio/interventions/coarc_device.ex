defmodule Angio.Interventions.Coarc_device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coarc_devices" do
    field :coarc_balloon_max_pres, :string
    field :coarc_balloon_outcome, :string
    field :coarc_balloon_purpose, :string
    field :coarc_device_counter, :string
    field :coarc_device_id, :string
    field :coarc_device_notes, :string
    field :coarc_device_type, :string
    field :coarc_stent_diam_min_assesed_yn, :boolean, default: false
    field :coarc_stent_diam_min_post, :string
    field :coarc_stent_outcome, :string
    field :coarc_procedure_id, :integer

    #belongs_to :coarc_procedure, EctoAssoc.Coarc_procedure  # this was added
    timestamps()
  end

  @doc false
  def changeset(coarc_device, attrs) do
    coarc_device
    |> cast(attrs, [:coarc_device_id,
    :coarc_device_type,
    :coarc_balloon_purpose,
    :coarc_balloon_max_pres,
    :coarc_balloon_outcome,
    :coarc_stent_outcome,
    :coarc_stent_diam_min_assesed_yn,
    :coarc_stent_diam_min_post,
    :coarc_device_counter,
      :coarc_device_notes,
      :coarc_procedure_id
    ])
    |> validate_required([])
    #|> validate_required([:coarc_device_id, :coarc_device_type, :coarc_balloon_purpose, :coarc_balloon_max_pres, :coarc_balloon_outcome, :coarc_stent_outcome, :coarc_stent_diam_min_assesed_yn, :coarc_stent_diam_min_post, :coarc_device_counter, :coarc_device_notes])
  end
end
