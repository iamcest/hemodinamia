defmodule AngioWeb.Av_plasties_inflationController do
  use AngioWeb, :controller

  alias Angio.Interventions
  alias Angio.Interventions.Av_plasties_inflation
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)
  plug(:assign_av_plasty)

  plug(:scrub_params, "av_plasties_inflation" when action in [:create, :update])

  def index(conn, _params) do
    av_plasties_inflations = Interventions.list_av_plasties_inflations(conn)
    render(conn, "index.html", av_plasties_inflations: av_plasties_inflations)
  end

  def new(conn, _params) do
    changeset = Interventions.change_av_plasties_inflation(%Av_plasties_inflation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"av_plasties_inflation" => av_plasties_inflation_params}) do
    changeset =
      conn.assigns[:av_plasty]
      |> Ecto.build_assoc(:av_plasties_inflations)
      |> Av_plasties_inflation.changeset(av_plasties_inflation_params)

    case Repo.insert(changeset) do
      {:ok, _coarc_device} ->
        conn
        |> put_flash(:info, "AV Inflations Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_avp_avpi_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary],
              conn.assigns[:av_plasty]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ##########################
  end

  def show(conn, %{"id" => id}) do
    av_plasties_inflation = Interventions.get_av_plasties_inflation!(id)
    render(conn, "show.html", av_plasties_inflation: av_plasties_inflation)
  end

  def edit(conn, %{"id" => id}) do
    av_plasties_inflation = Interventions.get_av_plasties_inflation!(id)
    changeset = Interventions.change_av_plasties_inflation(av_plasties_inflation)
    render(conn, "edit.html", av_plasties_inflation: av_plasties_inflation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "av_plasties_inflation" => av_plasties_inflation_params}) do
    av_plasties_inflation = Interventions.get_av_plasties_inflation!(id)

    case Interventions.update_av_plasties_inflation(
           av_plasties_inflation,
           av_plasties_inflation_params
         ) do
      {:ok, _av_plasties_inflation} ->
        conn
        |> put_flash(:info, "Av plasties inflation updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_avp_avpi_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary],
              conn.assigns[:av_plasty]
            )
        )

      # |> redirect(to: Routes.av_plasties_inflation_path(conn, :show, av_plasties_inflation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html",
          av_plasties_inflation: av_plasties_inflation,
          changeset: changeset
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    av_plasties_inflation = Interventions.get_av_plasties_inflation!(id)

    {:ok, _av_plasties_inflation} =
      Interventions.delete_av_plasties_inflation(av_plasties_inflation)

    conn
    |> put_flash(:info, "Av plasties inflation deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_avp_avpi_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary],
          conn.assigns[:av_plasty]
        )
    )

    # |> redirect(to: Routes.av_plasties_inflation_path(conn, :index))
  end
end
