defmodule Cav do
  alias Cav.{Repo, Cav, Calendar, Schedule}

  import Ecto.Query, only: [from: 2]

  @spec get_cav(any) :: any
  def get_cav(id) do
    Repo.get(Cav, id)
  end

  @spec get_cav :: any
  def get_cav do
    Repo.all(Cav)
  end

  def get_scheduled_hours(cav_id, procedure_date, procedure_type) do
    query = from(c in Calendar,
      where: field(c, :cav_id) == ^cav_id
        and field(c, :procedure_date) == ^procedure_date
        and field(c, :procedure_type) == ^procedure_type,
      select: %{
        hour: c.hour
      })

    Repo.all(query)
  end

  def create_calendar(params) do
    params
    |> Calendar.changeset()
    |> case do
      %{valid?: true} = changeset ->
        Repo.insert(changeset)

      changeset ->
        {:error, changeset |> IO.inspect(label: "changeset")}
    end
  end
end
