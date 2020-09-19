defmodule Angio.Medcodes.Loinc do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loincs" do
    field(:consumer_name, :string)
    field(:external_copyright_notice, :string)
    field(:versionfirstreleased, :string)
    field(:relatednames2, :string)
    field(:example_units, :string)
    field(:status_reason, :string)
    field(:survey_quest_text, :string)
    field(:askatorderentry, :string)
    field(:long_common_name, :string)
    field(:formula, :string)
    field(:system, :string)
    field(:unitsrequired, :string)
    field(:submitted_units, :string)
    field(:status_text, :string)
    field(:paneltype, :string)
    field(:associatedobservations, :string)
    field(:example_si_ucum_units, :string)
    field(:chng_type, :string)
    field(:common_test_rank, :integer)
    field(:definitiondescription, :string)
    field(:unitsandrange, :string)
    # field(:andrangeunits, :string)
    field(:validhl7attachmentrequest, :string)
    field(:common_order_rank, :integer)
    field(:versionlastchanged, :string)
    field(:property, :string)
    field(:status, :string)
    field(:scale_typ, :string)
    field(:common_si_test_rank, :integer)
    field(:displayname, :string)
    field(:change_reason_public, :string)
    field(:cdisc_common_tests, :string)
    field(:hl7_attachment_structure, :string)
    field(:example_ucum_units, :string)
    field(:species, :string)
    field(:externalcopyrightlink, :string)
    field(:survey_quest_src, :string)
    field(:shortname, :string)
    field(:classtype, :integer)
    field(:class, :string)
    field(:exmpl_answers, :string)
    field(:time_aspct, :string)
    field(:hl7_field_subfield_id, :string)
    field(:order_obs, :string)
    field(:loinc_num, :string)
    field(:method_typ, :string)
    field(:component, :string)
    # field(:tsv_search, Angio.TsVtector)

    # timestamps()
  end

  @doc false
  def changeset(loinc, attrs) do
    loinc
    |> cast(attrs, [
      :loinc_num,
      :component,
      :property,
      :time_aspct,
      :system,
      :scale_typ,
      :method_typ,
      :class,
      :versionlastchanged,
      :chng_type,
      :definitiondescription,
      :status,
      :consumer_name,
      :classtype,
      :formula,
      :species,
      :exmpl_answers,
      :survey_quest_text,
      :survey_quest_src,
      :unitsrequired,
      :submitted_units,
      :relatednames2,
      :shortname,
      :order_obs,
      :cdisc_common_tests,
      :hl7_field_subfield_id,
      :external_copyright_notice,
      :example_units,
      :long_common_name,
      # :andrangeunits,
      :example_ucum_units,
      :example_si_ucum_units,
      :status_reason,
      :status_text,
      :change_reason_public,
      :common_test_rank,
      :common_order_rank,
      :common_si_test_rank,
      :hl7_attachment_structure,
      :externalcopyrightlink,
      :paneltype,
      :askatorderentry,
      :associatedobservations,
      :versionfirstreleased,
      :validhl7attachmentrequest,
      :displayname
      # :tsv_search
    ])
    |> validate_required([])
  end
end
