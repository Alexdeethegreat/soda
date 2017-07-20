Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "sessions#new"

<<<<<<< HEAD
  resources :users, only: [:create, :show]
  resources :songs, only: [:create, :index, :new, :edit, :update, :add]
=======
  resources :users, only: [:create, :show, :edit, :update]
  resources :songs, only: [:create, :index, :new, :edit, :update]
>>>>>>> 85f89877401c9cd9a807f6dd08e2c54b2dffdc20
  resources :artists

  get "songs/favsong", to: "songs#add", as: :favsong

  get "songs/search", to: "songs#search", as: :search

  post "songs/:queryterm", to: "songs#query", as: :query

  get "/signup", to: "users#new", as: :signup

  get "/profile", to: "users#profile", as: :profile

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create", as: :new_session
  delete "/logout", to: "sessions#destroy", as: :logout
end
