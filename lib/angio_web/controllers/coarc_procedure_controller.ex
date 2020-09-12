defmodule AngioWeb.Coarc_procedureController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Coarc_procedure
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  plug(:scrub_params, "coarc_procedure" when action in [:create, :update])

  def index(conn, _params) do
    coarc_procedures = Interventions.list_coarc_procedures(conn)
    render(conn, "index.html", coarc_procedures: coarc_procedures)
  end

  def new(conn, _params) do
    changeset = Interventions.change_coarc_procedure(%Coarc_procedure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"coarc_procedure" => coarc_procedure_params}) do

    changeset =
    conn.assigns[:info_coronary]
    |> Ecto.build_assoc(:coarc_procedures)
    |> Coarc_procedure.changeset(coarc_procedure_params)

  case Repo.insert(changeset) do
    {:ok, _coarc_procedure} ->
      conn
      |> put_flash(:info, "Coarctation Porocedure Created successfully.")
      |> redirect(
        to:
          Routes.pt_angio_coarc_path(
            conn,
            :index,
            conn.assigns[:patient],
            conn.assigns[:info_coronary]
          )
      )

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
  end


  ##################
  end

  def show(conn, %{"id" => id}) do
    coarc_procedure = Interventions.get_coarc_procedure!(id)
    render(conn, "show.html", coarc_procedure: coarc_procedure)
  end

  def edit(conn, %{"id" => id}) do
    coarc_procedure = Interventions.get_coarc_procedure!(id)
    changeset = Interventions.change_coarc_procedure(coarc_procedure)
    render(conn, "edit.html", coarc_procedure: coarc_procedure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "coarc_procedure" => coarc_procedure_params}) do
    coarc_procedure = Interventions.get_coarc_procedure!(id)

    case Interventions.update_coarc_procedure(coarc_procedure, coarc_procedure_params) do
      {:ok, _coarc_procedure} ->
        conn
        |> put_flash(:info, "Coarc procedure updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_coarc_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )
        # |> redirect(to: Routes.coarc_procedure_path(conn, :show, coarc_procedure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", coarc_procedure: coarc_procedure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    coarc_procedure = Interventions.get_coarc_procedure!(id)
    {:ok, _coarc_procedure} = Interventions.delete_coarc_procedure(coarc_procedure)

    conn
    |> put_flash(:info, "Coarc procedure deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_coarc_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
    #|> redirect(to: Routes.coarc_procedure_path(conn, :index))
  end
end
