defmodule Form.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Form.Repo,
      # Start the Telemetry supervisor
      FormWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Form.PubSub},
      # Start the Endpoint (http/https)
      FormWeb.Endpoint
      # Start a worker by calling: Form.Worker.start_link(arg)
      # {Form.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Form.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FormWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
