defmodule Yic2.Repo.Migrations.CreateForms do
  use Ecto.Migration

  def change do
    create table(:forms) do
      add :name, :string
      add :comment, :string
      add :version, :map
      add :definition, :map
      add :owner, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:forms, [:owner])
  end
end
