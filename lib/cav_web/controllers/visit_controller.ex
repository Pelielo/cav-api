defmodule CavWeb.VisitController do
  use CavWeb, :controller

  alias CavWeb.ProcedureView

  def create(conn, params) do
    calendar = %{
      cav_id: params["cav_id"],
      car_id: params["car_id"],
      hour: params["hour"],
      procedure_date: params["date"],
      procedure_type: "visit"
    }
    {:ok, calendar} = Cav.create_calendar(calendar)

    conn
    |> put_view(ProcedureView)
    |> render("show.json", %{calendar: calendar})
  end
end
