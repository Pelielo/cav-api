defmodule Cav.Calendar do
    use Ecto.Schema

    import Ecto.Changeset

    schema "calendar" do
        field(:procedure_date, :date)
        field(:procedure_type, :string)

        belongs_to(:cav, Cav.Cav)
        belongs_to(:car, Cav.Car)
        belongs_to(:schedule, Cav.Schedule)
    end

    def changeset(schema \\ %__MODULE__{}, params) do
        schema
        |> cast(params, [:procedure_date, :procedure_type])
        |> validate_inclusion(:procedure_type, ["visit", "inspection"])
    end
end
