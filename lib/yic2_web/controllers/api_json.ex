defmodule Yic2Web.ApiJSON do
  alias Yic2.Apis.Api

  @doc """
  Renders a list of apis.
  """
  def index(%{apis: apis}) do
    %{data: for(api <- apis, do: data(api))}
  end

  @doc """
  Renders a single api.
  """
  def show(%{api: api}) do
    %{data: data(api)}
  end

  defp data(%Api{} = api) do
    %{
      id: api.id,
      name: api.name,
      description: api.description,
      version: api.version,
      request: api.request,
      definition: api.definition
    }
  end

  def response( %{data: data} ), do: data
end
