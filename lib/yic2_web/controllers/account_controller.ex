defmodule Yic2Web.AccountController do
  use Yic2Web, :controller

  alias Yic2.Iam
  alias Yic2.Iam.Account
  alias Yic2.Guardian
  
  action_fallback Yic2Web.FallbackController

  def index(conn, _params) do
    accounts = Iam.list_accounts()
    render(conn, :index, accounts: accounts)
  end

  def create(conn, account_params) do
    with {:ok, %Account{} = account} <- Iam.create_account(account_params),
         {:ok, token, _full_claims} <- Guardian.encode_and_sign(account) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/accounts/#{account}")
      |> render(:account_token, account: account, token: token)
    end
  end

  def reset_password(conn, account_params) do
    case Iam.get_account_by_login(account_params["login"]) do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> render(:error, error: "Login not found")
      account ->
        case Guardian.validate_password(account_params["current_password"], account.hash_password) do
          true ->
            with {:ok, %Account{} = account} <- Iam.update_account(account, account_params),
                 {:ok, token, _full_claims} <- Guardian.encode_and_sign(account) do
              conn
              |> render(:account_token, account: account, token: token)
            end
          false ->
            conn
            |> put_status(:unauthorized)
            |> render( :error, error: "invalid credentials")
        end
    end
  end  

  def sign_in(conn, %{"login" => login, "password" => hash_password}) do
    case Guardian.authenticate(login, hash_password) do
      {:ok, account, token} ->
        conn
        |> put_status(:ok)
        |> render(:account_token, account: account, token: token)
      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> render( :error, error: "invalid credentials" )
    end
  end

  def show(conn, %{"id" => id}) do
    account = Iam.get_account!(id)
    render(conn, :show, account: account)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Iam.get_account!(id)

    with {:ok, %Account{} = account} <- Iam.update_account(account, account_params) do
      render(conn, :show, account: account)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Iam.get_account!(id)

    with {:ok, %Account{}} <- Iam.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
