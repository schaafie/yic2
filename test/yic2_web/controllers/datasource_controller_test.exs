defmodule Yic2Web.DatasourceControllerTest do
  use Yic2Web.ConnCase

  import Yic2.FormsFixtures
  alias Yic2.Forms.Datasource

  @create_attrs %{
    name: "some name",
    version: %{},
    comment: "some comment",
    definition: %{},
    actions: ["option1", "option2"]
  }
  @update_attrs %{
    name: "some updated name",
    version: %{},
    comment: "some updated comment",
    definition: %{},
    actions: ["option1"]
  }
  @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil, actions: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all datasources", %{conn: conn} do
      conn = get(conn, ~p"/api/datasources")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create datasource" do
    test "renders datasource when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/datasources", datasource: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/datasources/#{id}")

      assert %{
               "id" => ^id,
               "actions" => ["option1", "option2"],
               "comment" => "some comment",
               "definition" => %{},
               "name" => "some name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/datasources", datasource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update datasource" do
    setup [:create_datasource]

    test "renders datasource when data is valid", %{conn: conn, datasource: %Datasource{id: id} = datasource} do
      conn = put(conn, ~p"/api/datasources/#{datasource}", datasource: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/datasources/#{id}")

      assert %{
               "id" => ^id,
               "actions" => ["option1"],
               "comment" => "some updated comment",
               "definition" => %{},
               "name" => "some updated name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, datasource: datasource} do
      conn = put(conn, ~p"/api/datasources/#{datasource}", datasource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete datasource" do
    setup [:create_datasource]

    test "deletes chosen datasource", %{conn: conn, datasource: datasource} do
      conn = delete(conn, ~p"/api/datasources/#{datasource}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/datasources/#{datasource}")
      end
    end
  end

  defp create_datasource(_) do
    datasource = datasource_fixture()

    %{datasource: datasource}
  end
end
