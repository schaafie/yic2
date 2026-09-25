defmodule Yic2Web.DataelementController do
  use Yic2Web, :controller

  alias Yic2.Forms
  alias Yic2.Forms.Dataelement

  action_fallback Yic2Web.FallbackController

  def index(conn, _params) do
    dataelements = Forms.list_dataelements()
    render(conn, :index, dataelements: dataelements)
  end

  def create(conn, %{"dataelement" => dataelement_params}) do
    with {:ok, %Dataelement{} = dataelement} <- Forms.create_dataelement(dataelement_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/dataelements/#{dataelement}")
      |> render(:show, dataelement: dataelement)
    end
  end

  def show(conn, %{"id" => id}) do
    dataelement = Forms.get_dataelement!(id)
    render(conn, :show, dataelement: dataelement)
  end

  def update(conn, %{"id" => id, "dataelement" => dataelement_params}) do
    dataelement = Forms.get_dataelement!(id)

    with {:ok, %Dataelement{} = dataelement} <- Forms.update_dataelement(dataelement, dataelement_params) do
      render(conn, :show, dataelement: dataelement)
    end
  end

  def delete(conn, %{"id" => id}) do
    dataelement = Forms.get_dataelement!(id)

    with {:ok, %Dataelement{}} <- Forms.delete_dataelement(dataelement) do
      send_resp(conn, :no_content, "")
    end
  end
end
