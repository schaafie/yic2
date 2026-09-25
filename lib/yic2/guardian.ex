<<<<<<< HEAD
defmodule Yic2.Guardian do
  use Guardian, otp_app: :yic2

  alias Yic2.Iam

  def subject_for_token(account, _claims) do
    {:ok, to_string(account.id)}
  end

  # def subject_for_token(_, _), do: {:error, :reason_for_error}
  
  def resource_from_claims(%{"sub" => id}) do
    case Iam.get_account!(id) do
      nil -> {:error, :resource_not_found}
      resource -> {:ok, resource}
    end
  end
  
  # def resource_from_claims(_claims), do:  {:error, :reason_for_error}

def authenticate(login, password) do
    case Iam.get_account_by_login(login) do
      nil ->
        {:error, :unauthorized}
      resource ->
        case validate_password(password, resource.hash_password) do
          true -> create_token(resource)
          false -> {:error, :reason_for_error}
        end
    end
  end

  def validate_password(password, hash_password) do
    Bcrypt.verify_pass(password, hash_password)
  end

  defp create_token(account) do
    {:ok, token, _full_claims} = encode_and_sign(account)
    {:ok, account, token}
 end


=======
defmodule Yic2.Guardian do
  use Guardian, otp_app: :yic2

  alias Yic2.Iam

  def subject_for_token(account, _claims) do
    {:ok, to_string(account.id)}
  end

  # def subject_for_token(_, _), do: {:error, :reason_for_error}
  
  def resource_from_claims(%{"sub" => id}) do
    case Iam.get_account!(id) do
      nil -> {:error, :resource_not_found}
      resource -> {:ok, resource}
    end
  end
  
  # def resource_from_claims(_claims), do:  {:error, :reason_for_error}

def authenticate(login, password) do
    case Iam.get_account_by_login(login) do
      nil ->
        {:error, :unauthorized}
      resource ->
        case validate_password(password, resource.hash_password) do
          true -> create_token(resource)
          false -> {:error, :reason_for_error}
        end
    end
  end

  def validate_password(password, hash_password) do
    Bcrypt.verify_pass(password, hash_password)
  end

  defp create_token(account) do
    {:ok, token, _full_claims} = encode_and_sign(account)
    {:ok, account, token}
 end


>>>>>>> 446c4c4fee495dba1aa0edea65ca4f1362603173
end