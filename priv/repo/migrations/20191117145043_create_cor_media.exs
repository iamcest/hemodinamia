defmodule Angio.Repo.Migrations.CreateCorMedia do
  use Ecto.Migration

  def change do
    create table(:cor_mediae) do
      add(:mime_type, :string)
      add(:mime_name, :string)
      add(:desc, :text)
      add :reference, :string
      add(:radlex_1, :string)
      add(:radlex_2, :string)
      add(:patient_id, :integer)
      add(:notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
