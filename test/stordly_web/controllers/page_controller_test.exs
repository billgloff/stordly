defmodule StordlyWeb.PageControllerTest do
  use StordlyWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Stordly!"
  end
end
