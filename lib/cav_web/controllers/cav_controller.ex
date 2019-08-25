defmodule CavWeb.CavController do
  use CavWeb, :controller

  alias CavWeb.CavView

  def index(conn, _params) do
    cavs = Cav.get_cav()

    conn
    |> put_view(CavView)
    |> render("index.json", %{cavs: cavs})
  end

  def show(conn, params) do
    na_hours = Cav.get_scheduled_hours(
      params["id"], params["date"], params["procedure"])

    conn
    |> put_view(CavView)
    |> render("show.json", %{hours: na_hours})
  end
end
