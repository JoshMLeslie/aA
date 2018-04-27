# == Route Map
#
#        Prefix Verb   URI Pattern                 Controller#Action
#         users GET    /users(.:format)            users#index
#               POST   /users(.:format)            users#create
#      new_user GET    /users/new(.:format)        users#new
#     edit_user GET    /users/:id/edit(.:format)   users#edit
#          user GET    /users/:id(.:format)        users#show
#               PATCH  /users/:id(.:format)        users#update
#               PUT    /users/:id(.:format)        users#update
#               DELETE /users/:id(.:format)        users#destroy
# session_index GET    /session(.:format)          session#index
#               POST   /session(.:format)          session#create
#   new_session GET    /session/new(.:format)      session#new
#  edit_session GET    /session/:id/edit(.:format) session#edit
#       session GET    /session/:id(.:format)      session#show
#               PATCH  /session/:id(.:format)      session#update
#               PUT    /session/:id(.:format)      session#update
#               DELETE /session/:id(.:format)      session#destroy
#         bands GET    /bands(.:format)            bands#index
#               POST   /bands(.:format)            bands#create
#      new_band GET    /bands/new(.:format)        bands#new
#     edit_band GET    /bands/:id/edit(.:format)   bands#edit
#          band GET    /bands/:id(.:format)        bands#show
#               PATCH  /bands/:id(.:format)        bands#update
#               PUT    /bands/:id(.:format)        bands#update
#               DELETE /bands/:id(.:format)        bands#destroy
#        albums GET    /albums(.:format)           albums#index
#               POST   /albums(.:format)           albums#create
#     new_album GET    /albums/new(.:format)       albums#new
#    edit_album GET    /albums/:id/edit(.:format)  albums#edit
#         album GET    /albums/:id(.:format)       albums#show
#               PATCH  /albums/:id(.:format)       albums#update
#               PUT    /albums/:id(.:format)       albums#update
#               DELETE /albums/:id(.:format)       albums#destroy
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :session
  resources :bands
  resources :albums
end
