defmodule AngioWeb.Cor_lesionController do
  use AngioWeb, :controller
  import AngioPlug

  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Cor_lesion
  # import Ecto.Query
  alias Angio.Repo
  plug(:scrub_params, "cor_lesion" when action in [:create, :update])

  def index(conn, _params) do
    cor_lesions = Caths.list_cor_lesions(conn)
    render(conn, "index.html", cor_lesions: cor_lesions)
  end

  def new(conn, _params) do
    changeset = Caths.change_cor_lesion(%Cor_lesion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cor_lesion" => cor_lesion_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cor_lesions)
      |> Cor_lesion.changeset(cor_lesion_params)

    case Repo.insert(changeset) do
      {:ok, _cor_lesion} ->
        conn
        |> put_flash(:info, "Lesion created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_lesion_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ###################
  end

  def show(conn, %{"id" => id}) do
    cor_lesion = Caths.get_cor_lesion!(id)
    render(conn, "show.html", cor_lesion: cor_lesion)
  end

  def edit(conn, %{"id" => id}) do
    cor_lesion = Caths.get_cor_lesion!(id)
    changeset = Caths.change_cor_lesion(cor_lesion)
    render(conn, "edit.html", cor_lesion: cor_lesion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cor_lesion" => cor_lesion_params}) do
    #################### 3
    cor_lesion = Angio.Caths.get_cor_lesion!(id)

    case Caths.update_cor_lesion(cor_lesion, cor_lesion_params) do
      {:ok, _cor_lesion} ->
        conn
        |> put_flash(:info, " Cor Lesion updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_lesion_path(
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
        render(conn, "edit.html", cor_lesion: cor_lesion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cor_lesion = Caths.get_cor_lesion!(id)
    {:ok, _cor_lesion} = Caths.delete_cor_lesion(cor_lesion)

    conn
    |> put_flash(:info, "Lesion  deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_lesion_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end

  ###################
end
