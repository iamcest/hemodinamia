defmodule AngioWeb.DefinitionResolver do
  alias Angio.Repo
  # alias Ecto.Query
  # alias Angio.Canons.Definition

  def get_definition(_parent, %{id: id}, _resolution) do
    case Angio.Canons.get_definition!(id) do
      nil ->
        {:error, "Definition ID #{id} not found"}

      definition ->
        {:ok, definition}
    end
  end

  ########################

  def get_sentence(_parent, %{definition_id: definition_id, language: language}, _resolution) do
    case Angio.Canons.get_sentence(definition_id, language) do
      nil ->
        {:error, "Definition definition_id #{definition_id} not found"}

      definition ->
        {:ok, definition}
    end
  end

  def get_report_opts_sentence(
        _parent,
        %{defs_option_id: defs_option_id, language: language},
        _resolution
      ) do
    case Angio.Canons.get_report_opts_sentence(defs_option_id, language) do
      nil ->
        {:error, "Definition defs_option #{defs_option_id} not found"}

      opts_sentence ->
        {:ok, opts_sentence}
    end
  end

  def get_opts_codes(
        _parent,
        %{defs_option_id: defs_option_id},
        _resolution
      ) do
    case Angio.Canons.get_opts_codes(defs_option_id) do
      nil ->
        {:error, "ID #{defs_option_id} not found"}

      opts_codes ->
        {:ok, opts_codes}
    end
  end

  ##################################
  def get_defs_codes(_parent, %{definition_id: definition_id}, _resolution) do
    case Angio.Canons.get_defs_codes(definition_id) do
      nil ->
        {:error, "Definition definition_id #{definition_id} not found"}

      defs_code ->
        {:ok, defs_code}
    end
  end

  ########################

  ########################
  def search_definition_name(_parent, %{name: name}, _resolution) do
    case Angio.Canons.search_definition_name(name) do
      nil ->
        {:error, "Definition Name #{name} not found"}

      definition ->
        {:ok, Repo.all(definition)}
    end
  end

  ##############################

  ######## module###############################
end
