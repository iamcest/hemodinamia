defmodule Angio.Repo.Migrations.CreateOptsSentences do
  use Ecto.Migration

  def change do
    create table(:opts_sentences) do
      add :language, :string
      add :sentence, :text
      add :note, :text
      add :definition_id, :integer

      timestamps()
    end
  end
end
