# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :angio,
  ecto_repos: [Angio.Repo]

###############
# Configures the endpoint
config :angio, AngioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+RYh5IM25whPTx3frOoppjA6wWYEsaEtemOEtKNoijli44rf8gW+Px2an3cqd3mD",
  render_errors: [view: AngioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [
    name: Angio.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
###################
####### jgour
config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

config :scrivener_html,
  routes_helper: Angio.Router.Helpers,
  view_style: :bulma

config :absinthe, schema: AngioWeb.Schema
#### jgour########

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
