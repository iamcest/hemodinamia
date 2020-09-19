defmodule AngioWeb.Schema do
  use Absinthe.Schema
  # The import_Types macro brings our types in to use
  import_types(AngioWeb.Schema.Types)
  # import_types(Absinthe.Type.Custom)

  query do
    field :get_info_coronary, :info_coronary do
      arg(:id, non_null(:id))
      resolve(&AngioWeb.CorDiagramResolver.get_info_coronary/3)
    end

    ##########################

    @desc "Get a definition"
    field :get_definition, :definition do
      arg(:id, non_null(:id))
      resolve(&AngioWeb.DefinitionResolver.get_definition/3)
    end

    field :search_definition_name, list_of(:definition) do
      arg(:name, :string)
      resolve(&AngioWeb.DefinitionResolver.search_definition_name/3)
    end

    @desc "Get a sentence to make the reports"
    field :get_sentence, :defs_sentence do
      arg(:definition_id, non_null(:id))
      arg(:language, :string)
      resolve(&AngioWeb.DefinitionResolver.get_sentence/3)
    end

    @desc "Get Defs_codes for a particular Field - Definition"
    field :get_defs_codes, :defs_code do
      arg(:definition_id, non_null(:id))
      resolve(&AngioWeb.DefinitionResolver.get_defs_codes/3)
    end

    ########################
    @desc "Get a sentence to make the reports"
    field :get_report_opts_sentence, :opts_sentence do
      arg(:defs_option_id, non_null(:id))
      arg(:language, :string)
      resolve(&AngioWeb.DefinitionResolver.get_report_opts_sentence/3)
    end

    @desc "Get defs_options_codes"
    field :get_opts_codes, :opts_code do
      arg(:defs_option_id, non_null(:id))
      resolve(&AngioWeb.DefinitionResolver.get_opts_codes/3)
    end

    ##############################
    @desc "Get a Report"

    field :get_patient_report, :patient do
      arg(:id, non_null(:id))
      resolve(&AngioWeb.PatientResolver.make_patient_report/3)
    end

    ################################
    field :get_patient_overview, :patient do
      arg(:id, non_null(:id))
      resolve(&AngioWeb.PatientResolver.make_patient_overview/3)
    end

    #######

    mutation do
      field :create_patient, :patient do
      end
    end

    """
    {getReport(
    id:"15"
    )
    {lastName
    cathProcedures{
    icdRevisionHas
    }
    }
    }
    """
  end

  # query

  ######################
end

# module
