defmodule Stordly.Links do
  @moduledoc """
  The Links context.
  """

  import Ecto.Query, warn: false

  alias Stordly.IdGenerator
  alias Stordly.Links.Link
  alias Stordly.Repo

  @doc """
  Gets a single link by it's slug.

  Returns nil if the Link does not exist.

  ## Examples

      iex> get_link_by_slug(123)
      %Link{}

      iex> get_link_by_slug(456)
      nil

  """
  def get_link_by_slug(slug) do
    Repo.get_by(Link, slug: slug)
  end

  @doc """
  Gets a single link by it's url.

  Returns nil if the Link does not exist.

  ## Examples

      iex> get_link_by_url('http://google.com')
      %Link{}

      iex> get_link_by_url('foo')
      nil

  """
  def get_link_by_url(url) do
    Repo.get_by(Link, url: url)
  end

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(%{"url" => url} = attrs) do
    case __MODULE__.get_link_by_url(url) do
      nil -> create_link_with_generated_slug(attrs)
      link -> {:ok, link}
    end
  end

  defp create_link_with_generated_slug(attrs) do
    slug = IdGenerator.generate_id()

    %Link{slug: slug}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.

  ## Examples

      iex> change_link(link)
      %Ecto.Changeset{data: %Link{}}

  """
  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end
end
