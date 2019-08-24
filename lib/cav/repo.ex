defmodule Cav.Repo do
  use Ecto.Repo,
    otp_app: :cav,
    adapter: Ecto.Adapters.Postgres
end
