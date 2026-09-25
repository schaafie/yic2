defmodule Yic2.Forms.Dataelement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dataelements" do
    field :name, :string
    field :comment, :string
    field :version, :map
    field :definition, :map
    field :actions, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dataelement, attrs) do
    dataelement
    |> cast(attrs, [:name, :comment, :version, :definition, :actions])
    |> validate_required([:name, :comment, :actions])
  end
end
