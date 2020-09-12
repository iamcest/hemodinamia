defmodule Angio.Cor_mediae.Cor_media do
  use Ecto.Schema
  import Ecto.Changeset
  # alias Angio.Caths.Info_coronary

  use Arc.Ecto.Schema

  schema "cor_mediae" do
    field(:desc, :string)
    field(:mime_name, Angio.CorMedia.Type)
    field(:mime_type, :string)
    field(:notes, :string)
    field(:patient_id, :integer)
    field(:radlex_1, :string)
    field(:radlex_2, :string)
    field(:reference, :string)
    field(:info_coronary_id, :integer)
    field(:uuid, :string)

    #  belongs_to :info_coronary, Info_coronary

    timestamps()
  end

  @doc false
  def changeset(cor_media, attrs) do
    cor_media
    |> Map.update(:uuid, Ecto.UUID.generate(), fn val -> val || Ecto.UUID.generate() end)
    |> cast(attrs, [
      :mime_type,
      :mime_name,
      :desc,
      :reference,
      :radlex_1,
      :radlex_2,
      :patient_id,
      :notes
    ])
    |> cast_attachments(attrs, [:mime_name])
    |> validate_required([])

    # |> validate_required([:mime_type, :mime_name, :desc, :reference, :radlex_1, :radlex_2, :patient_id, :notes])
  end
end
