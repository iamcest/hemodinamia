defmodule Angio.Repo.Migrations.AlterLoincsFromUppdr do
  use Ecto.Migration

  def change do
    rename table(:loincs), :ExternalCopyrightlink, to: :externalcopyrightlink
    rename table(:loincs), :askAtorderentry, to: :askatorderentry
  end
end
