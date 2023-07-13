defmodule PasswordApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PasswordApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PasswordApi.PubSub},
      # Start the Endpoint (http/https)
      PasswordApiWeb.Endpoint
      # Start a worker by calling: PasswordApi.Worker.start_link(arg)
      # {PasswordApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PasswordApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PasswordApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
