defmodule Yic2.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset
  import Yic2.SchemaValidator

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
    |> cast(attrs, [:name, :comment, :version, :definition, :owner])
    |> validate_changes_against_schema( "form" )
  end
end
