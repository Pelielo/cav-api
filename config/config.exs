# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cav,
  ecto_repos: [Cav.Repo]

# Configures the endpoint
config :cav, CavWeb.Endpoint,
  url: [host: "db"],
  secret_key_base: "SMVfkma2Fc3g7eYyWZVl5HBX210D+PKl3oSkDVBk37bqhj6q5cG2zrEqBAkOdJH3",
  render_errors: [view: CavWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cav.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
