defmodule Yic2.Forms.Datasource do
  use Ecto.Schema
  import Ecto.Changeset

  schema "datasources" do
    field :name, :string
    field :comment, :string
    field :version, :map
    field :definition, :map
    field :actions, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(datasource, attrs) do
    datasource
    |> cast(attrs, [:name, :comment, :version, :definition, :actions])
    |> validate_required([:name, :comment, :actions])
  end
end
