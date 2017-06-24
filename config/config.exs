# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_graphql,
  namespace: HelloGraphQL,
  ecto_repos: [HelloGraphQL.Repo]

# Configures the endpoint
config :hello_graphql, HelloGraphQL.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yIsXDFWuDjWW2tKFVK3jFNaCUsXyWqao+jP9x0bUQjJotj//FIAO0PY5EYmJvgOO",
  render_errors: [view: HelloGraphQL.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloGraphQL.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
