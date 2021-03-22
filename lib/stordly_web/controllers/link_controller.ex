defmodule StordlyWeb.LinkController do
  use StordlyWeb, :controller

  alias Stordly.Links
  alias Stordly.Links.Link

  action_fallback StordlyWeb.FallbackController

  def create(conn, link_params) do
    with {:ok, %Link{} = link} <- Links.create_link(link_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.link_path(conn, :show, link))
      |> render("show.json", link: link)
    end
  end
end
