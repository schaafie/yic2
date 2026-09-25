defmodule Yic2Web.UserJSON do
  alias Yic2.Iam.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      firstname: user.firstname,
      infix: user.infix,
      lastname: user.lastname,
      email: user.email
    }
  end
end
