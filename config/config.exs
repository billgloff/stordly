# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stordly,
  ecto_repos: [Stordly.Repo]

# Configures the endpoint
config :stordly, StordlyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EKEo2bgm0gKO8VIkjpwiQe7crw6qNE5uHcD6aCt7wVS+wcS3t6usllFaMSQLuwP4",
  render_errors: [view: StordlyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Stordly.PubSub,
  live_view: [signing_salt: "mS6RnWJ2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
