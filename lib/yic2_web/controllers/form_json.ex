defmodule Yic2Web.FormJSON do
  alias Yic2.Forms.Form

  @doc """
  Renders a list of forms.
  """
  def index(%{forms: forms}) do
    %{data: for(form <- forms, do: data(form))}
  end

  @doc """
  Renders a single form.
  """
  def show(%{form: form}) do
    %{data: data(form)}
  end

  defp data(%Form{} = form) do
    %{
      id: form.id,
      name: form.name,
      comment: form.comment,
      version: form.version,
      definition: form.definition
    }
  end
end
