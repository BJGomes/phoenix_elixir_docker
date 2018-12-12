# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :p2_phoenix,
  ecto_repos: [P2Phoenix.Repo]

# Configures the endpoint
config :p2_phoenix, P2PhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n/dHF26enox+nn/CR/y/vdXHvLxlTHJoYhxRdHN1iANf+DO/Ckuc+MCXz4DI8umi",
  render_errors: [view: P2PhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: P2Phoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
