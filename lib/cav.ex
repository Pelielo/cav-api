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

  def get_available_hours(cav_id, procedure_date, procedure_type) do
    innerquery = from(c in Calendar,
      where: field(c, :cav_id) == ^cav_id
        and field(c, :procedure_date) == ^procedure_date
        and field(c, :procedure_type) == ^procedure_type,
      select: %{
        schedule_id: c.schedule_id
      })

    query = from(s in Schedule,
      left_join: c in subquery(innerquery), on: s.id == c.schedule_id,
      where: field(c, :schedule_id) |> is_nil,
      select: %{
        hour: s.hour
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
