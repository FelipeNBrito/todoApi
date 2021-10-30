defmodule TodoApi.Repo do
  use Ecto.Repo,
    otp_app: :todoApi,
    adapter: Ecto.Adapters.Postgres
end
