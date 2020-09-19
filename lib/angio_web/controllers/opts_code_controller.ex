defmodule AngioWeb.Opts_codeController do
  use AngioWeb, :controller
  alias Angio.{Repo, Canons, Canons.Opts_code, Defs_option}
  import Ecto.Query
  import AngioPlug

  alias Angio.Canons
  plug(:scrub_params, "opts_code" when action in [:create, :update])

  plug(:assign_defs_option)
  plug(:assign_definition)
  plug(:assign_all_defs_options)
  plug(:load_defs_codes)

  def index(conn, _params) do
    # opts_codes = Repo.all(Ecto.assoc(conn.assigns[:defs_option], :opts_codes))

    opts_codes = Canons.list_opts_codes(conn)
    render(conn, "index.html", opts_codes: opts_codes)
  end

  def new(conn, _params) do
    changeset = Canons.change_opts_code(%Opts_code{})
    render(conn, "new.html", changeset: changeset)
  end

  ######################
  def create(conn, %{"opts_code" => opts_code_params}) do
    changeset =
      conn.assigns[:defs_option]
      |> Ecto.build_assoc(:opts_codes)
      |> Opts_code.changeset(opts_code_params)

    # case Canons.create_opts_code(opts_code_params) do
    case Repo.insert(changeset) do
      {:ok, _opts_code} ->
        conn
        |> put_flash(:info, "Opts code created successfully.")
        |> redirect(
          to:
            Routes.definition_defs_option_opts_code_path(
              conn,
              :index,
              conn.assigns[:definition],
              conn.assigns[:defs_option]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    opts_code = Canons.get_opts_code!(id)
    render(conn, "show.html", opts_code: opts_code)
  end

  def edit(conn, %{"id" => id}) do
    opts_code = Canons.get_opts_code!(id)
    changeset = Canons.change_opts_code(opts_code)
    render(conn, "edit.html", opts_code: opts_code, changeset: changeset)
  end

  def update(conn, %{"id" => id, "opts_code" => opts_code_params}) do
    opts_code = Canons.get_opts_code!(id)

    case Canons.update_opts_code(opts_code, opts_code_params) do
      {:ok, _opts_code} ->
        conn
        |> put_flash(:info, "Options  code updated successfully.")
        |> redirect(
          to:
            Routes.definition_defs_option_opts_code_path(
              conn,
              :index,
              conn.assigns[:definition],
              conn.assigns[:defs_option]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", opts_code: opts_code, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    opts_code = Canons.get_opts_code!(id)
    {:ok, _opts_code} = Canons.delete_opts_code(opts_code)

    conn
    |> put_flash(:info, "Opts code deleted successfully.")
    |> redirect(
      to:
        Routes.definition_defs_option_opts_code_path(
          conn,
          :index,
          conn.assigns[:definition],
          conn.assigns[:defs_option]
        )
    )
  end

  #################
  # defp assign_definition_1(conn, _opts) do
  #  case conn.params do
  #    %{"definition_id" => definition_id} ->
  #      case Repo.get(Angio.Canons.Definition, definition_id) do
  #        # nil -> invalid_user(conn)
  #        definition ->
  #          assign(conn, :definition, definition)
  #      end
  #    _ ->
  #      conn
  #  end
  # end

  ###########################

  defp assign_defs_option(conn, _opts) do
    case conn.params do
      %{"defs_option_id" => defs_option_id} ->
        case Repo.get(Angio.Canons.Defs_option, defs_option_id) do
          # nil -> invalid_user(conn)
          defs_option ->
            assign(conn, :defs_option, defs_option)
        end

      _ ->
        conn
    end
  end

  ####################
  ####################
  defp load_defs_codes(conn, _opts) do
    case conn.params do
      %{"definition_id" => definition_id} ->
        query = Canons.defs_codes(definition_id)

        defs_code = Repo.all(query)
        assign(conn, :defs_code, defs_code)

      _ ->
        conn
    end
  end

  ###################

  ####################
  defp assign_all_defs_options(conn, _opts) do
    case conn.params do
      %{"definition_id" => definition_id} ->
        query = Canons.all_defs_options(definition_id)
        all_defs_options = Repo.all(query)
        assign(conn, :all_defs_options, all_defs_options)

      _ ->
        conn
    end
  end

  #################
end
