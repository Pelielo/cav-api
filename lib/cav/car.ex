defmodule Cav.Car do
    use Ecto.Schema

    schema "car" do
        field(:brand, :string)
        field(:model, :string)
    end
end