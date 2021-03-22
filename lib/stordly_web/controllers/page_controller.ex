defmodule StordlyWeb.PageController do
  use StordlyWeb, :controller

  alias Stordly.Links

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"slug" => slug}) do
    case Links.get_link_by_slug(slug) do
      nil -> redirect(conn, to: "/")
      link -> redirect(conn, external: link.url)
    end
  end
end
