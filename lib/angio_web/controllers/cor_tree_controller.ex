defmodule AngioWeb.Cor_treeController do
  use AngioWeb, :controller

  # alias Angio.Caths
  # alias Angio.Caths.Cor_tree
  # alias Angio.Caths.Cor_diagram_calcs

  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  def show(conn, params) do
    info_coronary_id = params["info_coronary_id"]
    patient_id = params["patient_id"]
    render(conn, "show.html", patient_id: patient_id, info_coronary_id: info_coronary_id)
  end
end
