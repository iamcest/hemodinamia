defmodule Angio.CanonsTest do
  use Angio.DataCase

  alias Angio.Canons

  describe "definitions" do
    alias Angio.Canons.Definition

    @valid_attrs %{
      coding_instructions: "some coding_instructions",
      data_source: "some data_source",
      default_value: "some default_value",
      definition_id: 42,
      defs_table_id: 42,
      name: "some name",
      notes: "some notes",
      ref: "some ref",
      short_name: "some short_name",
      support_definition: "some support_definition",
      table_name: "some table_name",
      target_value: "some target_value",
      title_name: "some title_name",
      usual_range: "some usual_range",
      valid_range: "some valid_range",
      vocabulary_en: "some vocabulary_en"
    }
    @update_attrs %{
      coding_instructions: "some updated coding_instructions",
      data_source: "some updated data_source",
      default_value: "some updated default_value",
      definition_id: 43,
      defs_table_id: 43,
      name: "some updated name",
      notes: "some updated notes",
      ref: "some updated ref",
      short_name: "some updated short_name",
      support_definition: "some updated support_definition",
      table_name: "some updated table_name",
      target_value: "some updated target_value",
      title_name: "some updated title_name",
      usual_range: "some updated usual_range",
      valid_range: "some updated valid_range",
      vocabulary_en: "some updated vocabulary_en"
    }
    @invalid_attrs %{
      coding_instructions: nil,
      data_source: nil,
      default_value: nil,
      definition_id: nil,
      defs_table_id: nil,
      name: nil,
      notes: nil,
      ref: nil,
      short_name: nil,
      support_definition: nil,
      table_name: nil,
      target_value: nil,
      title_name: nil,
      usual_range: nil,
      valid_range: nil,
      vocabulary_en: nil
    }

    def definition_fixture(attrs \\ %{}) do
      {:ok, definition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_definition()

      definition
    end

    test "list_definitions/0 returns all definitions" do
      definition = definition_fixture()
      assert Canons.list_definitions() == [definition]
    end

    test "get_definition!/1 returns the definition with given id" do
      definition = definition_fixture()
      assert Canons.get_definition!(definition.id) == definition
    end

    test "create_definition/1 with valid data creates a definition" do
      assert {:ok, %Definition{} = definition} = Canons.create_definition(@valid_attrs)
      assert definition.coding_instructions == "some coding_instructions"
      assert definition.data_source == "some data_source"
      assert definition.default_value == "some default_value"
      assert definition.definition_id == 42
      assert definition.defs_table_id == 42
      assert definition.name == "some name"
      assert definition.notes == "some notes"
      assert definition.ref == "some ref"
      assert definition.short_name == "some short_name"
      assert definition.support_definition == "some support_definition"
      assert definition.table_name == "some table_name"
      assert definition.target_value == "some target_value"
      assert definition.title_name == "some title_name"
      assert definition.usual_range == "some usual_range"
      assert definition.valid_range == "some valid_range"
      assert definition.vocabulary_en == "some vocabulary_en"
    end

    test "create_definition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_definition(@invalid_attrs)
    end

    test "update_definition/2 with valid data updates the definition" do
      definition = definition_fixture()

      assert {:ok, %Definition{} = definition} =
               Canons.update_definition(definition, @update_attrs)

      assert definition.coding_instructions == "some updated coding_instructions"
      assert definition.data_source == "some updated data_source"
      assert definition.default_value == "some updated default_value"
      assert definition.definition_id == 43
      assert definition.defs_table_id == 43
      assert definition.name == "some updated name"
      assert definition.notes == "some updated notes"
      assert definition.ref == "some updated ref"
      assert definition.short_name == "some updated short_name"
      assert definition.support_definition == "some updated support_definition"
      assert definition.table_name == "some updated table_name"
      assert definition.target_value == "some updated target_value"
      assert definition.title_name == "some updated title_name"
      assert definition.usual_range == "some updated usual_range"
      assert definition.valid_range == "some updated valid_range"
      assert definition.vocabulary_en == "some updated vocabulary_en"
    end

    test "update_definition/2 with invalid data returns error changeset" do
      definition = definition_fixture()
      assert {:error, %Ecto.Changeset{}} = Canons.update_definition(definition, @invalid_attrs)
      assert definition == Canons.get_definition!(definition.id)
    end

    test "delete_definition/1 deletes the definition" do
      definition = definition_fixture()
      assert {:ok, %Definition{}} = Canons.delete_definition(definition)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_definition!(definition.id) end
    end

    test "change_definition/1 returns a definition changeset" do
      definition = definition_fixture()
      assert %Ecto.Changeset{} = Canons.change_definition(definition)
    end
  end

  describe "defs_sentences" do
    alias Angio.Canons.Defs_sentence

    @valid_attrs %{
      definition_id: 42,
      language: "some language",
      note: "some note",
      sentence: "some sentence"
    }
    @update_attrs %{
      definition_id: 43,
      language: "some updated language",
      note: "some updated note",
      sentence: "some updated sentence"
    }
    @invalid_attrs %{definition_id: nil, language: nil, note: nil, sentence: nil}

    def defs_sentence_fixture(attrs \\ %{}) do
      {:ok, defs_sentence} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_defs_sentence()

      defs_sentence
    end

    test "list_defs_sentences/0 returns all defs_sentences" do
      defs_sentence = defs_sentence_fixture()
      assert Canons.list_defs_sentences() == [defs_sentence]
    end

    test "get_defs_sentence!/1 returns the defs_sentence with given id" do
      defs_sentence = defs_sentence_fixture()
      assert Canons.get_defs_sentence!(defs_sentence.id) == defs_sentence
    end

    test "create_defs_sentence/1 with valid data creates a defs_sentence" do
      assert {:ok, %Defs_sentence{} = defs_sentence} = Canons.create_defs_sentence(@valid_attrs)
      assert defs_sentence.definition_id == 42
      assert defs_sentence.language == "some language"
      assert defs_sentence.note == "some note"
      assert defs_sentence.sentence == "some sentence"
    end

    test "create_defs_sentence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_defs_sentence(@invalid_attrs)
    end

    test "update_defs_sentence/2 with valid data updates the defs_sentence" do
      defs_sentence = defs_sentence_fixture()

      assert {:ok, %Defs_sentence{} = defs_sentence} =
               Canons.update_defs_sentence(defs_sentence, @update_attrs)

      assert defs_sentence.definition_id == 43
      assert defs_sentence.language == "some updated language"
      assert defs_sentence.note == "some updated note"
      assert defs_sentence.sentence == "some updated sentence"
    end

    test "update_defs_sentence/2 with invalid data returns error changeset" do
      defs_sentence = defs_sentence_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Canons.update_defs_sentence(defs_sentence, @invalid_attrs)

      assert defs_sentence == Canons.get_defs_sentence!(defs_sentence.id)
    end

    test "delete_defs_sentence/1 deletes the defs_sentence" do
      defs_sentence = defs_sentence_fixture()
      assert {:ok, %Defs_sentence{}} = Canons.delete_defs_sentence(defs_sentence)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_defs_sentence!(defs_sentence.id) end
    end

    test "change_defs_sentence/1 returns a defs_sentence changeset" do
      defs_sentence = defs_sentence_fixture()
      assert %Ecto.Changeset{} = Canons.change_defs_sentence(defs_sentence)
    end
  end

  describe "defs_codes" do
    alias Angio.Canons.Defs_code

    @valid_attrs %{
      code: "some code",
      code_system: "some code_system",
      definition_id: 42,
      description: "some description",
      note: "some note"
    }
    @update_attrs %{
      code: "some updated code",
      code_system: "some updated code_system",
      definition_id: 43,
      description: "some updated description",
      note: "some updated note"
    }
    @invalid_attrs %{code: nil, code_system: nil, definition_id: nil, description: nil, note: nil}

    def defs_code_fixture(attrs \\ %{}) do
      {:ok, defs_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_defs_code()

      defs_code
    end

    test "list_defs_codes/0 returns all defs_codes" do
      defs_code = defs_code_fixture()
      assert Canons.list_defs_codes() == [defs_code]
    end

    test "get_defs_code!/1 returns the defs_code with given id" do
      defs_code = defs_code_fixture()
      assert Canons.get_defs_code!(defs_code.id) == defs_code
    end

    test "create_defs_code/1 with valid data creates a defs_code" do
      assert {:ok, %Defs_code{} = defs_code} = Canons.create_defs_code(@valid_attrs)
      assert defs_code.code == "some code"
      assert defs_code.code_system == "some code_system"
      assert defs_code.definition_id == 42
      assert defs_code.description == "some description"
      assert defs_code.note == "some note"
    end

    test "create_defs_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_defs_code(@invalid_attrs)
    end

    test "update_defs_code/2 with valid data updates the defs_code" do
      defs_code = defs_code_fixture()
      assert {:ok, %Defs_code{} = defs_code} = Canons.update_defs_code(defs_code, @update_attrs)
      assert defs_code.code == "some updated code"
      assert defs_code.code_system == "some updated code_system"
      assert defs_code.definition_id == 43
      assert defs_code.description == "some updated description"
      assert defs_code.note == "some updated note"
    end

    test "update_defs_code/2 with invalid data returns error changeset" do
      defs_code = defs_code_fixture()
      assert {:error, %Ecto.Changeset{}} = Canons.update_defs_code(defs_code, @invalid_attrs)
      assert defs_code == Canons.get_defs_code!(defs_code.id)
    end

    test "delete_defs_code/1 deletes the defs_code" do
      defs_code = defs_code_fixture()
      assert {:ok, %Defs_code{}} = Canons.delete_defs_code(defs_code)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_defs_code!(defs_code.id) end
    end

    test "change_defs_code/1 returns a defs_code changeset" do
      defs_code = defs_code_fixture()
      assert %Ecto.Changeset{} = Canons.change_defs_code(defs_code)
    end
  end

  describe "defs_options" do
    alias Angio.Canons.Defs_option

    @valid_attrs %{
      code: "some code",
      definition_id: 42,
      name: "some name",
      selection_definition: "some selection_definition",
      selection_notes: "some selection_notes",
      selection_text: "some selection_text"
    }
    @update_attrs %{
      code: "some updated code",
      definition_id: 43,
      name: "some updated name",
      selection_definition: "some updated selection_definition",
      selection_notes: "some updated selection_notes",
      selection_text: "some updated selection_text"
    }
    @invalid_attrs %{
      code: nil,
      definition_id: nil,
      name: nil,
      selection_definition: nil,
      selection_notes: nil,
      selection_text: nil
    }

    def defs_option_fixture(attrs \\ %{}) do
      {:ok, defs_option} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_defs_option()

      defs_option
    end

    test "list_defs_options/0 returns all defs_options" do
      defs_option = defs_option_fixture()
      assert Canons.list_defs_options() == [defs_option]
    end

    test "get_defs_option!/1 returns the defs_option with given id" do
      defs_option = defs_option_fixture()
      assert Canons.get_defs_option!(defs_option.id) == defs_option
    end

    test "create_defs_option/1 with valid data creates a defs_option" do
      assert {:ok, %Defs_option{} = defs_option} = Canons.create_defs_option(@valid_attrs)
      assert defs_option.code == "some code"
      assert defs_option.definition_id == 42
      assert defs_option.name == "some name"
      assert defs_option.selection_definition == "some selection_definition"
      assert defs_option.selection_notes == "some selection_notes"
      assert defs_option.selection_text == "some selection_text"
    end

    test "create_defs_option/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_defs_option(@invalid_attrs)
    end

    test "update_defs_option/2 with valid data updates the defs_option" do
      defs_option = defs_option_fixture()

      assert {:ok, %Defs_option{} = defs_option} =
               Canons.update_defs_option(defs_option, @update_attrs)

      assert defs_option.code == "some updated code"
      assert defs_option.definition_id == 43
      assert defs_option.name == "some updated name"
      assert defs_option.selection_definition == "some updated selection_definition"
      assert defs_option.selection_notes == "some updated selection_notes"
      assert defs_option.selection_text == "some updated selection_text"
    end

    test "update_defs_option/2 with invalid data returns error changeset" do
      defs_option = defs_option_fixture()
      assert {:error, %Ecto.Changeset{}} = Canons.update_defs_option(defs_option, @invalid_attrs)
      assert defs_option == Canons.get_defs_option!(defs_option.id)
    end

    test "delete_defs_option/1 deletes the defs_option" do
      defs_option = defs_option_fixture()
      assert {:ok, %Defs_option{}} = Canons.delete_defs_option(defs_option)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_defs_option!(defs_option.id) end
    end

    test "change_defs_option/1 returns a defs_option changeset" do
      defs_option = defs_option_fixture()
      assert %Ecto.Changeset{} = Canons.change_defs_option(defs_option)
    end
  end

  describe "opts_codes" do
    alias Angio.Canons.Opts_code

    @valid_attrs %{
      code: "some code",
      code_system: "some code_system",
      definition_id: 42,
      defs_option_id: 42,
      description: "some description",
      notes: "some notes"
    }
    @update_attrs %{
      code: "some updated code",
      code_system: "some updated code_system",
      definition_id: 43,
      defs_option_id: 43,
      description: "some updated description",
      notes: "some updated notes"
    }
    @invalid_attrs %{
      code: nil,
      code_system: nil,
      definition_id: nil,
      defs_option_id: nil,
      description: nil,
      notes: nil
    }

    def opts_code_fixture(attrs \\ %{}) do
      {:ok, opts_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_opts_code()

      opts_code
    end

    test "list_opts_codes/0 returns all opts_codes" do
      opts_code = opts_code_fixture()
      assert Canons.list_opts_codes() == [opts_code]
    end

    test "get_opts_code!/1 returns the opts_code with given id" do
      opts_code = opts_code_fixture()
      assert Canons.get_opts_code!(opts_code.id) == opts_code
    end

    test "create_opts_code/1 with valid data creates a opts_code" do
      assert {:ok, %Opts_code{} = opts_code} = Canons.create_opts_code(@valid_attrs)
      assert opts_code.code == "some code"
      assert opts_code.code_system == "some code_system"
      assert opts_code.definition_id == 42
      assert opts_code.defs_option_id == 42
      assert opts_code.description == "some description"
      assert opts_code.notes == "some notes"
    end

    test "create_opts_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_opts_code(@invalid_attrs)
    end

    test "update_opts_code/2 with valid data updates the opts_code" do
      opts_code = opts_code_fixture()
      assert {:ok, %Opts_code{} = opts_code} = Canons.update_opts_code(opts_code, @update_attrs)
      assert opts_code.code == "some updated code"
      assert opts_code.code_system == "some updated code_system"
      assert opts_code.definition_id == 43
      assert opts_code.defs_option_id == 43
      assert opts_code.description == "some updated description"
      assert opts_code.notes == "some updated notes"
    end

    test "update_opts_code/2 with invalid data returns error changeset" do
      opts_code = opts_code_fixture()
      assert {:error, %Ecto.Changeset{}} = Canons.update_opts_code(opts_code, @invalid_attrs)
      assert opts_code == Canons.get_opts_code!(opts_code.id)
    end

    test "delete_opts_code/1 deletes the opts_code" do
      opts_code = opts_code_fixture()
      assert {:ok, %Opts_code{}} = Canons.delete_opts_code(opts_code)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_opts_code!(opts_code.id) end
    end

    test "change_opts_code/1 returns a opts_code changeset" do
      opts_code = opts_code_fixture()
      assert %Ecto.Changeset{} = Canons.change_opts_code(opts_code)
    end
  end

  describe "defs_tables" do
    alias Angio.Canons.Defs_table

    @valid_attrs %{
      cda_xml: "some cda_xml",
      code: "some code",
      code_system: "some code_system",
      code_system_name: "some code_system_name",
      definition_id: 42,
      defs_table_id: 42,
      display_name: "some display_name",
      name: "some name",
      note: "some note",
      table_id: "some table_id",
      template_id: "some template_id"
    }
    @update_attrs %{
      cda_xml: "some updated cda_xml",
      code: "some updated code",
      code_system: "some updated code_system",
      code_system_name: "some updated code_system_name",
      definition_id: 43,
      defs_table_id: 43,
      display_name: "some updated display_name",
      name: "some updated name",
      note: "some updated note",
      table_id: "some updated table_id",
      template_id: "some updated template_id"
    }
    @invalid_attrs %{
      cda_xml: nil,
      code: nil,
      code_system: nil,
      code_system_name: nil,
      definition_id: nil,
      defs_table_id: nil,
      display_name: nil,
      name: nil,
      note: nil,
      table_id: nil,
      template_id: nil
    }

    def defs_table_fixture(attrs \\ %{}) do
      {:ok, defs_table} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_defs_table()

      defs_table
    end

    test "list_defs_tables/0 returns all defs_tables" do
      defs_table = defs_table_fixture()
      assert Canons.list_defs_tables() == [defs_table]
    end

    test "get_defs_table!/1 returns the defs_table with given id" do
      defs_table = defs_table_fixture()
      assert Canons.get_defs_table!(defs_table.id) == defs_table
    end

    test "create_defs_table/1 with valid data creates a defs_table" do
      assert {:ok, %Defs_table{} = defs_table} = Canons.create_defs_table(@valid_attrs)
      assert defs_table.cda_xml == "some cda_xml"
      assert defs_table.code == "some code"
      assert defs_table.code_system == "some code_system"
      assert defs_table.code_system_name == "some code_system_name"
      assert defs_table.definition_id == 42
      assert defs_table.defs_table_id == 42
      assert defs_table.display_name == "some display_name"
      assert defs_table.name == "some name"
      assert defs_table.note == "some note"
      assert defs_table.table_id == "some table_id"
      assert defs_table.template_id == "some template_id"
    end

    test "create_defs_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_defs_table(@invalid_attrs)
    end

    test "update_defs_table/2 with valid data updates the defs_table" do
      defs_table = defs_table_fixture()

      assert {:ok, %Defs_table{} = defs_table} =
               Canons.update_defs_table(defs_table, @update_attrs)

      assert defs_table.cda_xml == "some updated cda_xml"
      assert defs_table.code == "some updated code"
      assert defs_table.code_system == "some updated code_system"
      assert defs_table.code_system_name == "some updated code_system_name"
      assert defs_table.definition_id == 43
      assert defs_table.defs_table_id == 43
      assert defs_table.display_name == "some updated display_name"
      assert defs_table.name == "some updated name"
      assert defs_table.note == "some updated note"
      assert defs_table.table_id == "some updated table_id"
      assert defs_table.template_id == "some updated template_id"
    end

    test "update_defs_table/2 with invalid data returns error changeset" do
      defs_table = defs_table_fixture()
      assert {:error, %Ecto.Changeset{}} = Canons.update_defs_table(defs_table, @invalid_attrs)
      assert defs_table == Canons.get_defs_table!(defs_table.id)
    end

    test "delete_defs_table/1 deletes the defs_table" do
      defs_table = defs_table_fixture()
      assert {:ok, %Defs_table{}} = Canons.delete_defs_table(defs_table)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_defs_table!(defs_table.id) end
    end

    test "change_defs_table/1 returns a defs_table changeset" do
      defs_table = defs_table_fixture()
      assert %Ecto.Changeset{} = Canons.change_defs_table(defs_table)
    end
  end

  describe "opts_sentences" do
    alias Angio.Canons.Opts_sentence

    @valid_attrs %{
      definition_id: 42,
      language: "some language",
      note: "some note",
      sentence: "some sentence"
    }
    @update_attrs %{
      definition_id: 43,
      language: "some updated language",
      note: "some updated note",
      sentence: "some updated sentence"
    }
    @invalid_attrs %{definition_id: nil, language: nil, note: nil, sentence: nil}

    def opts_sentence_fixture(attrs \\ %{}) do
      {:ok, opts_sentence} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Canons.create_opts_sentence()

      opts_sentence
    end

    test "list_opts_sentences/0 returns all opts_sentences" do
      opts_sentence = opts_sentence_fixture()
      assert Canons.list_opts_sentences() == [opts_sentence]
    end

    test "get_opts_sentence!/1 returns the opts_sentence with given id" do
      opts_sentence = opts_sentence_fixture()
      assert Canons.get_opts_sentence!(opts_sentence.id) == opts_sentence
    end

    test "create_opts_sentence/1 with valid data creates a opts_sentence" do
      assert {:ok, %Opts_sentence{} = opts_sentence} = Canons.create_opts_sentence(@valid_attrs)
      assert opts_sentence.definition_id == 42
      assert opts_sentence.language == "some language"
      assert opts_sentence.note == "some note"
      assert opts_sentence.sentence == "some sentence"
    end

    test "create_opts_sentence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canons.create_opts_sentence(@invalid_attrs)
    end

    test "update_opts_sentence/2 with valid data updates the opts_sentence" do
      opts_sentence = opts_sentence_fixture()

      assert {:ok, %Opts_sentence{} = opts_sentence} =
               Canons.update_opts_sentence(opts_sentence, @update_attrs)

      assert opts_sentence.definition_id == 43
      assert opts_sentence.language == "some updated language"
      assert opts_sentence.note == "some updated note"
      assert opts_sentence.sentence == "some updated sentence"
    end

    test "update_opts_sentence/2 with invalid data returns error changeset" do
      opts_sentence = opts_sentence_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Canons.update_opts_sentence(opts_sentence, @invalid_attrs)

      assert opts_sentence == Canons.get_opts_sentence!(opts_sentence.id)
    end

    test "delete_opts_sentence/1 deletes the opts_sentence" do
      opts_sentence = opts_sentence_fixture()
      assert {:ok, %Opts_sentence{}} = Canons.delete_opts_sentence(opts_sentence)
      assert_raise Ecto.NoResultsError, fn -> Canons.get_opts_sentence!(opts_sentence.id) end
    end

    test "change_opts_sentence/1 returns a opts_sentence changeset" do
      opts_sentence = opts_sentence_fixture()
      assert %Ecto.Changeset{} = Canons.change_opts_sentence(opts_sentence)
    end
  end
end
