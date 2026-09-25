defmodule Yic2Web.DatasourceJSON do
  alias Yic2.Forms.Datasource

  @doc """
  Renders a list of datasources.
  """
  def index(%{datasources: datasources}) do
    %{data: for(datasource <- datasources, do: data(datasource))}
  end

  @doc """
  Renders a single datasource.
  """
  def show(%{datasource: datasource}) do
    %{data: data(datasource)}
  end

  defp data(%Datasource{} = datasource) do
    %{
      id: datasource.id,
      name: datasource.name,
      comment: datasource.comment,
      version: datasource.version,
      definition: datasource.definition,
      actions: datasource.actions
    }
  end
end
