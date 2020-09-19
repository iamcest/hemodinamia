defmodule AngioWeb.LoincControllerTest do
  use AngioWeb.ConnCase

  alias Angio.Medcodes

  @create_attrs %{
    component: "some component",
    method_typ: "some method_typ",
    loinc_num: "some loinc_num",
    order_obs: "some order_obs",
    hl7_field_subfield_id: "some hl7_field_subfield_id",
    time_aspct: "some time_aspct",
    exmpl_answers: "some exmpl_answers",
    class: "some class",
    classtype: 42,
    shortname: "some shortname",
    survey_quest_src: "some survey_quest_src",
    ExternalCopyrightLink: "some ExternalCopyrightLink",
    species: "some species",
    example_ucum_units: "some example_ucum_units",
    hl7_attachment_structure: "some hl7_attachment_structure",
    cdisc_common_tests: "some cdisc_common_tests",
    change_reason_public: "some change_reason_public",
    DisplayName: "some DisplayName",
    common_si_test_rank: 42,
    scale_typ: "some scale_typ",
    status: "some status",
    property: "some property",
    versionlastchanged: "some versionlastchanged",
    common_order_rank: 42,
    ValidHL7AttachmentRequest: "some ValidHL7AttachmentRequest",
    unitsandrange: "some unitsandrange",
    definitiondescription: "some definitiondescription",
    common_test_rank: 42,
    chng_type: "some chng_type",
    example_si_ucum_units: "some example_si_ucum_units",
    AssociatedObservations: "some AssociatedObservations",
    PanelType: "some PanelType",
    status_text: "some status_text",
    submitted_units: "some submitted_units",
    unitsrequired: "some unitsrequired",
    system: "some system",
    formula: "some formula",
    long_common_name: "some long_common_name",
    AskAtOrderEntry: "some AskAtOrderEntry",
    survey_quest_text: "some survey_quest_text",
    status_reason: "some status_reason",
    example_units: "some example_units",
    relatednames2: "some relatednames2",
    VersionFirstReleased: "some VersionFirstReleased",
    external_copyright_notice: "some external_copyright_notice",
    consumer_name: "some consumer_name"
  }
  @update_attrs %{
    component: "some updated component",
    method_typ: "some updated method_typ",
    loinc_num: "some updated loinc_num",
    order_obs: "some updated order_obs",
    hl7_field_subfield_id: "some updated hl7_field_subfield_id",
    time_aspct: "some updated time_aspct",
    exmpl_answers: "some updated exmpl_answers",
    class: "some updated class",
    classtype: 43,
    shortname: "some updated shortname",
    survey_quest_src: "some updated survey_quest_src",
    ExternalCopyrightLink: "some updated ExternalCopyrightLink",
    species: "some updated species",
    example_ucum_units: "some updated example_ucum_units",
    hl7_attachment_structure: "some updated hl7_attachment_structure",
    cdisc_common_tests: "some updated cdisc_common_tests",
    change_reason_public: "some updated change_reason_public",
    DisplayName: "some updated DisplayName",
    common_si_test_rank: 43,
    scale_typ: "some updated scale_typ",
    status: "some updated status",
    property: "some updated property",
    versionlastchanged: "some updated versionlastchanged",
    common_order_rank: 43,
    ValidHL7AttachmentRequest: "some updated ValidHL7AttachmentRequest",
    unitsandrange: "some updated unitsandrange",
    definitiondescription: "some updated definitiondescription",
    common_test_rank: 43,
    chng_type: "some updated chng_type",
    example_si_ucum_units: "some updated example_si_ucum_units",
    AssociatedObservations: "some updated AssociatedObservations",
    PanelType: "some updated PanelType",
    status_text: "some updated status_text",
    submitted_units: "some updated submitted_units",
    unitsrequired: "some updated unitsrequired",
    system: "some updated system",
    formula: "some updated formula",
    long_common_name: "some updated long_common_name",
    AskAtOrderEntry: "some updated AskAtOrderEntry",
    survey_quest_text: "some updated survey_quest_text",
    status_reason: "some updated status_reason",
    example_units: "some updated example_units",
    relatednames2: "some updated relatednames2",
    VersionFirstReleased: "some updated VersionFirstReleased",
    external_copyright_notice: "some updated external_copyright_notice",
    consumer_name: "some updated consumer_name"
  }
  @invalid_attrs %{
    component: nil,
    method_typ: nil,
    loinc_num: nil,
    order_obs: nil,
    hl7_field_subfield_id: nil,
    time_aspct: nil,
    exmpl_answers: nil,
    class: nil,
    classtype: nil,
    shortname: nil,
    survey_quest_src: nil,
    ExternalCopyrightLink: nil,
    species: nil,
    example_ucum_units: nil,
    hl7_attachment_structure: nil,
    cdisc_common_tests: nil,
    change_reason_public: nil,
    DisplayName: nil,
    common_si_test_rank: nil,
    scale_typ: nil,
    status: nil,
    property: nil,
    versionlastchanged: nil,
    common_order_rank: nil,
    ValidHL7AttachmentRequest: nil,
    unitsandrange: nil,
    definitiondescription: nil,
    common_test_rank: nil,
    chng_type: nil,
    example_si_ucum_units: nil,
    AssociatedObservations: nil,
    PanelType: nil,
    status_text: nil,
    submitted_units: nil,
    unitsrequired: nil,
    system: nil,
    formula: nil,
    long_common_name: nil,
    AskAtOrderEntry: nil,
    survey_quest_text: nil,
    status_reason: nil,
    example_units: nil,
    relatednames2: nil,
    VersionFirstReleased: nil,
    external_copyright_notice: nil,
    consumer_name: nil
  }

  def fixture(:loinc) do
    {:ok, loinc} = Medcodes.create_loinc(@create_attrs)
    loinc
  end

  describe "index" do
    test "lists all loincs", %{conn: conn} do
      conn = get(conn, Routes.loinc_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Loincs"
    end
  end

  describe "new loinc" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.loinc_path(conn, :new))
      assert html_response(conn, 200) =~ "New Loinc"
    end
  end

  describe "create loinc" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.loinc_path(conn, :create), loinc: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.loinc_path(conn, :show, id)

      conn = get(conn, Routes.loinc_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Loinc"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.loinc_path(conn, :create), loinc: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Loinc"
    end
  end

  describe "edit loinc" do
    setup [:create_loinc]

    test "renders form for editing chosen loinc", %{conn: conn, loinc: loinc} do
      conn = get(conn, Routes.loinc_path(conn, :edit, loinc))
      assert html_response(conn, 200) =~ "Edit Loinc"
    end
  end

  describe "update loinc" do
    setup [:create_loinc]

    test "redirects when data is valid", %{conn: conn, loinc: loinc} do
      conn = put(conn, Routes.loinc_path(conn, :update, loinc), loinc: @update_attrs)
      assert redirected_to(conn) == Routes.loinc_path(conn, :show, loinc)

      conn = get(conn, Routes.loinc_path(conn, :show, loinc))
      assert html_response(conn, 200) =~ "some updated component"
    end

    test "renders errors when data is invalid", %{conn: conn, loinc: loinc} do
      conn = put(conn, Routes.loinc_path(conn, :update, loinc), loinc: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Loinc"
    end
  end

  describe "delete loinc" do
    setup [:create_loinc]

    test "deletes chosen loinc", %{conn: conn, loinc: loinc} do
      conn = delete(conn, Routes.loinc_path(conn, :delete, loinc))
      assert redirected_to(conn) == Routes.loinc_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.loinc_path(conn, :show, loinc))
      end)
    end
  end

  defp create_loinc(_) do
    loinc = fixture(:loinc)
    {:ok, loinc: loinc}
  end
end
