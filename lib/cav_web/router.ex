defmodule CavWeb.Router do
  use CavWeb, :router

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

  scope "/", CavWeb do
    pipe_through :api

    get "/", PageController, :index
    resources("/cav", CavController) do
      resources "/visit", VisitController
      resources "/inspection", InspectionController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", CavWeb do
  #   pipe_through :api
  # end
end
