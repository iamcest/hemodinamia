defmodule Angio.Persons.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field(:pacntcts_address, :string)
    field(:pacntcts_fname, :string)
    field(:pacntcts_lname, :string)
    field(:pacntcts_mname, :string)
    field(:pacntcts_notes, :string)
    field(:pacntcts_organization, :string)
    field(:pacntcts_period, :string)
    field(:pacntcts_period_end, :date)
    field(:pacntcts_period_start, :date)
    field(:pacntcts_relationship, :string)
    field(:pacntcts_ssn, :string)
    field(:pacntcts_telecom, :string)
    field(:patient_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [
      :pacntcts_lname,
      :pacntcts_fname,
      :pacntcts_mname,
      :pacntcts_ssn,
      :pacntcts_address,
      :pacntcts_telecom,
      :pacntcts_relationship,
      :pacntcts_organization,
      :pacntcts_period_start,
      :pacntcts_period_end,
      :pacntcts_period,
      :pacntcts_notes
    ])
    |> validate_required([])

    # |> validate_required([:pacntcts_lname, :pacntcts_fname, :pacntcts_mname, :pacntcts_ssn, :pacntcts_address, :pacntcts_telecom, :pacntcts_relationship, :pacntcts_organization, :pacntcts_period_start, :pacntcts_period_end, :pacntcts_period, :pacntcts_notes])
  end
end
