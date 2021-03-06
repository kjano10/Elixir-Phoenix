defmodule PokerPotionWeb.Router do
  use PokerPotionWeb, :router

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

  scope "/", PokerPotionWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PokerPotionWeb do
  #   pipe_through :api
  # end

end
