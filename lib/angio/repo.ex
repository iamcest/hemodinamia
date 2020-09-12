defmodule Angio.Repo do
  use Scrivener, page_size: 10

  use Ecto.Repo,
    otp_app: :angio,
    adapter: Ecto.Adapters.Postgres
end
