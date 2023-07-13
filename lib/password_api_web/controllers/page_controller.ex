defmodule PasswordApiWeb.PageController do
  use PasswordApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
