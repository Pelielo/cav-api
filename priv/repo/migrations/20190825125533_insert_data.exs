defmodule Cav.Repo.Migrations.InsertData do
  use Ecto.Migration

  alias Cav.{Repo, Cav, Car, Schedule, Calendar}

  def up do
    %Cav{name: "Botafogo"} |> Repo.insert()
    %Cav{name: "Barra da Tijuca"} |> Repo.insert()
    %Cav{name: "Norte Shopping"} |> Repo.insert()

    %Car{brand: "VW", model: "Golf"} |> Repo.insert()
    %Car{brand: "Ford", model: "Fiesta"} |> Repo.insert()
    %Car{brand: "GM", model: "Cruze"} |> Repo.insert()
    %Car{brand: "GM", model: "Cobalt"} |> Repo.insert()
    %Car{brand: "Fiat", model: "Palio"} |> Repo.insert()
    %Car{brand: "VW", model: "Up"} |> Repo.insert()

    %{cav_id: 1, car_id: 1, hour: 11,
    procedure_date: ~D[2019-07-17], procedure_type: "visit"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 1, car_id: 6, hour: 14,
    procedure_date: ~D[2019-07-17], procedure_type: "visit"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 1, car_id: 6, hour: 11,
    procedure_date: ~D[2019-07-17], procedure_type: "inspection"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 2, car_id: 3, hour: 11,
    procedure_date: ~D[2019-07-17], procedure_type: "visit"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 2, car_id: 3, hour: 10,
    procedure_date: ~D[2019-07-17], procedure_type: "inspection"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 2, car_id: 4, hour: 11,
    procedure_date: ~D[2019-07-17], procedure_type: "inspection"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 2, car_id: 5, hour: 12,
    procedure_date: ~D[2019-07-17], procedure_type: "inspection"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 3, car_id: 2, hour: 11,
    procedure_date: ~D[2019-07-17], procedure_type: "inspection"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 3, car_id: 2, hour: 10,
    procedure_date: ~D[2019-07-18], procedure_type: "visit"}
    |> Calendar.changeset() |> Repo.insert()
    %{cav_id: 3, car_id: 2, hour: 14,
    procedure_date: ~D[2019-07-18], procedure_type: "visit"}
    |> Calendar.changeset() |> Repo.insert()
  end

  def down do

  end
end
