defmodule Angio.Repo.Migrations.AlterOptsSentencesAdddDefsOptionId do
  use Ecto.Migration

  def change do
    alter table(:opts_sentences) do
      add(:defs_option_id, references(:defs_options, on_delete: :delete_all))
    end
  end
end
