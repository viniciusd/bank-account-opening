defmodule BankAccountWeb.Router do
  use BankAccountWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BankAccountWeb do
    pipe_through :api
    if Mix.env() in [:dev, :test] do
      import Phoenix.LiveDashboard.Router

      live_dashboard "/dashboard", metrics: BankAccountWeb.Telemetry
    end
  end
end
