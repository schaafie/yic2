defmodule Yic2Web.SchemaControllerTest do
  use Yic2Web.ConnCase

  import Yic2.SchemasFixtures
  alias Yic2.Schemas.Schema

  @create_attrs %{
    name: "some name",
    version: %{},
    description: "some description",
    definition: %{}
  }
  @update_attrs %{
    name: "some updated name",
    version: %{},
    description: "some updated description",
    definition: %{}
  }
  @invalid_attrs %{name: nil, version: nil, description: nil, definition: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all schemas", %{conn: conn} do
      conn = get(conn, ~p"/api/schemas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create schema" do
    test "renders schema when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/schemas", schema: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/schemas/#{id}")

      assert %{
               "id" => ^id,
               "definition" => %{},
               "description" => "some description",
               "name" => "some name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/schemas", schema: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update schema" do
    setup [:create_schema]

    test "renders schema when data is valid", %{conn: conn, schema: %Schema{id: id} = schema} do
      conn = put(conn, ~p"/api/schemas/#{schema}", schema: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/schemas/#{id}")

      assert %{
               "id" => ^id,
               "definition" => %{},
               "description" => "some updated description",
               "name" => "some updated name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, schema: schema} do
      conn = put(conn, ~p"/api/schemas/#{schema}", schema: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete schema" do
    setup [:create_schema]

    test "deletes chosen schema", %{conn: conn, schema: schema} do
      conn = delete(conn, ~p"/api/schemas/#{schema}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/schemas/#{schema}")
      end
    end
  end

  defp create_schema(_) do
    schema = schema_fixture()

    %{schema: schema}
  end
end
