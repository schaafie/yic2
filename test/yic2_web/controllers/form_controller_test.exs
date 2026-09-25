defmodule Yic2Web.FormControllerTest do
  use Yic2Web.ConnCase

  import Yic2.FormsFixtures
  alias Yic2.Forms.Form

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
    test "lists all forms", %{conn: conn} do
      conn = get(conn, ~p"/api/forms")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create form" do
    test "renders form when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/forms", form: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/forms/#{id}")

      assert %{
               "id" => ^id,
               "comment" => "some comment",
               "definition" => %{},
               "name" => "some name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/forms", form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update form" do
    setup [:create_form]

    test "renders form when data is valid", %{conn: conn, form: %Form{id: id} = form} do
      conn = put(conn, ~p"/api/forms/#{form}", form: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/forms/#{id}")

      assert %{
               "id" => ^id,
               "comment" => "some updated comment",
               "definition" => %{},
               "name" => "some updated name",
               "version" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, form: form} do
      conn = put(conn, ~p"/api/forms/#{form}", form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete form" do
    setup [:create_form]

    test "deletes chosen form", %{conn: conn, form: form} do
      conn = delete(conn, ~p"/api/forms/#{form}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/forms/#{form}")
      end
    end
  end

  defp create_form(_) do
    form = form_fixture()

    %{form: form}
  end
end
