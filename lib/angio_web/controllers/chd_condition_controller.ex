defmodule AngioWeb.Chd_conditionController do
  use AngioWeb, :controller
  import AngioPlug

  alias Angio.Congenitals
  alias Angio.Congenitals.Chd_condition
  alias Angio.Repo

  plug(:assign_info_coronary)
  plug(:assign_patient)

  def index(conn, _params) do
    chd_conditions = Congenitals.list_chd_conditions(conn)
    render(conn, "index.html", chd_conditions: chd_conditions)
  end

  def new(conn, _params) do
    changeset = Congenitals.change_chd_condition(%Chd_condition{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chd_condition" => chd_condition_params}) do
    ################# start##########################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:chd_conditions)
      |> Chd_condition.changeset(chd_condition_params)

    case Repo.insert(changeset) do
      {:ok, _chd_condition} ->
        conn
        |> put_flash(:info, "Congenital Conditions Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_condition_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        ##############################
    end

    ##############################
  end

  def show(conn, %{"id" => id}) do
    chd_condition = Congenitals.get_chd_condition!(id)
    render(conn, "show.html", chd_condition: chd_condition)
  end

  def edit(conn, %{"id" => id}) do
    chd_condition = Congenitals.get_chd_condition!(id)
    changeset = Congenitals.change_chd_condition(chd_condition)
    render(conn, "edit.html", chd_condition: chd_condition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chd_condition" => chd_condition_params}) do
    chd_condition = Congenitals.get_chd_condition!(id)

    case Congenitals.update_chd_condition(chd_condition, chd_condition_params) do
      {:ok, _chd_condition} ->
        conn
        |> put_flash(:info, "Congenital  conditions updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_chd_condition_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.chd_condition_path(conn, :show, chd_condition))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chd_condition: chd_condition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chd_condition = Congenitals.get_chd_condition!(id)
    {:ok, _chd_condition} = Congenitals.delete_chd_condition(chd_condition)

    conn
    |> put_flash(:info, "Congenital Condtions deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_chd_condition_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.chd_condition_path(conn, :index))
  end
end
