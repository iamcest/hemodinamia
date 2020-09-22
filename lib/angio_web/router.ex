defmodule AngioWeb.Router do
  use AngioWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(:fetch_flash)
    # plug(Phoenix.LiveView.Flash)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  forward("/graphql", Absinthe.Plug, schema: AngioWeb.Schema)

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: AngioWeb.Schema,
    interface: :simple,
    context: %{pubsub: AngioWeb.Endpoint}
  )

  scope "/", AngioWeb do
    pipe_through(:browser)
    # live("/counter", CounterLive)

    #    live "/thermostat", ThermostatLive
    # in Index
    # <li><%= link "Thermostat", to: Routes.live_path(@conn, AngioWeb.ThermostatLive) %></li>

    get("/", PageController, :index)
    post("/patients/search_patients", PatientController, :search_patients)
    ######## Routes for field Help
    post("/definitions/search_instructions", DefinitionController, :search_instructions)

    post(
      "/definitions/search_support_definitions",
      DefinitionController,
      :search_support_definitions
    )

    post("/definitions/search_notes", DefinitionController, :search_notes)

    post(
      "/definitions/search_option_definitions",
      DefinitionController,
      :search_option_definitions
    )

    #####################
    post("/definitions/search_definitions", DefinitionController, :search_definitions)
    post("/defs_tables/search_in_tables", Defs_tableController, :search_in_tables)

    resources "/patients", PatientController, as: :pt do
      resources("/contacts", ContactController, as: :contacts)
      resources("/asd_closures_fups", Asd_closures_fupController, as: :asdclf)
      resources("/pci_fups", Pci_fupController, as: :pcif)
      resources("/treadmill_exercises", Treadmill_exerciseController, as: :ext)

      resources("/cardiac_echoes", Cardiac_echoController, as: :echo) do
        resources("/echo_left_atriums", Echo_left_atriumController, as: :ela)
        resources("/echo_right_atriums", Echo_right_atriumController, as: :era)
        resources("/echo_ventricle_lefts", Echo_ventricle_leftController, as: :elv)
        resources("/echo_ventricle_left_systolic_funcs", Echo_ventricle_left_systolic_funcController, as: :elvsf)

      end

      ########## CORONARY ANGIO#################
      resources(
        "/info_coronaries",
        Info_coronaryController,
        only: [:index, :new, :create],
        as: :angio
      )

      resources "/info_coronaries", Info_coronaryController,
        except: [:index, :new, :create],
        as: :angio do
        resources("/care_episodes", Care_episodeController, as: :episode)
        resources("/clinical_exams_cardios", Clinical_exam_cardioController, as: :cle_cardio)
        resources("/chest_pains", Chest_painsController, as: :chestp)
        resources("/proc_episodes", Proc_episodeController, as: :proc_episode)
        resources("/chd_care_episodes", Chd_care_episodeController, as: :chd_episode)
        resources("/chd_conditions", Chd_conditionController, as: :chd_condition)
        resources("/chd_risk_factors", Chd_risk_factorController, as: :chd_risk)
        resources("/cor_collaterals", Cor_collateralController, as: :collateral)
        resources("/cor_anatomies", Cor_anatomyController, as: :anatomy)
        resources("/cor_lesions", Cor_lesionController, as: :lesion)
        resources("/cath_grafts", Cath_graftController, as: :graft)
        resources("/sats_pressures", Sats_pressureController, as: :satpres)

        resources("/angio_report", Angio_reportController, as: :report)
        post("/choose_report", Angio_reportController, :choose_report)
        resources("/Cor_tree", Cor_treeController, as: :cor_tree)
        resources("/Infect_history", Infect_historyController, as: :infh)
        resources("/Core_history", Core_historyController, as: :coreh)
        resources("/Social_history", Social_historyController, as: :socialh)
        resources("/Proc_history", Proc_historyController, as: :proch)
        resources("/Electrocardiogram", ElectrocardiogramController, as: :ecg)

        resources("/cath_clinicals", Cath_clinicalController, as: :clinical)
        # resources("/cath_stresses", Cath_stressController, as: :stress)
        resources("/cath_events", Cath_eventController, as: :event)
        # resources("/cath_report", Cath_reportController, as: :cath_report)
        resources("/lventricles", LventricleController, as: :lv)
        resources("/vital_signs", Vital_signController, as: :vitals)
        resources("/functional_states", Functional_stateController, as: :funs)

        resources("/cath_meds", Cath_medController, as: :cathmed)
        resources("/cath_radiations", Cath_radiationController, as: :radiation)
        resources("/cor_mediae", Cor_mediaController, as: :cor_media)
        resources("/cath_labs", Cath_labController, as: :cath_lab)
        resources("/asd_closures", Asd_closureController, as: :asdcl)

        resources("/pci_procedures", Pci_procedureController, as: :pci_proc) do
          resources("/pci_lesions", Pci_lesionController, as: :lesion)
        end

        resources("/coarc_procedures", Coarc_procedureController, as: :coarc) do
          resources("/coarc_devices", Coarc_deviceController, as: :device)
        end

        resources("/av_plasties", Av_plastyController, as: :avp) do
          resources("/av_plasties_inflations", Av_plasties_inflationController, as: :avpi)
        end
      end

      ## end for info_coronaries
    end

    ## end for partients
    ################ DATA FOR DRAW CORONARY TREE##################
    resources("/tree_natives", Tree_nativesController)
    resources("/loincs", LoincController)
    post("/loincs/search_loincs", LoincController, :search_loincs)

    ########## DEFINITIONS OF FIELDS #########
    resources("/defs_tables", Defs_tableController)

    resources "/definitions", DefinitionController do
      resources("/defs_sentences", Defs_sentenceController)
      resources("/defs_codes", Defs_codeController)

      resources "/defs_options", Defs_optionController do
        resources("/opts_codes", Opts_codeController, only: [:index, :new, :create])
        resources("/opts_codes", Opts_codeController)
        resources("/opts_sentences", Opts_sentenceController)
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", AngioWeb do
  #   pipe_through :api
  # end
end
