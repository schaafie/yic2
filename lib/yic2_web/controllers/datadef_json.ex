defmodule Yic2Web.DatadefJSON do
  alias Yic2.Forms.Datadef

  @doc """
  Renders a list of datadefs.
  """
  def index(%{datadefs: datadefs}) do
    %{data: for(datadef <- datadefs, do: data(datadef))}
  end

  @doc """
  Renders a single datadef.
  """
  def show(%{datadef: datadef}) do
    %{data: data(datadef)}
  end

  defp data(%Datadef{} = datadef) do
    %{
      id: datadef.id,
      name: datadef.name,
      comment: datadef.comment,
      version: datadef.version,
      definition: datadef.definition
    }
  end
end
