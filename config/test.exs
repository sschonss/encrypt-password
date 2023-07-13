import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :password_api, PasswordApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "psq4dtZFUe17UkrYUL5W80R6aSQjc+ErqBwZyRvGtnbozRTK1/FtjJW7Pb4+Miqq",
  server: false

# In test we don't send emails.
config :password_api, PasswordApi.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
