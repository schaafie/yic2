defmodule Yic2Web.ApiControllerTest do
  use Yic2Web.ConnCase

  import Yic2.ApisFixtures
  alias Yic2.Apis.Api

  @create_attrs %{
    name: "some name",
    version: %{},
    request: "some request",
    description: "some description",
    definition: %{}
  }
  @update_attrs %{
    name: "some updated name",
    version: %{},
    request: "some updated request",
    description: "some updated description",
    definition: %{}
  }
  @invalid_attrs %{name: nil, version: nil, request: nil, description: nil, definition: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apis", %{conn: conn} do
      conn = get(conn, ~p"/api/apis")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api" do
    test "renders api when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/apis", api: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/apis/#{id}")

      assert %{
               "id" => ^id,
               "definition" => %{},
               "description" => "some description",
               "name" => "some name",
               "request" => "some request",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/apis", api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api" do
    setup [:create_api]

    test "renders api when data is valid", %{conn: conn, api: %Api{id: id} = api} do
      conn = put(conn, ~p"/api/apis/#{api}", api: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/apis/#{id}")

      assert %{
               "id" => ^id,
               "definition" => %{},
               "description" => "some updated description",
               "name" => "some updated name",
               "request" => "some updated request",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api: api} do
      conn = put(conn, ~p"/api/apis/#{api}", api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api" do
    setup [:create_api]

    test "deletes chosen api", %{conn: conn, api: api} do
      conn = delete(conn, ~p"/api/apis/#{api}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/apis/#{api}")
      end
    end
  end

  defp create_api(_) do
    api = api_fixture()

    %{api: api}
  end
end
