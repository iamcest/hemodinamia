defmodule Angio.Repo.Migrations.CreateDefsTable2 do
  use Ecto.Migration

  def change do
    create table(:defs_tables) do
      add(:cda_xml, :text)
      add(:code, :string)
      add(:code_system, :string)
      add(:code_system_name, :string)
      add(:display_name, :string)
      add(:name, :string)
      add(:note, :string)
      add(:template_id, :string)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
    end
  end
end
