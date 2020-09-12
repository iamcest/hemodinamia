defmodule Angio.MedcodesTest do
  use Angio.DataCase

  alias Angio.Medcodes

  describe "loincs" do
    alias Angio.Medcodes.Loinc

    @valid_attrs %{component: "some component", method_typ: "some method_typ", loinc_num: "some loinc_num", order_obs: "some order_obs", hl7_field_subfield_id: "some hl7_field_subfield_id", time_aspct: "some time_aspct", exmpl_answers: "some exmpl_answers", class: "some class", classtype: 42, shortname: "some shortname", survey_quest_src: "some survey_quest_src", ExternalCopyrightLink: "some ExternalCopyrightLink", species: "some species", example_ucum_units: "some example_ucum_units", hl7_attachment_structure: "some hl7_attachment_structure", cdisc_common_tests: "some cdisc_common_tests", change_reason_public: "some change_reason_public", DisplayName: "some DisplayName", common_si_test_rank: 42, scale_typ: "some scale_typ", status: "some status", property: "some property", versionlastchanged: "some versionlastchanged", common_order_rank: 42, ValidHL7AttachmentRequest: "some ValidHL7AttachmentRequest", unitsandrange: "some unitsandrange", definitiondescription: "some definitiondescription", common_test_rank: 42, chng_type: "some chng_type", example_si_ucum_units: "some example_si_ucum_units", AssociatedObservations: "some AssociatedObservations", PanelType: "some PanelType", status_text: "some status_text", submitted_units: "some submitted_units", unitsrequired: "some unitsrequired", system: "some system", formula: "some formula", long_common_name: "some long_common_name", AskAtOrderEntry: "some AskAtOrderEntry", survey_quest_text: "some survey_quest_text", status_reason: "some status_reason", example_units: "some example_units", relatednames2: "some relatednames2", VersionFirstReleased: "some VersionFirstReleased", external_copyright_notice: "some external_copyright_notice", consumer_name: "some consumer_name"}
    @update_attrs %{component: "some updated component", method_typ: "some updated method_typ", loinc_num: "some updated loinc_num", order_obs: "some updated order_obs", hl7_field_subfield_id: "some updated hl7_field_subfield_id", time_aspct: "some updated time_aspct", exmpl_answers: "some updated exmpl_answers", class: "some updated class", classtype: 43, shortname: "some updated shortname", survey_quest_src: "some updated survey_quest_src", ExternalCopyrightLink: "some updated ExternalCopyrightLink", species: "some updated species", example_ucum_units: "some updated example_ucum_units", hl7_attachment_structure: "some updated hl7_attachment_structure", cdisc_common_tests: "some updated cdisc_common_tests", change_reason_public: "some updated change_reason_public", DisplayName: "some updated DisplayName", common_si_test_rank: 43, scale_typ: "some updated scale_typ", status: "some updated status", property: "some updated property", versionlastchanged: "some updated versionlastchanged", common_order_rank: 43, ValidHL7AttachmentRequest: "some updated ValidHL7AttachmentRequest", unitsandrange: "some updated unitsandrange", definitiondescription: "some updated definitiondescription", common_test_rank: 43, chng_type: "some updated chng_type", example_si_ucum_units: "some updated example_si_ucum_units", AssociatedObservations: "some updated AssociatedObservations", PanelType: "some updated PanelType", status_text: "some updated status_text", submitted_units: "some updated submitted_units", unitsrequired: "some updated unitsrequired", system: "some updated system", formula: "some updated formula", long_common_name: "some updated long_common_name", AskAtOrderEntry: "some updated AskAtOrderEntry", survey_quest_text: "some updated survey_quest_text", status_reason: "some updated status_reason", example_units: "some updated example_units", relatednames2: "some updated relatednames2", VersionFirstReleased: "some updated VersionFirstReleased", external_copyright_notice: "some updated external_copyright_notice", consumer_name: "some updated consumer_name"}
    @invalid_attrs %{component: nil, method_typ: nil, loinc_num: nil, order_obs: nil, hl7_field_subfield_id: nil, time_aspct: nil, exmpl_answers: nil, class: nil, classtype: nil, shortname: nil, survey_quest_src: nil, ExternalCopyrightLink: nil, species: nil, example_ucum_units: nil, hl7_attachment_structure: nil, cdisc_common_tests: nil, change_reason_public: nil, DisplayName: nil, common_si_test_rank: nil, scale_typ: nil, status: nil, property: nil, versionlastchanged: nil, common_order_rank: nil, ValidHL7AttachmentRequest: nil, unitsandrange: nil, definitiondescription: nil, common_test_rank: nil, chng_type: nil, example_si_ucum_units: nil, AssociatedObservations: nil, PanelType: nil, status_text: nil, submitted_units: nil, unitsrequired: nil, system: nil, formula: nil, long_common_name: nil, AskAtOrderEntry: nil, survey_quest_text: nil, status_reason: nil, example_units: nil, relatednames2: nil, VersionFirstReleased: nil, external_copyright_notice: nil, consumer_name: nil}

    def loinc_fixture(attrs \\ %{}) do
      {:ok, loinc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medcodes.create_loinc()

      loinc
    end

    test "list_loincs/0 returns all loincs" do
      loinc = loinc_fixture()
      assert Medcodes.list_loincs() == [loinc]
    end

    test "get_loinc!/1 returns the loinc with given id" do
      loinc = loinc_fixture()
      assert Medcodes.get_loinc!(loinc.id) == loinc
    end

    test "create_loinc/1 with valid data creates a loinc" do
      assert {:ok, %Loinc{} = loinc} = Medcodes.create_loinc(@valid_attrs)
      assert loinc.consumer_name == "some consumer_name"
      assert loinc.external_copyright_notice == "some external_copyright_notice"
      assert loinc.VersionFirstReleased == "some VersionFirstReleased"
      assert loinc.relatednames2 == "some relatednames2"
      assert loinc.example_units == "some example_units"
      assert loinc.status_reason == "some status_reason"
      assert loinc.survey_quest_text == "some survey_quest_text"
      assert loinc.AskAtOrderEntry == "some AskAtOrderEntry"
      assert loinc.long_common_name == "some long_common_name"
      assert loinc.formula == "some formula"
      assert loinc.system == "some system"
      assert loinc.unitsrequired == "some unitsrequired"
      assert loinc.submitted_units == "some submitted_units"
      assert loinc.status_text == "some status_text"
      assert loinc.PanelType == "some PanelType"
      assert loinc.AssociatedObservations == "some AssociatedObservations"
      assert loinc.example_si_ucum_units == "some example_si_ucum_units"
      assert loinc.chng_type == "some chng_type"
      assert loinc.common_test_rank == 42
      assert loinc.definitiondescription == "some definitiondescription"
      assert loinc.unitsandrange == "some unitsandrange"
      assert loinc.ValidHL7AttachmentRequest == "some ValidHL7AttachmentRequest"
      assert loinc.common_order_rank == 42
      assert loinc.versionlastchanged == "some versionlastchanged"
      assert loinc.property == "some property"
      assert loinc.status == "some status"
      assert loinc.scale_typ == "some scale_typ"
      assert loinc.common_si_test_rank == 42
      assert loinc.DisplayName == "some DisplayName"
      assert loinc.change_reason_public == "some change_reason_public"
      assert loinc.cdisc_common_tests == "some cdisc_common_tests"
      assert loinc.hl7_attachment_structure == "some hl7_attachment_structure"
      assert loinc.example_ucum_units == "some example_ucum_units"
      assert loinc.species == "some species"
      assert loinc.ExternalCopyrightLink == "some ExternalCopyrightLink"
      assert loinc.survey_quest_src == "some survey_quest_src"
      assert loinc.shortname == "some shortname"
      assert loinc.classtype == 42
      assert loinc.class == "some class"
      assert loinc.exmpl_answers == "some exmpl_answers"
      assert loinc.time_aspct == "some time_aspct"
      assert loinc.hl7_field_subfield_id == "some hl7_field_subfield_id"
      assert loinc.order_obs == "some order_obs"
      assert loinc.loinc_num == "some loinc_num"
      assert loinc.method_typ == "some method_typ"
      assert loinc.component == "some component"
    end

    test "create_loinc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medcodes.create_loinc(@invalid_attrs)
    end

    test "update_loinc/2 with valid data updates the loinc" do
      loinc = loinc_fixture()
      assert {:ok, %Loinc{} = loinc} = Medcodes.update_loinc(loinc, @update_attrs)
      assert loinc.consumer_name == "some updated consumer_name"
      assert loinc.external_copyright_notice == "some updated external_copyright_notice"
      assert loinc.VersionFirstReleased == "some updated VersionFirstReleased"
      assert loinc.relatednames2 == "some updated relatednames2"
      assert loinc.example_units == "some updated example_units"
      assert loinc.status_reason == "some updated status_reason"
      assert loinc.survey_quest_text == "some updated survey_quest_text"
      assert loinc.AskAtOrderEntry == "some updated AskAtOrderEntry"
      assert loinc.long_common_name == "some updated long_common_name"
      assert loinc.formula == "some updated formula"
      assert loinc.system == "some updated system"
      assert loinc.unitsrequired == "some updated unitsrequired"
      assert loinc.submitted_units == "some updated submitted_units"
      assert loinc.status_text == "some updated status_text"
      assert loinc.PanelType == "some updated PanelType"
      assert loinc.AssociatedObservations == "some updated AssociatedObservations"
      assert loinc.example_si_ucum_units == "some updated example_si_ucum_units"
      assert loinc.chng_type == "some updated chng_type"
      assert loinc.common_test_rank == 43
      assert loinc.definitiondescription == "some updated definitiondescription"
      assert loinc.unitsandrange == "some updated unitsandrange"
      assert loinc.ValidHL7AttachmentRequest == "some updated ValidHL7AttachmentRequest"
      assert loinc.common_order_rank == 43
      assert loinc.versionlastchanged == "some updated versionlastchanged"
      assert loinc.property == "some updated property"
      assert loinc.status == "some updated status"
      assert loinc.scale_typ == "some updated scale_typ"
      assert loinc.common_si_test_rank == 43
      assert loinc.DisplayName == "some updated DisplayName"
      assert loinc.change_reason_public == "some updated change_reason_public"
      assert loinc.cdisc_common_tests == "some updated cdisc_common_tests"
      assert loinc.hl7_attachment_structure == "some updated hl7_attachment_structure"
      assert loinc.example_ucum_units == "some updated example_ucum_units"
      assert loinc.species == "some updated species"
      assert loinc.ExternalCopyrightLink == "some updated ExternalCopyrightLink"
      assert loinc.survey_quest_src == "some updated survey_quest_src"
      assert loinc.shortname == "some updated shortname"
      assert loinc.classtype == 43
      assert loinc.class == "some updated class"
      assert loinc.exmpl_answers == "some updated exmpl_answers"
      assert loinc.time_aspct == "some updated time_aspct"
      assert loinc.hl7_field_subfield_id == "some updated hl7_field_subfield_id"
      assert loinc.order_obs == "some updated order_obs"
      assert loinc.loinc_num == "some updated loinc_num"
      assert loinc.method_typ == "some updated method_typ"
      assert loinc.component == "some updated component"
    end

    test "update_loinc/2 with invalid data returns error changeset" do
      loinc = loinc_fixture()
      assert {:error, %Ecto.Changeset{}} = Medcodes.update_loinc(loinc, @invalid_attrs)
      assert loinc == Medcodes.get_loinc!(loinc.id)
    end

    test "delete_loinc/1 deletes the loinc" do
      loinc = loinc_fixture()
      assert {:ok, %Loinc{}} = Medcodes.delete_loinc(loinc)
      assert_raise Ecto.NoResultsError, fn -> Medcodes.get_loinc!(loinc.id) end
    end

    test "change_loinc/1 returns a loinc changeset" do
      loinc = loinc_fixture()
      assert %Ecto.Changeset{} = Medcodes.change_loinc(loinc)
    end
  end
end
