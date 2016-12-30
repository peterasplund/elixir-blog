defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blog do
    pipe_through :browser

    get "/", PageController, :index
    get "single", PageController, :single
  end

  scope "/admin", Blog do
    pipe_through :browser

    # resources "/admin", AdminController
    resources "/posts", PostController
    resources "/categories", CategoryController
  end

  
end
