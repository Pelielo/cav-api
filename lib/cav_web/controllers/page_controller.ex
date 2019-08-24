defmodule CavWeb.PageController do
  use CavWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
