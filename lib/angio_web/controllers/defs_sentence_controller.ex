defmodule AngioWeb.Defs_sentenceController do
  use AngioWeb, :controller

  import AngioPlug

  alias Angio.Canons
  alias Angio.Canons.Defs_sentence
  alias Angio.Canons.Language

  plug(:assign_definition)
  plug(:load_languages)

  def index(conn, _params) do
    defs_sentences = Canons.list_defs_sentences(conn)
    render(conn, :index, defs_sentences: defs_sentences)
  end

  def new(conn, _params) do
    changeset = Canons.change_defs_sentence(%Defs_sentence{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"defs_sentence" => defs_sentence_params}) do
    changeset =
      conn.assigns[:definition]
      |> Ecto.build_assoc(:defs_sentences)
      |> Defs_sentence.changeset(defs_sentence_params)

    #########################
    # definition_id_str = conn.params["definition_id"]
    # definition_id = String.to_integer(definition_id_str)

    # changeset =
    #  Defs_sentence.changeset(%Defs_sentence{}, defs_sentence_params)
    # |> Ecto.Changeset.put_change(
    #  :definition_id,
    #  definition_id
    # )

    ###################
    case Angio.Repo.insert(changeset) do
      {:ok, defs_sentence} ->
        defs_sentences = Angio.Repo.all(Ecto.assoc(conn.assigns[:definition], :defs_sentences))
        render(conn, :index, defs_sentences: defs_sentences)

        conn
        |> put_flash(:info, "Definition sentence for the Report created successfully.")
        |> redirect(
          to:
            Routes.definition_defs_sentence_path(
              conn,
              :show,
              conn.assigns[:definition],
              defs_sentence.id
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #########################

  def show(conn, %{"id" => id}) do
    defs_sentence = Canons.get_defs_sentence!(id)
    render(conn, "show.html", defs_sentence: defs_sentence)
  end

  def edit(conn, %{"id" => id}) do
    defs_sentence = Canons.get_defs_sentence!(id)
    changeset = Canons.change_defs_sentence(defs_sentence)
    render(conn, "edit.html", defs_sentence: defs_sentence, changeset: changeset)
  end

  def update(conn, %{"id" => id, "defs_sentence" => defs_sentence_params}) do
    defs_sentence = Angio.Canons.get_defs_sentence!(id)

    case Canons.update_defs_sentence(defs_sentence, defs_sentence_params) do
      {:ok, _defs_sentence} ->
        conn
        |> put_flash(:info, " Sentence updated successfully.")
        |> redirect(
          to: Routes.definition_defs_sentence_path(conn, :show, conn.assigns[:definition], id)
        )

        #########################
        definition_id_str = conn.params["definition_id"]
        definition_id = String.to_integer(definition_id_str)

        changeset =
          Defs_sentence.changeset(%Defs_sentence{}, defs_sentence_params)
          |> Ecto.Changeset.put_change(
            :definition_id,
            definition_id
          )

      ###################

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", defs_sentence: defs_sentence, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    defs_sentence = Canons.get_defs_sentence!(id)
    {:ok, _defs_sentence} = Angio.Canons.delete_defs_sentence(defs_sentence)

    conn
    |> put_flash(:info, "Field Phrase for the Report  deleted successfully.")
    |> redirect(to: Routes.definition_defs_sentence_path(conn, :index, conn.assigns[:definition]))
  end

  defp load_languages(conn, _) do
    query =
      Language
      |> Language.alphabetical()
      |> Language.names_and_codes()

    languages = Angio.Repo.all(query)
    assign(conn, :languages, languages)
  end

  ##############
end
