defmodule Yic2Web.AccountJSON do
  alias Yic2.Iam.Account

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account}) do
    %{data: data(account)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      login: account.login,
      hash_password: account.hash_password
    }
  end

  def account_token(%{account: account, token: token}) do
    %{
      id: account.id,
      login: account.login,
      token: token
    }
  end

  def error(%{error: error}), do: %{ error: error }

end
