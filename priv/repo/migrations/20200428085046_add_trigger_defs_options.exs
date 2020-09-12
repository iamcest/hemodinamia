defmodule Angio.Repo.Migrations.AddTriggerDefsOptions do
  use Ecto.Migration

  def change do
    execute(
      """
        CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
        ON defs_options FOR EACH ROW EXECUTE PROCEDURE create_search_data_defs_options();
      """)

  end
end
