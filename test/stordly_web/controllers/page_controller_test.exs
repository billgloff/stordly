defmodule StordlyWeb.PageControllerTest do
  use StordlyWeb.ConnCase

  alias Stordly.Links

  @create_attrs %{
    "url" => "http://google.com"
  }

  def fixture(:link) do
    {:ok, link} = Links.create_link(@create_attrs)
    link
  end

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Stordly"
  end

  describe "Get Shortened URL" do
    setup [:create_link]

    test "GET /:slug redirects to url with valid slug", %{conn: conn, link: link} do
      conn = get(conn, Routes.page_path(conn, :show, link.slug))
      assert link.url == redirected_to(conn, 302)
    end

    test "GET /:slug redirects to homepage on invalid slug", %{conn: conn, link: _link} do
      conn = get(conn, "/InvalidSlug")
      assert "/" == redirected_to(conn, 302)
    end

    defp create_link(_) do
      link = fixture(:link)
      %{link: link}
    end
  end
end
