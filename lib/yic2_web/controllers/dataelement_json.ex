defmodule Yic2Web.DataelementJSON do
  alias Yic2.Forms.Dataelement

  @doc """
  Renders a list of dataelements.
  """
  def index(%{dataelements: dataelements}) do
    %{data: for(dataelement <- dataelements, do: data(dataelement))}
  end

  @doc """
  Renders a single dataelement.
  """
  def show(%{dataelement: dataelement}) do
    %{data: data(dataelement)}
  end

  defp data(%Dataelement{} = dataelement) do
    %{
      id: dataelement.id,
      name: dataelement.name,
      comment: dataelement.comment,
      version: dataelement.version,
      definition: dataelement.definition,
      actions: dataelement.actions
    }
  end
end
