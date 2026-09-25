defmodule Yic2.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :infix, :string
      add :lastname, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
    create unique_index(:users, [:email])
  end
end
