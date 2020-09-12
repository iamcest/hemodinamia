defmodule AngioWeb.Clinical_exam_cardioController do
  use AngioWeb, :controller

  alias Angio.Assements
  alias Angio.Assements.Clinical_exam_cardio
  alias Angio.Repo
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  plug(:scrub_params, "clinical_exam_cardio" when action in [:create, :update])

  def index(conn, _params) do
    clinical_exams_cardios = Assements.list_clinical_exams_cardios()
    render(conn, "index.html", clinical_exams_cardios: clinical_exams_cardios)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Assements.change_clinical_exam_cardio(%Clinical_exam_cardio{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clinical_exam_cardio" => clinical_exam_cardio_params}) do
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:clinical_exams_cardios)
      |> Clinical_exam_cardio.changeset(clinical_exam_cardio_params)

    case Repo.insert(changeset) do
      {:ok, _asd_closure} ->
        conn
        |> put_flash(:info, "Clinical Cardio Exam Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cle_cardio_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

        #################### 3
    end
  end

  def show(conn, %{"id" => id}) do
    clinical_exam_cardio = Assements.get_clinical_exam_cardio!(id)
    render(conn, "show.html", clinical_exam_cardio: clinical_exam_cardio)
  end

  def edit(conn, %{"id" => id}) do
    clinical_exam_cardio = Assements.get_clinical_exam_cardio!(id)
    changeset = Assements.change_clinical_exam_cardio(clinical_exam_cardio)
    render(conn, "edit.html", clinical_exam_cardio: clinical_exam_cardio, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clinical_exam_cardio" => clinical_exam_cardio_params}) do
    clinical_exam_cardio = Assements.get_clinical_exam_cardio!(id)

    case Assements.update_clinical_exam_cardio(clinical_exam_cardio, clinical_exam_cardio_params) do
      {:ok, _clinical_exam_cardio} ->
        conn
        |> put_flash(:info, "Clinical exam cardio updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cle_cardio_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clinical_exam_cardio: clinical_exam_cardio, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clinical_exam_cardio = Assements.get_clinical_exam_cardio!(id)
    {:ok, _clinical_exam_cardio} = Assements.delete_clinical_exam_cardio(clinical_exam_cardio)

    conn
    |> put_flash(:info, "Clinical exam cardio deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_cle_cardio_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )
  end
end
