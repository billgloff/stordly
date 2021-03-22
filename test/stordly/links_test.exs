defmodule Stordly.LinksTest do
  use Stordly.DataCase

  alias Stordly.Links

  describe "links" do
    alias Stordly.Links.Link

    @valid_attrs %{"url" => "https://google.com"}
    @invalid_attrs %{"url" => ""}

    def link_fixture(attrs \\ %{}) do
      {:ok, link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Links.create_link()

      link
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.url == @valid_attrs["url"]
      assert Regex.match?(~r/^[A-Za-z0-9]{7}$/, link.slug) == true
    end

    test "create_link/1 with missing url returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Links.create_link(@invalid_attrs)
    end

    test "create_link/1 with invalid url returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Links.create_link(%{"url" => "httttp://foo"})
    end

    test "create_link/1 should return existing link if it exists" do
      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.url == @valid_attrs["url"]
      assert Regex.match?(~r/^[A-Za-z0-9]{7}$/, link.slug) == true

      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.url == @valid_attrs["url"]
      assert Regex.match?(~r/^[A-Za-z0-9]{7}$/, link.slug) == true
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Links.change_link(link)
    end
  end
end
