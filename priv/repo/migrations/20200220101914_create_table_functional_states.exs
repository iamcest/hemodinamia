defmodule Angio.Repo.Migrations.CreateTableFunctionalStates do
  use Ecto.Migration

  def change do
    create table(:functional_states) do
      add(:funs_status_assess_dt, :date)
      add(:funs_cognition_level, :string, size: 50)
      add(:funs_katz_index, :string, size: 50)
      add(:funs_frailty_scale_csha, :string, size: 50)
      add(:funs_stroke_rankin_dt, :date)
      add(:funs_stroke_rankin_modified, :string, size: 50)
      add(:funs_kccq12_score, :string, size: 50)
      add(:funs_walking_level, :string, size: 50)
      add(:funs_basic_adl, :date)
      add(:funs_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
