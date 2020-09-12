defmodule AngioWeb.PatientResolver do
  alias Angio.Repo
  alias Angio.Persons.Patient
  # alias Angio.Canons.Query

  def all(_args, _info) do
    {:ok, Repo.all(Patient)}
  end

  #################

  def make_patient_report(_parent, %{id: id}, _resolution) do
    case Angio.Persons.get_patient!(id) do
      nil ->
        {:error, "Patient ID #{id} not found"}

      patient_report ->
        {:ok, patient_report}
    end

    # case
  end

  # do

  # make_patient_report
  #################
  def make_patient_overview(_parent, %{id: id}, _resolution) do
    case Angio.Persons.get_patient!(id) do
      nil ->
        {:error, "Patient ID #{id} not found"}

      patient_overview ->
        {:ok, patient_overview}
    end

    # case
  end

  #######################
end
