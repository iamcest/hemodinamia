defmodule Angio.Repo.Migrations.CreateAvPlastiesInflations do
  use Ecto.Migration

  def change do
    create table(:av_plasties_inflations) do
      add :avpi_inflation_counter, :string
      add :avpi_balloon_technique, :string
      add :avpi_sb_bal_1_id, :string
      add :avpi_db_bal_2_id, :string
      add :avpi_stabilization_yn, :boolean, default: false, null: false
      add :avpi_max_inflation_pres, :string
      add :avp_bal_outcome, :string
      add :avpi_peak_sys_gradient_post, :string
      add :avpi_av_reg_degree_post, :string
      add :avpi_notes, :text
      add(:av_plasty_id, references(:av_plasties, on_delete: :delete_all))
      timestamps()
    end

  end
end
