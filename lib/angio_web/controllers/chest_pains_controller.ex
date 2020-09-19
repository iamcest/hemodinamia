defmodule AngioWeb.Chest_painsController do
  use AngioWeb, :controller

  alias Angio.Clinicals
  alias Angio.Clinicals.Chest_pains
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  def index(conn, _params) do
    chest_pain = Clinicals.list_chest_pain(conn)
    render(conn, "index.html", chest_pain: chest_pain)
  end

  def new(conn, _params) do
    changeset = Clinicals.change_chest_pains(%Chest_pains{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chest_pains" => chest_pains_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:chest_pain)
      |> Chest_pains.changeset(chest_pains_params)

    # OR?????????
    # |> Chest_pain.changeset(chest_pains_params)
    case Repo.insert(changeset) do
      {:ok, _chest_pain} ->
        conn
        |> put_flash(:info, " Record For Evaluation of  Chest Pain created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chestp_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    #############
  end

  def show(conn, %{"id" => id}) do
    chest_pains = Clinicals.get_chest_pains!(id)
    render(conn, "show.html", chest_pains: chest_pains)
  end

  def edit(conn, %{"id" => id}) do
    chest_pains = Clinicals.get_chest_pains!(id)
    changeset = Clinicals.change_chest_pains(chest_pains)
    render(conn, "edit.html", chest_pains: chest_pains, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chest_pains" => chest_pains_params}) do
    chest_pains = Clinicals.get_chest_pains!(id)

    case Clinicals.update_chest_pains(chest_pains, chest_pains_params) do
      {:ok, _chest_pains} ->
        conn
        |> put_flash(:info, "Chest pains updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chestp_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.chest_pains_path(conn, :show, chest_pains))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chest_pains: chest_pains, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chest_pains = Clinicals.get_chest_pains!(id)
    {:ok, _chest_pains} = Clinicals.delete_chest_pains(chest_pains)

    conn
    |> put_flash(:info, "Record For Chest pain Evaluation deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_chestp_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
