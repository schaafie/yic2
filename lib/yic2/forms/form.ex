defmodule Yic2.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forms" do
    field :name, :string
    field :comment, :string
    field :version, :map
    field :definition, :map
    field :owner, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :comment, :version, :definition])
    |> validate_required([:name, :comment])
  end
end
