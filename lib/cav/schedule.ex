defmodule Cav.Schedule do
    use Ecto.Schema

    import Ecto.Changeset

    schema "schedule" do
        field(:hour, :integer)
    end

    def changeset(schema \\ %__MODULE__{}, params) do
        schema
        |> cast(params, [:hour])
        |> validate_inclusion(:hour, [10, 11, 12, 13, 14, 15, 16, 17])
    end

end
