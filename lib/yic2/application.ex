defmodule Yic2.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Yic2Web.Telemetry,
      Yic2.Repo,
      {DNSCluster, query: Application.get_env(:yic2, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Yic2.PubSub},
      # Start a worker by calling: Yic2.Worker.start_link(arg)
      # {Yic2.Worker, arg},
      # Start to serve requests, typically the last entry
      Yic2Web.Endpoint,
      Yic2.Apis.TokenRegistry      
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yic2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Yic2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
