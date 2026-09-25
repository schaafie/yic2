defmodule Yic2.ApisFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yic2.Apis` context.
  """

  @doc """
  Generate a api.
  """
  def api_fixture(attrs \\ %{}) do
    {:ok, api} =
      attrs
      |> Enum.into(%{
        definition: %{},
        description: "some description",
        name: "some name",
        request: "some request",
        version: %{}
      })
      |> Yic2.Apis.create_api()

    api
  end
end
