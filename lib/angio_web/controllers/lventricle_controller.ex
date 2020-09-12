defmodule AngioWeb.LventricleController do
  use AngioWeb, :controller

  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Caths
  alias Angio.Caths.Lventricle
  alias Angio.Repo

  plug(:scrub_params, "lventricle" when action in [:create, :update])

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    lventricles = Caths.list_lventricles(conn)
    render(conn, "index.html", lventricles: lventricles)
  end

  def new(conn, _params) do
    changeset = Caths.change_lventricle(%Lventricle{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lventricle" => lventricle_params}) do
    #################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:lventricles)
      |> Lventricle.changeset(lventricle_params)

    case Repo.insert(changeset) do
      {:ok, _lventricle} ->
        conn
        |> put_flash(:info, "LV Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_lv_path(
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
    lventricle = Caths.get_lventricle!(id)
    render(conn, "show.html", lventricle: lventricle)
  end

  def edit(conn, %{"id" => id}) do
    lventricle = Caths.get_lventricle!(id)
    changeset = Caths.change_lventricle(lventricle)
    render(conn, "edit.html", lventricle: lventricle, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lventricle" => lventricle_params}) do
    lventricle = Caths.get_lventricle!(id)

    case Caths.update_lventricle(lventricle, lventricle_params) do
      {:ok, _lventricle} ->
        conn
        |> put_flash(:info, "Lventricle updated successfully.")
        # |> redirect(to: Routes.lventricle_path(conn, :show, lventricle))
        |> redirect(
          to:
            Routes.pt_angio_lv_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lventricle: lventricle, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lventricle = Caths.get_lventricle!(id)
    {:ok, _lventricle} = Caths.delete_lventricle(lventricle)

    conn
    |> put_flash(:info, "Lventricle deleted successfully.")
    # |> redirect(to: Routes.lventricle_path(conn, :index))
    |> redirect(
      to:
        Routes.pt_angio_lv_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
