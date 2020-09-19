defmodule AngioWeb.Av_plastyController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Av_plasty
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  plug(:scrub_params, "av_plasty" when action in [:create, :update])

  def index(conn, _params) do
    av_plasties = Interventions.list_av_plasties(conn)
    render(conn, "index.html", av_plasties: av_plasties)
  end

  def new(conn, _params) do
    changeset = Interventions.change_av_plasty(%Av_plasty{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"av_plasty" => av_plasty_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:av_plasties)
      |> Av_plasty.changeset(av_plasty_params)

    case Repo.insert(changeset) do
      {:ok, _av_plasty} ->
        conn
        |> put_flash(:info, "Coarctation Porocedure Created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_avp_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ########### 3
  end

  def show(conn, %{"id" => id}) do
    av_plasty = Interventions.get_av_plasty!(id)
    render(conn, "show.html", av_plasty: av_plasty)
  end

  def edit(conn, %{"id" => id}) do
    av_plasty = Interventions.get_av_plasty!(id)
    changeset = Interventions.change_av_plasty(av_plasty)
    render(conn, "edit.html", av_plasty: av_plasty, changeset: changeset)
  end

  def update(conn, %{"id" => id, "av_plasty" => av_plasty_params}) do
    av_plasty = Interventions.get_av_plasty!(id)

    case Interventions.update_av_plasty(av_plasty, av_plasty_params) do
      {:ok, _av_plasty} ->
        conn
        |> put_flash(:info, "Av plasty updated successfully.")
        # |> redirect(to: Routes.av_plasty_path(conn, :show, av_plasty))
        |> redirect(
          to:
            Routes.pt_angio_avp_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", av_plasty: av_plasty, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    av_plasty = Interventions.get_av_plasty!(id)
    {:ok, _av_plasty} = Interventions.delete_av_plasty(av_plasty)

    conn
    |> put_flash(:info, "Av plasty deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_avp_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.av_plasty_path(conn, :index))
  end
end
