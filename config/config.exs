# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :splurty, Splurty.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4Xh7fxbev6ZyxsiKhJ0iTrnsPB8cdbC/RSuN1x9tjm1f/t9wubixutpOwDZDt/Mj",
  debug_errors: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
