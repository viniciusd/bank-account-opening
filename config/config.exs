# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bank_account_opening,
  namespace: BankAccount,
  ecto_repos: [BankAccount.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :bank_account_opening, BankAccountWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8fileez7P++OS8GjmNp0+2M4aLGx603hrsEnFhcws4lkr4pIRzqf6C8AddsVc6VX",
  render_errors: [view: BankAccountWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: BankAccount.PubSub,
  live_view: [signing_salt: "qKdX2NFz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
