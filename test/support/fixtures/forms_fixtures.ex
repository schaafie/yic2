defmodule Yic2.FormsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yic2.Forms` context.
  """

  @doc """
  Generate a form.
  """
  def form_fixture(attrs \\ %{}) do
    {:ok, form} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        definition: %{},
        name: "some name",
        version: %{}
      })
      |> Yic2.Forms.create_form()

    form
  end

  @doc """
  Generate a datasource.
  """
  def datasource_fixture(attrs \\ %{}) do
    {:ok, datasource} =
      attrs
      |> Enum.into(%{
        actions: ["option1", "option2"],
        comment: "some comment",
        definition: %{},
        name: "some name",
        version: %{}
      })
      |> Yic2.Forms.create_datasource()

    datasource
  end

  @doc """
  Generate a datadef.
  """
  def datadef_fixture(attrs \\ %{}) do
    {:ok, datadef} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        definition: %{},
        name: "some name",
        version: %{}
      })
      |> Yic2.Forms.create_datadef()

    datadef
  end

  @doc """
  Generate a dataelement.
  """
  def dataelement_fixture(attrs \\ %{}) do
    {:ok, dataelement} =
      attrs
      |> Enum.into(%{
        actions: ["option1", "option2"],
        comment: "some comment",
        definition: %{},
        name: "some name",
        version: %{}
      })
      |> Yic2.Forms.create_dataelement()

    dataelement
  end
end
