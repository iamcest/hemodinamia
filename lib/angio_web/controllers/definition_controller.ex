defmodule AngioWeb.DefinitionController do
  use AngioWeb, :controller
  require Ecto.Changeset
  alias Angio.{Canons, Canons.Definition, Repo}
  alias Angio.Canons.Defs_table
  import Ecto.Query, warn: false

  plug(:scrub_params, "definition" when action in [:create, :update])

  plug(:load_defs_tables when action in [:new, :create, :edit, :update])

  def index(conn, params) do
    page = Canons.list_definitions(params)
    render(conn, "index.html", definitions: page.entries, page: page)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Canons.change_definition(%Definition{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"definition" => definition_params}) do
    defs_table_id = Map.get(definition_params, "defs_table_id")

    changeset =
      Definition.changeset(%Definition{}, definition_params)
      |> Ecto.Changeset.put_change(
        :table_name,
        Angio.Canons.Defs_table.id_to_name(defs_table_id)
      )

    case Repo.insert(changeset) do
      {:ok, definition} ->
        conn
        |> put_flash(:info, "Element  created successfully.")

        render(conn, "show.html", definition: definition)

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create_org(conn, %{"definition" => definition_params}) do
    case Angio.Canons.create_definition(definition_params) do
      {:ok, definition} ->
        conn
        |> put_flash(:info, "Field created successfully.")
        |> redirect(to: Routes.definition_path(conn, :show, definition))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    definition = Canons.get_definition!(id)
    render(conn, "show.html", definition: definition)
  end

  def edit(conn, %{"id" => id}) do
    definition = Canons.get_definition!(id)
    changeset = Canons.change_definition(definition)
    render(conn, "edit.html", definition: definition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "definition" => definition_params}) do
    defs_table_id = Map.get(definition_params, "defs_table_id")
    definition = Repo.get!(Definition, id)

    table_name = Angio.Canons.Defs_table.id_to_name(defs_table_id)
    params = Map.put(definition_params, "table_name", table_name)

    case Angio.Canons.update_definition(definition, params) do
      # case Angio.Canons.update_definition(definition, definition_params) do
      {:ok, definition} ->
        conn
        |> put_flash(:info, "Element-Field updated successfully.")
        |> redirect(to: Routes.definition_path(conn, :show, definition))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", definition: definition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    definition = Canons.get_definition!(id)
    {:ok, _definition} = Canons.delete_definition(definition)

    conn
    |> put_flash(:info, "Definition deleted successfully.")
    |> redirect(to: Routes.definition_path(conn, :index))
  end

  #################################
  ################################
  @spec search_instructions(Plug.Conn.t(), map) :: Plug.Conn.t()
  def search_instructions(conn, %{"input" => input}) do
    input = String.trim(input)

    # results = Angio.Canons.search_an_instruction(input)
    results = Angio.Canons.search_in_instructions(input)
    json(conn, results)
  end

  #################################
  def search_support_definitions(conn, %{"input" => input}) do
    #IO.puts("-------support defini----------------")
    #IO.inspect(input)

    input = String.trim(input)
    results = Angio.Canons.search_a_support_definition(input)
    json(conn, results)
  end

  #################################

  def search_notes(conn, %{"input" => input}) do
    input = String.trim(input)
    results = Angio.Canons.search_a_note(input)
    json(conn, results)
  end

  ##########################################
  ########################
  def search_option_definitions(conn, %{"input" => input}) do
    input = String.trim(input)

    if input !== "" do
      results = Angio.Canons.search_an_option_definition(input)
      json(conn, results)
    else
      not_applicable = "Not Applicable"
      json(conn, not_applicable)
    end
  end

  defp load_defs_tables(conn, _) do
    query =
      Defs_table
      |> Defs_table.alphabetical()
      |> Defs_table.names_and_ids()

    defs_tables = Angio.Repo.all(query)
    assign(conn, :defs_tables, defs_tables)
  end

  ###################################

  def search_definitions(
        conn,
        %{"search_definitions" => %{"query" => query,
        "selection" => selection}} = params
      ) do
    trim_query = String.trim(query)

    page =
      Canons.search_definition_from_utilities(trim_query, selection)
      |> Angio.Repo.paginate(page: params["page"], page_size: 500)
      render(conn, "index.html", definitions: page.entries, page: page)

      #render(conn, "index.html", definitions: page.entries,
      #page: page,
      #page_number: page.page_number,
      #page_size: page.page_size,
      #total_pages: page.total_pages,
      #total_entries: page.total_entries)

    end

  ## search

  def search_definitions_tsv(conn, %{"search_definitions" =>
        %{"query" => query, "selection" => selection}} = params) do
    trim_query = String.trim(query)

    page =
      Canons.search_definition_tsv_search(trim_query)
      |> Angio.Repo.paginate(page: params["page"], page_size: 500)
      render(conn, "index.html", definitions: page.entries, page: page)
  end
  ##################
end
