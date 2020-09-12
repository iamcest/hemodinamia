defmodule AngioWeb.Opts_sentenceController do
  use AngioWeb, :controller

  alias Angio.Canons
  alias Angio.Canons.Opts_sentence
  alias Angio.Repo
  alias Angio.Canons.Language

  import AngioPlug

  plug(:scrub_params, "opts_sentence" when action in [:create, :update])

  plug(:assign_defs_option)
  plug(:assign_definition)
  plug(:assign_all_defs_options)
  plug(:load_defs_codes)
  plug(:load_languages)

  def index(conn, _params) do
    opts_sentences = Canons.list_opts_sentences(conn)
    render(conn, "index.html", opts_sentences: opts_sentences)
  end

  def new(conn, _params) do
    changeset = Canons.change_opts_sentence(%Opts_sentence{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"opts_sentence" => opts_sentence_params}) do
    changeset =
      conn.assigns[:defs_option]
      |> Ecto.build_assoc(:opts_sentences)
      |> Opts_sentence.changeset(opts_sentence_params)

    case Repo.insert(changeset) do
      {:ok, _opts_sentence} ->
        conn
        |> put_flash(:info, "Option Sentence created successfully.")
        |> redirect(
          to:
            Routes.definition_defs_option_opts_sentence_path(
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

  #################################
  def show(conn, %{"id" => id}) do
    opts_sentence = Canons.get_opts_sentence!(id)
    render(conn, "show.html", opts_sentence: opts_sentence)
  end

  def edit(conn, %{"id" => id}) do
    opts_sentence = Canons.get_opts_sentence!(id)
    changeset = Canons.change_opts_sentence(opts_sentence)
    render(conn, "edit.html", opts_sentence: opts_sentence, changeset: changeset)
  end

  def update(conn, %{"id" => id, "opts_sentence" => opts_sentence_params}) do
    opts_sentence = Canons.get_opts_sentence!(id)

    case Canons.update_opts_sentence(opts_sentence, opts_sentence_params) do
      {:ok, _opts_sentence} ->
        conn
        |> put_flash(:info, "Options Pick-List Item sentence updated successfully.")
        |> redirect(
          to:
            Routes.definition_defs_option_opts_sentence_path(
              conn,
              :index,
              conn.assigns[:definition],
              conn.assigns[:defs_option]
            )
        )

      # |> redirect(to: Routes.opts_sentence_path(conn, :show, opts_sentence))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", opts_sentence: opts_sentence, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    opts_sentence = Canons.get_opts_sentence!(id)
    {:ok, _opts_sentence} = Canons.delete_opts_sentence(opts_sentence)

    conn
    |> put_flash(:info, "Opts sentence deleted successfully.")
    |> redirect(
      to:
        Routes.definition_defs_option_opts_sentence_path(
          conn,
          :index,
          conn.assigns[:definition],
          conn.assigns[:defs_option]
        )
    )

    # |> redirect(to: Routes.opts_sentence_path(conn, :index))
  end

  ###########################
  defp load_languages(conn, _) do
    query =
      Language
      |> Language.alphabetical()
      |> Language.names_and_codes()

    languages = Angio.Repo.all(query)
    assign(conn, :languages, languages)
  end

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

  #####################
end
