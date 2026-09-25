defmodule Yic2Web.DatadefController do
  use Yic2Web, :controller

  alias Yic2.Forms
  alias Yic2.Forms.Datadef

  action_fallback Yic2Web.FallbackController

  def index(conn, _params) do
    datadefs = Forms.list_datadefs()
    render(conn, :index, datadefs: datadefs)
  end

  def create(conn, %{"datadef" => datadef_params}) do
    with {:ok, %Datadef{} = datadef} <- Forms.create_datadef(datadef_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/datadefs/#{datadef}")
      |> render(:show, datadef: datadef)
    end
  end

  def show(conn, %{"id" => id}) do
    datadef = Forms.get_datadef!(id)
    render(conn, :show, datadef: datadef)
  end

  def show(conn, %{"name" => name}) do
    datadef = Forms.get_datadef_by_name!(name)
    render(conn, :show, datadef: datadef)
  end  

  def update(conn, %{"id" => id, "datadef" => datadef_params}) do
    datadef = Forms.get_datadef!(id)

    with {:ok, %Datadef{} = datadef} <- Forms.update_datadef(datadef, datadef_params) do
      render(conn, :show, datadef: datadef)
    end
  end

  def delete(conn, %{"id" => id}) do
    datadef = Forms.get_datadef!(id)

    with {:ok, %Datadef{}} <- Forms.delete_datadef(datadef) do
      send_resp(conn, :no_content, "")
    end
  end
end
