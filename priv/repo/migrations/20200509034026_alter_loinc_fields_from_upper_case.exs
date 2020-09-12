defmodule Angio.Repo.Migrations.AlterLoincFieldsFromUpperCase do
  use Ecto.Migration

  def change do

    rename table(:loincs), :ExternalCopyrightLink, to: :ExternalCopyrightlink
    rename table(:loincs), :PanelType, to: :paneltype
    rename table(:loincs), :AskAtOrderEntry, to: :askAtorderentry
    rename table(:loincs), :AssociatedObservations, to: :associatedobservations
    rename table(:loincs), :VersionFirstReleased, to: :versionfirstreleased
    rename table(:loincs), :ValidHL7AttachmentRequest, to: :validhl7attachmentrequest
    rename table(:loincs), :DisplayName, to: :displayname

  end
end
