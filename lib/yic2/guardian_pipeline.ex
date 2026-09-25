<<<<<<< HEAD
defmodule Yic2.GuardianPipeline do
  use Guardian.Plug.Pipeline, otp_app: :yic2, module: Yic2.Guardian, error_handler: Yic2.GuardianErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
=======
defmodule Yic2.GuardianPipeline do
  use Guardian.Plug.Pipeline, otp_app: :yic2, module: Yic2.Guardian, error_handler: Yic2.GuardianErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
>>>>>>> 446c4c4fee495dba1aa0edea65ca4f1362603173
end