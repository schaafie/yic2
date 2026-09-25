defmodule Yic2.Repo do
  use Ecto.Repo,
    otp_app: :yic2,
    adapter: Ecto.Adapters.Postgres
end
