defmodule Yic2.Repo.Migrations.CreateDataelements do
  use Ecto.Migration

  def change do
    create table(:dataelements) do
      add :name, :string
      add :comment, :string
      add :version, :map
      add :definition, :map
      add :actions, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
