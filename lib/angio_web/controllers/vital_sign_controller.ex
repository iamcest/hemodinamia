defmodule AngioWeb.Vital_signController do
  use AngioWeb, :controller
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Assements
  alias Angio.Repo
  alias Angio.Assements.Vital_sign

  plug(:scrub_params, "vital_sign" when action in [:create, :update])

  def index(conn, _params) do
    vital_signs = Assements.list_vital_signs(conn)
    render(conn, "index.html", vital_signs: vital_signs)
  end

  def new(conn, _params) do
    changeset = Assements.change_vital_sign(%Vital_sign{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vital_sign" => vital_sign_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:vital_signs)
      |> Vital_sign.changeset(vital_sign_params)

    case Repo.insert(changeset) do
      {:ok, _vital_sign} ->
        conn
        |> put_flash(:info, "Vital's signs Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_vitals_path(
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
    vital_sign = Assements.get_vital_sign!(id)
    render(conn, "show.html", vital_sign: vital_sign)
  end

  def edit(conn, %{"id" => id}) do
    vital_sign = Assements.get_vital_sign!(id)
    changeset = Assements.change_vital_sign(vital_sign)
    render(conn, "edit.html", vital_sign: vital_sign, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vital_sign" => vital_sign_params}) do
    vital_sign = Assements.get_vital_sign!(id)

    case Assements.update_vital_sign(vital_sign, vital_sign_params) do
      {:ok, _vital_sign} ->
        conn
        |> put_flash(:info, "Vital sign updated successfully.")
        # |> redirect(to: Routes.vital_sign_path(conn, :show, vital_sign))
        |> redirect(
          to:
            Routes.pt_angio_vitals_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vital_sign: vital_sign, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vital_sign = Assements.get_vital_sign!(id)
    {:ok, _vital_sign} = Assements.delete_vital_sign(vital_sign)

    conn
    |> put_flash(:info, "Vital sign deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_vitals_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.vital_sign_path(conn, :index))
  end
end
