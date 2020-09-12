defmodule AngioWeb.Cor_anatomyController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Repo

  alias Angio.Caths.Cor_anatomy
  plug(:scrub_params, "cor_anatomy" when action in [:create, :update])

  def index(conn, _params) do
    cor_anatomies = Caths.list_cor_anatomies(conn)
    render(conn, "index.html", cor_anatomies: cor_anatomies)
  end

  def new(conn, _params) do
    changeset = Caths.change_cor_anatomy(%Cor_anatomy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cor_anatomy" => cor_anatomy_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cor_anatomies)
      |> Cor_anatomy.changeset(cor_anatomy_params)

    case Repo.insert(changeset) do
      {:ok, _cor_anatomy} ->
        conn
        |> put_flash(:info, "Anatomy created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_anatomy_path(
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

  ######################### 3
  def show(conn, %{"id" => id}) do
    cor_anatomy = Caths.get_cor_anatomy!(id)
    render(conn, "show.html", cor_anatomy: cor_anatomy)
  end

  def edit(conn, %{"id" => id}) do
    cor_anatomy = Caths.get_cor_anatomy!(id)
    changeset = Caths.change_cor_anatomy(cor_anatomy)
    render(conn, "edit.html", cor_anatomy: cor_anatomy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cor_anatomy" => cor_anatomy_params}) do
    cor_anatomy = Caths.get_cor_anatomy!(id)

    case Caths.update_cor_anatomy(cor_anatomy, cor_anatomy_params) do
      {:ok, _cor_anatomy} ->
        conn
        |> put_flash(:info, "Cor anatomy updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_anatomy_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.cor_anatomy_path(conn, :show, cor_anatomy))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cor_anatomy: cor_anatomy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cor_anatomy = Caths.get_cor_anatomy!(id)
    {:ok, _cor_anatomy} = Caths.delete_cor_anatomy(cor_anatomy)

    conn
    |> put_flash(:info, "Anatomy  deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_anatomy_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
