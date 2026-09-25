defmodule Yic2.SchemasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yic2.Schemas` context.
  """

  @doc """
  Generate a schema.
  """
  def schema_fixture(attrs \\ %{}) do
    {:ok, schema} =
      attrs
      |> Enum.into(%{
        definition: %{},
        description: "some description",
        name: "some name",
        version: %{}
      })
      |> Yic2.Schemas.create_schema()

    schema
  end
end
