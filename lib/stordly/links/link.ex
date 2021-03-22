defmodule Stordly.Links.Link do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :slug, :string
    field :url, :string

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :slug])
    |> validate_required([:url, :slug])
    |> validate_url(:url, message: "URL is not a valid URL!")
  end

  defp validate_url(changeset, field, options) do
    validate_change(changeset, field, fn _, url ->
      case url |> String.to_charlist() |> :http_uri.parse() do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || "invalid url: #{inspect(msg)}"}]
      end
    end)
  end
end
