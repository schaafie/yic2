defmodule Yic2.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :login, :string
      add :hash_password, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:accounts, [:user_id])
    create unique_index(:accounts, [:login])
  end
end
