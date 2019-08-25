defmodule Cav.Calendar do
    use Ecto.Schema

    import Ecto.Changeset

    schema "calendar" do
        field(:procedure_date, :date)
        field(:procedure_type, :string)
        field(:hour, :integer)

        belongs_to(:cav, Cav.Cav)
        belongs_to(:car, Cav.Car)
    end

    def changeset(schema \\ %__MODULE__{}, params) do
        schema
        |> cast(params, [:cav_id, :car_id, :hour, :procedure_date, :procedure_type])
        |> validate_required([:cav_id, :car_id, :hour, :procedure_date, :procedure_type])
        |> validate_inclusion(:procedure_type, ["visit", "inspection"])
        |> validate_inclusion(:hour, [10, 11, 12, 13, 14, 15, 16, 17])
        |> foreign_key_constraint(:cav_id)
        |> foreign_key_constraint(:car_id)
    end
end
