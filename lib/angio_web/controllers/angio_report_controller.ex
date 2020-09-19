defmodule AngioWeb.Angio_reportController do
  use AngioWeb, :controller

  # alias Angio.Caths
  alias Angio.Canons.Language

  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:load_languages)

  @spec show(Plug.Conn.t(), any) :: Plug.Conn.t()

  def show(conn, _params) do
    render(conn, "show.html", conn.assigns[:languages])
  end

  def choose_report(
        conn,
        %{"choose_report" => %{"language" => language, "report" => report}} = params
      ) do
    info_coronary_id = params["info_coronary_id"]
    patient_id = params["patient_id"]

    case report do
      "demo_graphics" ->
        title = "Demographics"

        report_data = Angio.Canons.Report.make_patient_report(patient_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "clinical" ->
        title = "Clinical"
        report_data = Angio.Canons.Report.make_clinical(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "lesions" ->
        title = "Lesions"
        report_data = Angio.Canons.Report.make_lesions(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "grafts" ->
        title = "Grafts"

        report_data = Angio.Canons.Report.make_grafts(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "collaterals" ->
        title = "Collaterals"

        report_data = Angio.Canons.Report.make_collaterals(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "lventricle" ->
        title = "Left Ventricle"

        report_data = Angio.Canons.Report.make_lventricles(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "cath_events" ->
        title = "Cath Events - Complications"

        report_data = Angio.Canons.Report.make_cath_events(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "cath_meds" ->
        title = "Medications"

        report_data = Angio.Canons.Report.make_medications(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "radiations" ->
        title = "Radiation Data"

        report_data = Angio.Canons.Report.make_radiations(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "electrocardiogram" ->
        title = "ECG"

        report_data = Angio.Canons.Report.make_electrocardiograms(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "infect_history" ->
        title = "Infections"

        report_data = Angio.Canons.Report.make_infect_history(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "proc_episode" ->
        title = "Procedure Episode"

        report_data = Angio.Canons.Report.make_proc_episodes(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "asd_closure" ->
        title = "ASD Closure"

        report_data = Angio.Canons.Report.make_asd_closures(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "chd_condition" ->
        title = "Congenital Conditions"

        report_data = Angio.Canons.Report.make_chd_conditions(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "chd_risk_factor" ->
        title = "Congenital Risk Factors"

        report_data = Angio.Canons.Report.make_chd_risk_factors(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "lab_admission" ->
        title = "Lab Admission"

        report_data = Angio.Canons.Report.make_lab_admissions(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "cle_cardio" ->
        title = "Clinical Cardio Examination"

        report_data = Angio.Canons.Report.make_cle_cardio(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "functional_state" ->
        title = "Functional States"

        report_data = Angio.Canons.Report.make_functional_states(info_coronary_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      "ext_test" ->
        title = "Exercise Test"

        report_data = Angio.Canons.Report.make_ext_report(patient_id, language)
        render(conn, "show.html", report_data: report_data, title: title)

      #########################
      _ ->
        "Oppss.............."
    end

    # conn,
  end

  defp load_languages(conn, _) do
    query =
      Language
      |> Language.alphabetical()
      |> Language.names_and_codes()

    languages = Angio.Repo.all(query)
    assign(conn, :languages, languages)
  end
end
