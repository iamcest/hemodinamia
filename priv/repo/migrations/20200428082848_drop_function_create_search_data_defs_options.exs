defmodule Angio.Repo.Migrations.DropFunctionCreateSearchDataDefsOptions do
  use Ecto.Migration

  def change do
    execute(
      """
      DROP FUNCTION  IF EXISTS create_search_data_defs_options() CASCADE;
      """
    )

    execute(
      """
        CREATE FUNCTION create_search_data_defs_options() RETURNS trigger AS $$
        begin
         new.tsv_search :=
           to_tsvector(
             'pg_catalog.english',
             coalesce(new.selection_definition, ' ') || ' ' ||
             coalesce(new.selection_notes , ' ')
           );
         return new;
        end
       $$ LANGUAGE plpgsql;
      """)
  end
end
