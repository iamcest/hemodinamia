defmodule AngioWeb.LoincController do
  use AngioWeb, :controller

  alias Angio.Medcodes
  alias Angio.Medcodes.Loinc
  import Ecto.Query, warn: false

  plug(:scrub_params, "loinc" when action in [:create, :update])

  def index(conn, params) do
    page =
      Loinc
      |> order_by(asc: :long_common_name)
      # |> Angio.Medcodes.count_loincs()
      |> Angio.Repo.paginate(page: params["page"], page_size: 40)

    render(conn, "index.html", loincs: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Medcodes.change_loinc(%Loinc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"loinc" => loinc_params}) do
    case Medcodes.create_loinc(loinc_params) do
      {:ok, loinc} ->
        conn
        |> put_flash(:info, "Loinc created successfully.")
        |> redirect(to: Routes.loinc_path(conn, :show, loinc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loinc = Medcodes.get_loinc!(id)
    render(conn, "show.html", loinc: loinc)
  end

  def edit(conn, %{"id" => id}) do
    loinc = Medcodes.get_loinc!(id)
    changeset = Medcodes.change_loinc(loinc)
    render(conn, "edit.html", loinc: loinc, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loinc" => loinc_params}) do
    loinc = Medcodes.get_loinc!(id)

    case Medcodes.update_loinc(loinc, loinc_params) do
      {:ok, loinc} ->
        conn
        |> put_flash(:info, "Loinc updated successfully.")
        |> redirect(to: Routes.loinc_path(conn, :show, loinc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", loinc: loinc, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loinc = Medcodes.get_loinc!(id)
    {:ok, _loinc} = Medcodes.delete_loinc(loinc)

    conn
    |> put_flash(:info, "Loinc deleted successfully.")
    |> redirect(to: Routes.loinc_path(conn, :index))
  end

  ####################### 3
  def search_loincs(
        conn,
        %{"search_loincs" => %{"query" => query, "selection" => selection}} = params
      ) do
    trim_query = String.trim(query)

    page =
      Medcodes.search_loincs(trim_query, selection)
      |> Angio.Repo.paginate(page: params["page"], page_size: 500)

    render(conn, "index.html", loincs: page.entries, page: page)
  end
end
