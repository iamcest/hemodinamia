defmodule AngioWeb.PatientController do
  # import AngioWeb.Schema

  # action_fallback AngioWeb.FallbackController

  use AngioWeb, :controller
  alias Angio.Canons, as: Query

  alias Angio.{Persons, Persons.Patient, Canons.Language}
  plug(:load_languages when action in [:new, :create, :edit, :update])

  def index(conn, params) do
    page =
      Patient
      |> Patient.order_by_name()
      |> Angio.Repo.paginate(params)

    render(conn, "index.html", patients: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Persons.change_patient(%Patient{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"patient" => patient_params}) do
    case Persons.create_patient(patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: Routes.pt_path(conn, :show, patient))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Persons.get_patient!(id)
    render(conn, "show.html", patient: patient)
  end

  def edit(conn, %{"id" => id}) do
    patient = Persons.get_patient!(id)
    changeset = Persons.change_patient(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = Persons.get_patient!(id)

    case Persons.update_patient(patient, patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient updated successfully.")
        |> redirect(to: Routes.pt_path(conn, :show, patient))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", patient: patient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Persons.get_patient!(id)
    {:ok, _patient} = Persons.delete_patient(patient)

    conn
    |> put_flash(:info, "Patient deleted successfully.")
    |> redirect(to: Routes.pt_path(conn, :index))
  end

  # def search_info(conn, %{"search_info" => %{"field" => field#, "element" => element}} = params) do
  #    page = Query.search_table_elements(field, element)
  #   render(conn, SharedView, "_view_field_info.html", page: page)
  # end

  ##################
  defp load_languages(conn, _) do
    query =
      Language
      |> Language.alphabetical()
      |> Language.names_and_codes()

    languages = Angio.Repo.all(query)
    assign(conn, :languages, languages)
  end

  #################
  # def search_patients(
  #      conn,
  #      %{"search_patients" => %{"query" => query, "selection" => selection}} = params
  #   ) do
  # query = String.trim(query)
  #
  #   page =
  #    Query.search_a_patient(query, selection)
  #    |> Angio.Repo.paginate(params)

  # render(conn, "index.html", patients: page.entries, page: page)

  ############
  #  if length(page.entries) > 0 do
  #  render(conn, "index.html", patients: page.entries, page: page)
  # else
  #  render(conn,  AngioWeb.SharedView, "_nothing_found.html", query: query, selection: selection)
  # end ##if

  #############
  # end

  #######################
  def search_patients(
        conn,
        %{"search_patients" => %{"query" => query, "selection" => selection}} = params
      ) do
    query = String.trim(query)

    page =
      Query.search_a_patient(query, selection)
      |> Angio.Repo.paginate(params)

    render(conn, "index.html", patients: page.entries, page: page)

    ############
    #  if length(page.entries) > 0 do
    #  render(conn, "index.html", patients: page.entries, page: page)
    # else
    #  render(conn,  CorvesWeb.SharedView, "_nothing_found.html", query: query, selection: selection)
    # end ##if

    #############
  end

  #######################

  def demographic_report(conn, _result) do
    # render conn, "index.html", data
    # |> Absinthe.run(CorvesWeb.Schema)
    # |> Poison.decode!()
    # |> Map.get("patients")

    # |> Absinthe.run(CorvesWeb.Schema, variables: %{"id" => "bar"})
    # IO.puts "=============="
    # IO.inspect @graphql
    # IO.puts "=========================="
  end

  ####################

  def demographic_report(conn, _result) do
    # render conn, "index.html", data
    # |> Absinthe.run(AngioWeb.Schema)
    # |> Poison.decode!()
    # |> Map.get("patients")

    # |> Absinthe.run(AngioWeb.Schema, variables: %{"id" => "bar"})
    # IO.puts "=============="
    # IO.inspect @graphql
    # IO.puts "=========================="
  end

  ###########################
end
