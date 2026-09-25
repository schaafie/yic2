defmodule Yic2.Repo.Migrations.CreateSchemas do
  use Ecto.Migration

  def change do
    create table(:schemas) do
      add :name, :string
      add :description, :string
      add :version, :map
      add :definition, :map

      timestamps(type: :utc_datetime)
    end
  end
end
