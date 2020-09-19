defmodule Angio.MixProject do
  use Mix.Project

  def project do
    [
      app: :angio,
      version: "0.1.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Angio.Application, []},
      extra_applications: [:logger, :runtime_tools, :scrivener_html, :scrivener_ecto, :arc_ecto]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.6"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:scrivener_ecto, "~> 2.2"},
      {:scrivener_html, "~> 1.8"},
      {:scrivener_headers, "~> 3.1"},
      {:absinthe, "~> 1.4.16"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:absinthe_plug, "~> 1.4.7"},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"},
      {:jason, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:mustache, "~> 0.3.1"},
      {:xml_builder, "~> 2.1"},
      # {:pandex, "~> 0.2.0"},
      {:arc, "~> 0.11.0"},
      # {:waffle, "~> 1.0.0"},
      # {:waffle_ecto, "~> 0.0.8"},
      # {:libgraph, "~> 0.7"},
      # {:absinthe_sorting_codec, "~> 1.0.1"},
      {:arc_ecto, "~> 0.11.2"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  # https://github.com/pragdave/earmark.git
  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
