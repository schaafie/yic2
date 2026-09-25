defmodule Yic2.Iam.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :login, :string
    field :hash_password, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:login, :hash_password])
    |> validate_required([:login, :hash_password])
    |> unique_constraint(:login)
    |> validate_length(:hash_password, min: 8)
    |> put_password_hash()
  end

  defp put_password_hash( %Ecto.Changeset{valid?: true, changes: %{hash_password: hash_password}} = changeset ) do
    change(changeset, hash_password: Bcrypt.hash_pwd_salt(hash_password))
  end

  defp put_password_hash(changeset), do: changeset
end
