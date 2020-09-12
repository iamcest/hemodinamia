defmodule Angio.Repo.Migrations.CreateDefsSentences do
  use Ecto.Migration

  def change do
    create table(:defs_sentences) do
      add :language, :string, size: 2
      add :sentence, :text
      add :note, :text
      add :definition_id, references(:definitions, on_delete: :delete_all)
    end
  end
end
