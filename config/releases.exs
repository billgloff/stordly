import Config

defmodule Environment do
  @moduledoc """
  This modules provides various helpers to handle environment metadata
  """

  def get(key), do: System.get_env(key)

  def get_boolean(key) do
    case get(key) do
      "true" -> true
      "1" -> true
      _ -> false
    end
  end

  def get_integer(key) do
    case get(key) do
      value when is_bitstring(value) -> String.to_integer(value)
      _ -> nil
    end
  end

  def get_list_or_first_value(key) do
    with value when is_bitstring(value) <- get(key),
         [single_value] <- String.split(value, ",") do
      single_value
    else
      value when is_list(value) -> value
      _ -> nil
    end
  end

  def get_endpoint_static_url_config(nil), do: nil
  def get_endpoint_static_url_config(""), do: nil

  def get_endpoint_static_url_config(host) do
    [
      host: host,
      scheme: get("STATIC_URL_SCHEME"),
      port: get("STATIC_URL_PORT")
    ]
  end
end

force_ssl = Environment.get_boolean("FORCE_SSL")
scheme = if force_ssl, do: "https", else: "http"
host = Environment.get("CANONICAL_HOST")
port = Environment.get("PORT")

config :stordly,
  canonical_host: host,
  force_ssl: force_ssl

config :stordly, Stordly.Repo,
  pool_size: Environment.get_integer("DATABASE_POOL_SIZE"),
  ssl: Environment.get_boolean("DATABASE_SSL"),
  url: Environment.get("DATABASE_URL")

config :stordly, StordlyWeb.Endpoint,
  debug_errors: Environment.get_boolean("DEBUG_ERRORS"),
  http: [port: port],
  secret_key_base: Environment.get("SECRET_KEY_BASE"),
  static_url: Environment.get_endpoint_static_url_config(Environment.get("STATIC_URL_HOST")),
  url: [host: host, scheme: scheme, port: port]

config :stordly, StordlyWeb.Router,
  session_key: Environment.get("SESSION_KEY"),
  session_signing_salt: Environment.get("SESSION_SIGNING_SALT")

# config :stordly, Corsica, origins: Environment.get_list_or_first_value("CORS_ALLOWED_ORIGINS")
