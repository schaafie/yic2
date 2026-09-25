defmodule Yic2Web.DataelementControllerTest do
  use Yic2Web.ConnCase

  import Yic2.FormsFixtures
  alias Yic2.Forms.Dataelement

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
    test "lists all dataelements", %{conn: conn} do
      conn = get(conn, ~p"/api/dataelements")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dataelement" do
    test "renders dataelement when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/dataelements", dataelement: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/dataelements/#{id}")

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
      conn = post(conn, ~p"/api/dataelements", dataelement: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dataelement" do
    setup [:create_dataelement]

    test "renders dataelement when data is valid", %{conn: conn, dataelement: %Dataelement{id: id} = dataelement} do
      conn = put(conn, ~p"/api/dataelements/#{dataelement}", dataelement: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/dataelements/#{id}")

      assert %{
               "id" => ^id,
               "actions" => ["option1"],
               "comment" => "some updated comment",
               "definition" => %{},
               "name" => "some updated name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dataelement: dataelement} do
      conn = put(conn, ~p"/api/dataelements/#{dataelement}", dataelement: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dataelement" do
    setup [:create_dataelement]

    test "deletes chosen dataelement", %{conn: conn, dataelement: dataelement} do
      conn = delete(conn, ~p"/api/dataelements/#{dataelement}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/dataelements/#{dataelement}")
      end
    end
  end

  defp create_dataelement(_) do
    dataelement = dataelement_fixture()

    %{dataelement: dataelement}
  end
end
