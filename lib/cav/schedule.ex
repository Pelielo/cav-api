defmodule Cav.Schedule do
    use Ecto.Schema

    import Ecto.Changeset

    schema "schedule" do
        field(:hour, :integer)
    end

    def changeset(schema \\ %__MODULE__{}, params) do
        schema
        |> cast(params, [:hour])
        |> validate_inclusion(:hour, Enum.to_list(0..23))
    end

end
