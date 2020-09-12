defmodule AngioWeb.CorDiagramResolver do
  # alias Angio.Repo
  # alias Angio.Persons.Patient
  ##################################
  def get_info_coronary(_parent, %{id: id}, _resolution) do
    case Angio.Caths.get_info_coronary!(id) do
      nil ->
        {:error, "Info ID:  #{id} not found"}

      info_diagram ->
        {:ok, info_diagram}
    end

    # case
  end

  ##################################
end
