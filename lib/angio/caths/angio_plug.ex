defmodule AngioPlug do
  use Plug.Builder

  alias Angio.Repo
  alias Angio.Persons.Patient
  alias Angio.Caths.Info_coronary
  alias Angio.Interventions.Coarc_procedure
  alias Angio.Interventions.Av_plasty
  alias Angio.Interventions.Pci_procedure
  alias Angio.Canons.Country
  alias Angio.Ivestigations.Cardiac_echo

  plug(:assign_patient)
  plug(:assign_info_coronary)
  plug(:assign_languages)
  plug(:assign_definition)
  plug(:assign_countries)
  plug(:assign_coarc_procedure)
  plug(:assign_av_plasty)
  plug(:assign_pci_procedure)
  plug(:assign_cardiac_echo)

  def assign_definition(conn, _opts) do
    case conn.params do
      %{"definition_id" => definition_id} ->
        case Angio.Repo.get(Angio.Canons.Definition, definition_id) do
          # nil -> invalid_user(conn)
          definition ->
            assign(conn, :definition, definition)
        end

      _ ->
        conn
    end
  end

  def assign_patient(conn, _opts) do
    case conn.params do
      %{"patient_id" => patient_id} ->
        case Angio.Repo.get(Patient, patient_id) do
          # nil -> invalid_user(conn)
          patient ->
            assign(conn, :patient, patient)
        end

      _ ->
        conn
        |> send_resp(404, "Not Found")
        |> halt()
    end
  end

  def assign_info_coronary(conn, _opts) do
    case conn.params do
      %{"info_coronary_id" => info_coronary_id} ->
        case Repo.get(Info_coronary, info_coronary_id) do
          info_coronary ->
            assign(conn, :info_coronary, info_coronary)
        end

      _ ->
        conn
    end
  end

  #############
  def assign_coarc_procedure(conn, _opts) do
    case conn.params do
      %{"coarc_procedure_id" => coarc_procedure_id} ->
        case Repo.get(Coarc_procedure, coarc_procedure_id) do
          coarc_procedure ->
            assign(conn, :coarc_procedure, coarc_procedure)
        end

      _ ->
        conn
        |> send_resp(404, "Coarctation Procedure Not Found")
        |> halt()
    end
  end

  #############

  @spec assign_av_plasty(Plug.Conn.t(), any) :: Plug.Conn.t()
  def assign_av_plasty(conn, _opts) do
    case conn.params do
      %{"av_plasty_id" => av_plasty_id} ->
        case Repo.get(Av_plasty, av_plasty_id) do
          av_plasty ->
            assign(conn, :av_plasty, av_plasty)
        end

      _ ->
        conn
        |> send_resp(404, "Aortic Valvuloplasty Record  Not Found")
        |> halt()
    end
  end

  #####################
  def assign_pci_procedure(conn, _opts) do
    case conn.params do
      %{"pci_procedure_id" => pci_procedure_id} ->
        case Repo.get(Pci_procedure, pci_procedure_id) do
          pci_procedure ->
            assign(conn, :pci_procedure, pci_procedure)
        end

      _ ->
        conn
        |> send_resp(404, "PCI PROCEDURE Record  Not Found")
        |> halt()
    end
  end

  #############
  def assign_cardiac_echo(conn, _opts) do
    case conn.params do
      %{"cardiac_echo_id" => cardiac_echo_id} ->
        case Repo.get(Cardiac_echo, cardiac_echo_id) do
          cardiac_echo ->
            assign(conn, :cardiac_echo, cardiac_echo)
        end

      _ ->
        conn
        |> send_resp(404, "Cardiac Echo  Record  Not Found")
        |> halt()
    end
  end

  #############

  def assign_languages(conn, _) do
    case conn.params do
      %{"language_id" => language_id} ->
        case Repo.get(Language, language_id) do
          languages ->
            assign(conn, :languages, languages)
        end

      _ ->
        conn
    end
  end

  ###################
  def assign_countries(conn, _) do
    case conn.params do
      %{"value_id" => value_id} ->
        case Repo.get(Country, value_id) do
          countries ->
            assign(conn, :countries, countries)
        end

      _ ->
        conn
        |> send_resp(404, "Not Found")
        |> halt()
    end
  end

  ###################
end

# module
