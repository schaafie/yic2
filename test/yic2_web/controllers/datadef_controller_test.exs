defmodule Yic2Web.DatadefControllerTest do
  use Yic2Web.ConnCase

  import Yic2.FormsFixtures
  alias Yic2.Forms.Datadef

  @create_attrs %{
    name: "some name",
    version: %{},
    comment: "some comment",
    definition: %{}
  }
  @update_attrs %{
    name: "some updated name",
    version: %{},
    comment: "some updated comment",
    definition: %{}
  }
  @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all datadefs", %{conn: conn} do
      conn = get(conn, ~p"/api/datadefs")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create datadef" do
    test "renders datadef when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/datadefs", datadef: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/datadefs/#{id}")

      assert %{
               "id" => ^id,
               "comment" => "some comment",
               "definition" => %{},
               "name" => "some name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/datadefs", datadef: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update datadef" do
    setup [:create_datadef]

    test "renders datadef when data is valid", %{conn: conn, datadef: %Datadef{id: id} = datadef} do
      conn = put(conn, ~p"/api/datadefs/#{datadef}", datadef: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/datadefs/#{id}")

      assert %{
               "id" => ^id,
               "comment" => "some updated comment",
               "definition" => %{},
               "name" => "some updated name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, datadef: datadef} do
      conn = put(conn, ~p"/api/datadefs/#{datadef}", datadef: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete datadef" do
    setup [:create_datadef]

    test "deletes chosen datadef", %{conn: conn, datadef: datadef} do
      conn = delete(conn, ~p"/api/datadefs/#{datadef}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/datadefs/#{datadef}")
      end
    end
  end

  defp create_datadef(_) do
    datadef = datadef_fixture()

    %{datadef: datadef}
  end
end
