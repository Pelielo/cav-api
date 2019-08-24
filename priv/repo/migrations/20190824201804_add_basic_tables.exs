defmodule Cav.Repo.Migrations.AddBasicTables do
  use Ecto.Migration

  def change do
    create table(:cav) do
      add(:name, :string)
    end

    create table(:car) do
      add(:brand, :string)
      add(:model, :string)
    end

    create table(:schedule) do
      add(:hour, :integer)
    end

    create table(:calendar) do
      add(:cav_id, references(:cav))
      add(:car_id, references(:car))
      add(:schedule_id, references(:schedule))
      add(:procedure_type, :string)
      add(:procedure_date, :date)
    end
  end
end
