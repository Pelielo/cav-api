defmodule CavWeb.CavView do
  use CavWeb, :view

  def render("index.json", %{cavs: cavs}) do
    cavs |>
      Enum.map(fn x -> %{id: x.id, name: x.name} end)
  end

  def render("show.json", %{hours: hours}) do
    na_hours = hours |>
      Enum.reduce([], fn(x, acc) -> acc ++ [x.hour] end)

    available_hours = [10, 11, 12, 13, 14, 15, 16, 17] -- na_hours

    %{available_hours: available_hours}
  end
end
