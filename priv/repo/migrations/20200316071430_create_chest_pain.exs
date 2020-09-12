defmodule Angio.Repo.Migrations.CreateChestPain do
  use Ecto.Migration

  def change do
    create table(:chest_pain) do
      add :chestp_dt, :date
      add :chestp_tm, :time
      add :chestp_location, :string
      add :chestp_quality, :string
      add :chestp_perciptating_factors, :string
      add :chestp_relieving_factors, :string
      add :chestp_assoc_symptoms, :string
      add :chestp_duration, :string
      add :chestp_notes, :text
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()

    end

  end
end
