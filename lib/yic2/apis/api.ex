defmodule Yic2.Apis.Api do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apis" do
    field :name, :string
    field :description, :string
    field :version, :map
    field :request, :string
    field :definition, :map

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(api, attrs) do
    api
    |> cast(attrs, [:name, :description, :version, :request, :definition])
    |> validate_required([:name, :description, :request])
  end
end
