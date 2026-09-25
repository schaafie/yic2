defmodule Yic2Web.ProtectedResourceController do
  use Yic2Web, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    json(conn, %{message: "This is a protected resource", user_id: user.id})
  end

end