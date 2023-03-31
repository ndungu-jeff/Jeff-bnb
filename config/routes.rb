Rails.application.routes.draw do
  # line 4 below is a join table that shall ride on 
  # a user booking a house, thus addng the house_id, the owner_id, and the client_id as an entry of a booked house
  resources :client_houses, only: [:create, :show, :update]
  resources :houses, only: [:create, :index, :show, :update]
  resources :clients, only: [:create, :show, :update]
  resources :owners, only: [:create, :show, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/owner-houses/:owner_id", to: "houses#owner_houses"

    # get all houses for a client, based on their id
    get "/client_houses/houses/:client_id", to: "client_houses#houses_booked"
    # get all clients for an indivudual owner, based on the owners id
    get "/client_houses/clients/:owner_id", to: "client_houses#clients_booked"

  # These routes shall work to authenticate both owners and clients, and subsequently help log them out
  post "/login", to: "sessions#create"
  # log out session
  delete "/logout", to: "sessions#destroy"
  # get logged in owner
  get "/o-me", to: "owners#show_me"
  # get logged in client
  get "/c-me", to: "clients#show_me"
end
