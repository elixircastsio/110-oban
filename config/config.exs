# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :teacher,
  ecto_repos: [Teacher.Repo]

# Configures the endpoint
config :teacher, TeacherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5vSFFqvKmimrE1eVe+Pw+cyHpaUSfnYR98zoVV8IQUIOwzg6ftBbI9jKZaR5IfBA",
  render_errors: [view: TeacherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Teacher.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :teacher, Oban,
  repo: Teacher.Repo,
  prune: {:maxlen, 5_000},
  queues: [default: 2, hard_worker: 2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
