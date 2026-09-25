defmodule Yic2.SchemasTest do
  use Yic2.DataCase

  alias Yic2.Schemas

  describe "schemas" do
    alias Yic2.Schemas.Schema

    import Yic2.SchemasFixtures

    @invalid_attrs %{name: nil, version: nil, description: nil, definition: nil}

    test "list_schemas/0 returns all schemas" do
      schema = schema_fixture()
      assert Schemas.list_schemas() == [schema]
    end

    test "get_schema!/1 returns the schema with given id" do
      schema = schema_fixture()
      assert Schemas.get_schema!(schema.id) == schema
    end

    test "create_schema/1 with valid data creates a schema" do
      valid_attrs = %{name: "some name", version: %{}, description: "some description", definition: %{}}

      assert {:ok, %Schema{} = schema} = Schemas.create_schema(valid_attrs)
      assert schema.name == "some name"
      assert schema.version == %{}
      assert schema.description == "some description"
      assert schema.definition == %{}
    end

    test "create_schema/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_schema(@invalid_attrs)
    end

    test "update_schema/2 with valid data updates the schema" do
      schema = schema_fixture()
      update_attrs = %{name: "some updated name", version: %{}, description: "some updated description", definition: %{}}

      assert {:ok, %Schema{} = schema} = Schemas.update_schema(schema, update_attrs)
      assert schema.name == "some updated name"
      assert schema.version == %{}
      assert schema.description == "some updated description"
      assert schema.definition == %{}
    end

    test "update_schema/2 with invalid data returns error changeset" do
      schema = schema_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_schema(schema, @invalid_attrs)
      assert schema == Schemas.get_schema!(schema.id)
    end

    test "delete_schema/1 deletes the schema" do
      schema = schema_fixture()
      assert {:ok, %Schema{}} = Schemas.delete_schema(schema)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_schema!(schema.id) end
    end

    test "change_schema/1 returns a schema changeset" do
      schema = schema_fixture()
      assert %Ecto.Changeset{} = Schemas.change_schema(schema)
    end
  end
end
