Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "vehicles/index"
  get "vehicles/show"
  get "vehicles/new"
  get "vehicles/create"

  # Defines the root path route ("/")
  # root "posts#index"
end
