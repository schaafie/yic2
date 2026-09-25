<<<<<<< HEAD
defmodule Yic2Web.ProtectedResourceController do
  use Yic2Web, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    json(conn, %{message: "This is a protected resource", user_id: user.id})
  end

=======
defmodule Yic2Web.ProtectedResourceController do
  use Yic2Web, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    json(conn, %{message: "This is a protected resource", user_id: user.id})
  end

>>>>>>> 446c4c4fee495dba1aa0edea65ca4f1362603173
end