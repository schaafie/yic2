defmodule Yic2Web.SchemaJSON do
  alias Yic2.Schemas.Schema

  @doc """
  Renders a list of schemas.
  """
  def index(%{schemas: schemas}) do
    %{data: for(schema <- schemas, do: data(schema))}
  end

  @doc """
  Renders a single schema.
  """
  def show(%{schema: schema}) do
    %{data: data(schema)}
  end

  defp data(%Schema{} = schema) do
    %{
      id: schema.id,
      name: schema.name,
      description: schema.description,
      version: schema.version,
      definition: schema.definition
    }
  end
end
