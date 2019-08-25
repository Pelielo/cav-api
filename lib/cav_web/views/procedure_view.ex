defmodule CavWeb.ProcedureView do
  use CavWeb, :view

  def render("show.json", %{calendar: calendar}) do
    IO.inspect(calendar)

    %{
      car_id: calendar.car_id,
      cav_id: calendar.cav_id,
      hour: calendar.hour,
      procedure_date: calendar.procedure_date,
      procedure_type: calendar.procedure_type
    }
  end
end
