defmodule Yic2Web.FormController do
  use Yic2Web, :controller

  alias Yic2.Forms
  alias Yic2.Forms.Form

  action_fallback Yic2Web.FallbackController

  def index(conn, _params) do
    forms = Forms.list_forms()
    render(conn, :index, forms: forms)
  end

  def create(conn, %{"form" => form_params}) do
    with {:ok, %Form{} = form} <- Forms.create_form(form_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/forms/#{form}")
      |> render(:show, form: form)
    end
  end

  def show(conn, %{"id" => id}) do
    form = Forms.get_form!(id)
    render(conn, :show, form: form)
  end

  def show(conn, %{"name" => name}) do
    form = Forms.get_form_by_name!(name)
    render(conn, :show, form: form)
  end

  def update(conn, %{"id" => id, "form" => form_params}) do
    form = Forms.get_form!(id)

    with {:ok, %Form{} = form} <- Forms.update_form(form, form_params) do
      render(conn, :show, form: form)
    end
  end

  def delete(conn, %{"id" => id}) do
    form = Forms.get_form!(id)

    with {:ok, %Form{}} <- Forms.delete_form(form) do
      send_resp(conn, :no_content, "")
    end
  end
end
