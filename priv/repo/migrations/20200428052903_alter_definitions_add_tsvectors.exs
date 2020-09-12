defmodule Angio.Repo.Migrations.AlterDefinitionsAddTsvectors do
  use Ecto.Migration

  def change do
    alter table(:definitions) do
      add :tsv_search, :tsvector

  end

  alter table(:defs_options) do
    add :tsv_search, :tsvector

end


create index(:definitions, [:tsv_search], name: :users_search_vector, using: "GIN")
create index(:defs_options, [:tsv_search], name: :defs_options_search_vector, using: "GIN")

execute(
  """
     CREATE FUNCTION create_search_data_definitions() RETURNS trigger AS $$
    begin
      new.tsv_search :=
        to_tsvector(
          'pg_catalog.english',
          coalesce(new.coding_instructions, ' ') || ' ' ||
          coalesce(new.name, ' ') || ' ' ||
          coalesce(new.support_definition, ' ') || ' ' ||
          coalesce(new.notes, ' ')
        );
      return new;
    end
    $$ LANGUAGE plpgsql;
  """)

  execute(
"""
  CREATE FUNCTION create_search_data_defs_options() RETURNS trigger AS $$
  begin
   new.tsv_search :=
     to_tsvector(
       'pg_catalog.english',
       coalesce(new.selection_definition, ' ') || ' ' ||
       coalesce(new.selection_notes , ' ') || ' ' ||
     );
   return new;
  end
 $$ LANGUAGE plpgsql;
""")

execute(
"""
    CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
    ON definitions FOR EACH ROW EXECUTE PROCEDURE create_search_data_definitions();
""")

execute(
"""
  CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
  ON defs_opt FOR EACH ROW EXECUTE PROCEDURE create_search_data_defs_options();
""")

end
end
