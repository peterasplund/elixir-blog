defmodule Blog.Router do
  use Blog.Web, :router

  defp do_redirect(conn, to) do
    conn
      |> Phoenix.Controller.redirect(to: to)
      |> halt
  end

  defp authenticate(conn, _) do
    unless Blog.Session.logged_in?(conn) do
      do_redirect(conn, "/admin/login")
    end
    conn
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :authenticate
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", Blog do
    pipe_through :admin

    get "/", AdminController, :index
    resources "/posts", PostController
    resources "/categories", CategoryController
  end

  scope "/admin", Blog do
    pipe_through :browser

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login",  SessionController, :new
    post "/login",  SessionController, :create
    get "/logout", SessionController, :delete
  end

  scope "/", Blog do
    pipe_through :browser

    get "/", PageController, :index
    get "/:slug", PageController, :single
  end

end
