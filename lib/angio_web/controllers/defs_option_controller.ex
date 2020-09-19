defmodule AngioWeb.Defs_optionController do
  use AngioWeb, :controller
  import AngioPlug

  alias Angio.Canons
  alias Angio.Canons.Defs_option
  plug(:assign_definition)

  def index(conn, _params) do
    # defs_options = Canons.list_defs_options(conn)
    # render(conn, :index, defs_options: defs_options)
    defs_options =
      Angio.Repo.all(
        Ecto.assoc(conn.assigns[:definition], :defs_options)
        |> Defs_option.order_by_code()
        # |> DefsOption.order_by_name()
      )

    render(conn, :index, defs_options: defs_options)
  end

  def new(conn, _params) do
    changeset = Canons.change_defs_option(%Defs_option{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"defs_option" => defs_option_params}) do
    ##################
    changeset =
      conn.assigns[:definition]
      |> Ecto.build_assoc(:defs_options)
      |> Defs_option.changeset(defs_option_params)

    #########################
    definition_id_str = conn.params["definition_id"]
    definition_id = String.to_integer(definition_id_str)

    changeset =
      Defs_option.changeset(%Defs_option{}, defs_option_params)
      |> Ecto.Changeset.put_change(
        :definition_id,
        definition_id
      )

    ###################

    case Angio.Repo.insert(changeset) do
      {:ok, defs_option} ->
        defs_options = Angio.Repo.all(Ecto.assoc(conn.assigns[:definition], :defs_options))
        render(conn, :index, defs_options: defs_options)

        conn
        |> put_flash(:info, "Definition Pick-List for the Report created successfully.")
        |> redirect(
          to:
            Routes.definition_defs_option_path(
              conn,
              :show,
              conn.assigns[:definition],
              defs_option.id
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    defs_option = Canons.get_defs_option!(id)
    render(conn, "show.html", defs_option: defs_option)
  end

  def edit(conn, %{"id" => id}) do
    defs_option = Canons.get_defs_option!(id)
    changeset = Canons.change_defs_option(defs_option)
    render(conn, "edit.html", defs_option: defs_option, changeset: changeset)
  end

  @spec update(Plug.Conn.t(), map) :: %{
          :__struct__ => Ecto.Changeset | Plug.Conn,
          :params =>
            nil
            | %{
                optional(:__struct__) => Plug.Conn.Unfetched,
                optional(:aspect) => atom,
                optional(binary) => any
              },
          optional(:action) => :delete | :ignore | :insert | nil | :replace | :update,
          optional(:adapter) => {atom, any},
          optional(:assigns) => %{optional(atom) => any},
          optional(:before_send) => [(map -> map)],
          optional(:body_params) => %{
            optional(:__struct__) => Plug.Conn.Unfetched,
            optional(:aspect) => atom,
            optional(binary) => any
          },
          optional(:changes) => %{optional(atom) => any},
          optional(:constraints) => [
            %{
              constraint: binary,
              error_message: binary,
              error_type: atom,
              field: atom,
              match: :exact | :prefix | :suffix,
              type: :check | :exclusion | :foreign_key | :unique
            }
          ],
          optional(:cookies) => %{
            optional(:__struct__) => Plug.Conn.Unfetched,
            optional(:aspect) => atom,
            optional(binary) => binary
          },
          optional(:data) => map,
          optional(:empty_values) => any,
          optional(:errors) => [{atom, {any, any}}],
          optional(:filters) => %{optional(atom) => any},
          optional(:halted) => any,
          optional(:host) => binary,
          optional(:method) => binary,
          optional(:owner) => pid,
          optional(:path_info) => [binary],
          optional(:path_params) => %{
            optional(binary) =>
              binary | [binary | [any] | map] | %{optional(binary) => binary | [any] | map}
          },
          optional(:port) => char,
          optional(:prepare) => [(any -> any)],
          optional(:private) => %{optional(atom) => any},
          optional(:query_params) => %{
            optional(:__struct__) => Plug.Conn.Unfetched,
            optional(:aspect) => atom,
            optional(binary) =>
              binary | [binary | [any] | map] | %{optional(binary) => binary | [any] | map}
          },
          optional(:query_string) => binary,
          optional(:remote_ip) =>
            {byte, byte, byte, byte} | {char, char, char, char, char, char, char, char},
          optional(:repo) => atom,
          optional(:repo_opts) => keyword,
          optional(:req_cookies) => %{
            optional(:__struct__) => Plug.Conn.Unfetched,
            optional(:aspect) => atom,
            optional(binary) => binary
          },
          optional(:req_headers) => [{binary, binary}],
          optional(:request_path) => binary,
          optional(:required) => [atom],
          optional(:resp_body) =>
            nil
            | binary
            | maybe_improper_list(
                binary | maybe_improper_list(any, binary | []) | byte,
                binary | []
              ),
          optional(:resp_cookies) => %{optional(binary) => %{}},
          optional(:resp_headers) => [{binary, binary}],
          optional(:scheme) => :http | :https,
          optional(:script_name) => [binary],
          optional(:secret_key_base) => nil | binary,
          optional(:state) => :sent,
          optional(:status) => nil | non_neg_integer,
          optional(:types) => %{
            optional(atom) => atom | {:array, any} | {:embed, map} | {:in, any} | {:map, any}
          },
          optional(:valid?) => boolean,
          optional(:validations) => keyword
        }
  def update(conn, %{"id" => id, "defs_option" => defs_option_params}) do
    defs_option = Angio.Canons.get_defs_option!(id)

    case Canons.update_defs_option(defs_option, defs_option_params) do
      {:ok, _defs_option} ->
        conn
        |> put_flash(:info, " Definition Pick-Lists updated successfully.")
        |> redirect(
          to: Routes.definition_defs_option_path(conn, :show, conn.assigns[:definition], id)
        )

        definition_id_str = conn.params["definition_id"]
        definition_id = String.to_integer(definition_id_str)

        changeset =
          Defs_option.changeset(%Defs_option{}, defs_option_params)
          |> Ecto.Changeset.put_change(
            :definition_id,
            definition_id
          )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", defs_option: defs_option, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    defs_option = Canons.get_defs_option!(id)
    {:ok, _defs_option} = Canons.delete_defs_option(defs_option)

    conn
    |> put_flash(:info, "Definition  Pick-list Item  deleted successfully.")
    |> redirect(to: Routes.definition_defs_option_path(conn, :index, conn.assigns[:definition]))
  end

  defp assign_definition_1(conn, _opts) do
    case conn.params do
      %{"definition_id" => definition_id} ->
        case Angio.Repo.get(Angio.Canons.Definition, definition_id) do
          # nil -> invalid_user(conn)
          definition ->
            assign(conn, :definition, definition)
        end

      _ ->
        conn
    end
  end

  ###############
end
