defmodule HelloGraphQL.PageControllerTest do
  use HelloGraphQL.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to GraphQL Elixir!"
  end
end
