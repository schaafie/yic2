defmodule Yic2Web.ApiController do
  use Yic2Web, :controller

  require Logger
  alias Yic2.Apis
  alias Yic2.Apis.Api
  alias Yic2.Apis.System

  action_fallback Yic2Web.FallbackController

  def index(conn, _params) do
    apis = Apis.list_apis()
    render(conn, :index, apis: apis)
  end

  def create(conn, %{"api" => api_params}) do
    with {:ok, %Api{} = api} <- Apis.create_api(api_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/apis/#{api}")
      |> render(:show, api: api)
    end
  end

  def show(conn, %{"id" => id}) do
    api = Apis.get_api!(id)
    render(conn, :show, api: api)
  end

  def update(conn, %{"id" => id, "api" => api_params}) do
    api = Apis.get_api!(id)

    with {:ok, %Api{} = api} <- Apis.update_api(api, api_params) do
      render(conn, :show, api: api)
    end
  end

  def delete(conn, %{"id" => id}) do
    api = Apis.get_api!(id)

    with {:ok, %Api{}} <- Apis.delete_api(api) do
      send_resp(conn, :no_content, "")
    end
  end

  def handle(conn, %{"path" => path}) do
    case Apis.match_call( path ) do
      {:ok, definition} ->
        data = handler(definition)
        render(conn, :response, data: data )
      :nok ->
        IO.inspect path
        case Apis.match_call_id( path ) do
          {:ok, definition, value} ->
            data = handler(definition, value)
            render(conn, :response, data: data )
          :nok ->
            render( conn, :response, data: %{ message: "No matching API to call" } )
        end
    end
  end

  defp handler(def_map) do
    tasks = Enum.map( def_map["actions"], fn(task) ->
      url = task["url"]
      method = task["method"]
      token = task["token"]
      output = task["output"]
      Task.async( System, :call, [method, url, token, output ] )
    end )
    results = Task.await_many(tasks)
    define_respons results, def_map["output"]
  end

  # defp handler(def, value) do
  #  {:ok, def_map} = Poison.decode(def)
  defp handler(def_map, value) do
    tasks = Enum.map( def_map["actions"], fn(task) ->
      case task["output"] do
        "data" when value == "0"->
          Task.async( System, :call, ["data", 0] )
        _output -> 
          url = String.replace( task["url"], ":id", value )
          method = task["method"]
          token = task["token"]
          output = task["output"]
          Task.async( System, :call, [method, url, token, output ] )
      end
    end )
    results = Task.await_many(tasks)
    define_respons results, def_map["output"]
  end


  def define_respons( [], output ) do
    Logger.debug(output)
    output
  end

  def define_respons [item|list], output do
    case item do
      {:ok, %{key: "data", value: data }} ->
        respons = case data["data"] do
          nil ->
            Map.replace( output, "data", %{} )
          _ ->
            Map.replace( output, "data", data["data"] )
          end
        define_respons list, respons
      {:ok, %{key: key, value: data }} ->
        respons = Map.replace( output, key, data["data"] )
        define_respons list, respons
      {:error, %{msg: msg, key: key}} ->
        error = "Error found on key #{key} with error message #{msg}"
        %{error: error}
    end
  end
end
