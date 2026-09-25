defmodule Yic2.Repo.Migrations.CreateDatadefs do
  use Ecto.Migration

  def change do
    create table(:datadefs) do
      add :name, :string
      add :comment, :string
      add :version, :map
      add :definition, :map

      timestamps(type: :utc_datetime)
    end
  end
end
