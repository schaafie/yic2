defmodule Yic2.Iam.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstname, :string
    field :infix, :string
    field :lastname, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :infix, :lastname, :email])
    |> validate_required([:firstname, :lastname, :email])
  end
end
