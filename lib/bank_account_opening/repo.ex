defmodule BankAccount.Repo do
  use Ecto.Repo,
    otp_app: :bank_account_opening,
    adapter: Ecto.Adapters.Postgres
end
