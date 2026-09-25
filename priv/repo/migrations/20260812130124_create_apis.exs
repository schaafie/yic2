defmodule Yic2.Repo.Migrations.CreateApis do
  use Ecto.Migration

  def change do
    create table(:apis) do
      add :name, :string
      add :description, :string
      add :version, :map
      add :request, :string
      add :definition, :map

      timestamps(type: :utc_datetime)
    end
  end
end
