defmodule Yic2.Schemas.Schema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schemas" do
    field :name, :string
    field :description, :string
    field :version, :map
    field :definition, :map

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :description, :version, :definition])
    |> validate_required([:name, :description])
  end
end
