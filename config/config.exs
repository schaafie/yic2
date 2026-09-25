# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :yic2,
  ecto_repos: [Yic2.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configure the endpoint
config :yic2, Yic2Web.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: Yic2Web.ErrorJSON],
    layout: false
  ],
  pubsub_server: Yic2.PubSub,
  live_view: [signing_salt: "WXIaCVv4"]

# Configure the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :yic2, Yic2.Mailer, adapter: Swoosh.Adapters.Local

config :yic2, Yic2.Guardian,
  issuer: "yic2",
  secret_key: "--YcSXtEOS1M81q2NLoh8ucd_sMFoQSMFgD1rgmGhhCKyNh0nmTXLR29LWq4AGSl"

# Configure Elixir's Logger
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
