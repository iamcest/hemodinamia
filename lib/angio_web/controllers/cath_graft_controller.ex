defmodule AngioWeb.Cath_graftController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cath_graft
  alias Angio.Repo
  plug(:scrub_params, "cath_graft" when action in [:create, :update])

  def index(conn, _params) do
    cath_grafts = Caths.list_cath_grafts(conn)
    render(conn, "index.html", cath_grafts: cath_grafts)
  end

  def new(conn, _params) do
    changeset = Caths.change_cath_graft(%Cath_graft{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cath_graft" => cath_graft_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cath_grafts)
      |> Cath_graft.changeset(cath_graft_params)

    case Repo.insert(changeset) do
      {:ok, _cath_graft} ->
        conn
        |> put_flash(:info, "Graft created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_graft_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  ############################

  def show(conn, %{"id" => id}) do
    cath_graft = Caths.get_cath_graft!(id)
    render(conn, "show.html", cath_graft: cath_graft)
  end

  def edit(conn, %{"id" => id}) do
    cath_graft = Caths.get_cath_graft!(id)
    changeset = Caths.change_cath_graft(cath_graft)
    render(conn, "edit.html", cath_graft: cath_graft, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cath_graft" => cath_graft_params}) do
    cath_graft = Angio.Caths.get_cath_graft!(id)

    case Caths.update_cath_graft(cath_graft, cath_graft_params) do
      {:ok, _cath_grafts} ->
        conn
        |> put_flash(:info, " Graft updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_graft_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      #########################
      # info_coronary_id_str = conn.params["info_coronary_id"]
      # info_coronary_id = String.to_integer(info_coronary_id_str)

      # changeset =
      #  Cor_lesion.changeset(%Cor_lesion{}, cor_lesion_params)
      #  |> Ecto.Changeset.put_change(
      #    :info_coronary_id,
      #    info_coronary_id
      #  )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cath_graft: cath_graft, changeset: changeset)
    end
  end

  ##############################
  def delete(conn, %{"id" => id}) do
    cath_graft = Caths.get_cath_graft!(id)
    {:ok, _cath_graft} = Caths.delete_cath_graft(cath_graft)

    conn
    |> put_flash(:info, "Graft  deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_graft_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
