use Mix.Config

# Configure your database
config :bank_account_opening, BankAccount.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_account_opening_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bank_account_opening, BankAccountWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
