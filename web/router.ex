defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

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

  # API
  scope "/api", PhoenixApi do
    pipe_through :api

    resources "/posts", PostController, only: [:index,:show,:create]
  end

  # Web
  scope "/", PhoenixApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
