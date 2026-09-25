defmodule Yic2.Forms.Datadef do
  use Ecto.Schema
  import Ecto.Changeset

  schema "datadefs" do
    field :name, :string
    field :comment, :string
    field :version, :map
    field :definition, :map

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(datadef, attrs) do
    datadef
    |> cast(attrs, [:name, :comment, :version, :definition])
    |> validate_required([:name, :comment])
  end
end
