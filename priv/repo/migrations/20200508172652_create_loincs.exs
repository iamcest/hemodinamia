defmodule Angio.Repo.Migrations.CreateLoincs do
  use Ecto.Migration

  def change do
    create table(:loincs) do
      add(:loinc_num, :string)
      add(:component, :string)
      add(:property, :string)
      add(:time_aspct, :string)
      add(:system, :string)
      add(:scale_typ, :string)
      add(:method_typ, :string)
      add(:class, :string)
      add(:versionlastchanged, :string)
      add(:chng_type, :string)
      add(:definitiondescription, :text)
      add(:status, :string)
      add(:consumer_name, :string)
      add(:classtype, :integer)
      add(:formula, :text)
      add(:species, :string)
      add(:exmpl_answers, :text)
      add(:survey_quest_text, :text)
      add(:survey_quest_src, :string)
      add(:unitsrequired, :string)
      add(:submitted_units, :string)
      add(:relatednames2, :text)
      add(:shortname, :string)
      add(:order_obs, :string)
      add(:cdisc_common_tests, :string)
      add(:hl7_field_subfield_id, :string)
      add(:external_copyright_notice, :text)
      add(:example_units, :string)
      add(:long_common_name, :string)
      add(:unitsandrange, :text)
      add(:example_ucum_units, :string)
      add(:example_si_ucum_units, :string)
      add(:status_reason, :string)
      add(:status_text, :text)
      add(:change_reason_public, :text)
      add(:common_test_rank, :integer)
      add(:common_order_rank, :integer)
      add(:common_si_test_rank, :integer)
      add(:hl7_attachment_structure, :string)
      add(:ExternalCopyrightLink, :string)
      add(:PanelType, :string)
      add(:AskAtOrderEntry, :string)
      add(:AssociatedObservations, :string)
      add(:VersionFirstReleased, :string)
      add(:ValidHL7AttachmentRequest, :string)
      add(:DisplayName, :string)
      add(:loinc_notes, :text)
      add(:tsv_search, :tsvector)

      timestamps()
    end

    create(index(:loincs, [:loinc_num]))

    execute("""
      CREATE FUNCTION create_loinc_data_tsv_search() RETURNS trigger AS $$
      begin
       new.tsv_search :=
         to_tsvector(
           'pg_catalog.english',
           coalesce(new.long_common_name, ' ') || ' ' ||
           coalesce(new.shortname , ' ')
         );
       return new;
      end
     $$ LANGUAGE plpgsql;
    """)

    execute("""
      CREATE TRIGGER loinc_tsv_search BEFORE INSERT OR UPDATE
      ON loincs FOR EACH ROW EXECUTE PROCEDURE create_loinc_data_tsv_search();
    """)

    execute("""
        CREATE INDEX loinc_tsv_search_idx ON loincs USING gin (to_tsvector('english'::regconfig, (tsv_search)::text));
    """)
  end
end
