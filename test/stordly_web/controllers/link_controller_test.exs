defmodule StordlyWeb.LinkControllerTest do
  use StordlyWeb.ConnCase

  alias Stordly.Links

  @create_attrs %{
    url: "http://google.com"
  }
  @invalid_attrs %{url: ""}

  def fixture(:link) do
    {:ok, link} = Links.create_link(@create_attrs)
    link
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create link" do
    test "renders link when data is valid", %{conn: conn} do
      conn = post(conn, Routes.link_path(conn, :create), @create_attrs)
      assert %{"slug" => _slug} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.link_path(conn, :create), @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
