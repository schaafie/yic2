defmodule Yic2Web.Router do
  use Yic2Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Yic2.GuardianPipeline
  end

  scope "/api", Yic2Web do
    pipe_through :api
    post "/sign_in", AccountController, :sign_in
  end

  scope "/api", Yic2Web do
    pipe_through [:api,:auth]
    resources "/users", UserController, except: [:new, :edit]
    resources "/accounts", AccountController, except: [:new, :edit]
    patch "/accounts/reset_password", AccountController, :reset_password

    get "/formbyname/:name", FormController, :show
    get "/datadefbyname/:name", DatadefController, :show

    resources "/schemas", SchemaController, except: [:new, :edit]
    resources "/apis", ApiController, except: [:new, :edit]
    resources "/dataelements", DataelementController, except: [:new, :edit]
    resources "/datadefs", DatadefController, except: [:new, :edit]
    resources "/forms", FormController, except: [:new, :edit]
    resources "/datasources", DatasourceController, except: [:new, :edit]

  end

  # API Handler through api manager
  #
  scope "/api/orchestrator", Yic2Web do
    pipe_through [:api,:auth]
    
    get "/*path", ApiController, :handle
    post "/*path", ApiController, :handle
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:yic2, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
