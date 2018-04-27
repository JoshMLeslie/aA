# == Route Map
#
#           Prefix Verb   URI Pattern                            Controller#Action
#      new_session GET    /session/new(.:format)                 sessions#new
#          session DELETE /session(.:format)                     sessions#destroy
#                  POST   /session(.:format)                     sessions#create
#            users GET    /users(.:format)                       users#index
#                  POST   /users(.:format)                       users#create
#         new_user GET    /users/new(.:format)                   users#new
#             user GET    /users/:id(.:format)                   users#show
#                  DELETE /users/:id(.:format)                   users#destroy
#             subs GET    /subs(.:format)                        subs#index
#                  POST   /subs(.:format)                        subs#create
#          new_sub GET    /subs/new(.:format)                    subs#new
#         edit_sub GET    /subs/:id/edit(.:format)               subs#edit
#              sub GET    /subs/:id(.:format)                    subs#show
#                  PATCH  /subs/:id(.:format)                    subs#update
#                  PUT    /subs/:id(.:format)                    subs#update
#                  DELETE /subs/:id(.:format)                    subs#destroy
#         comments POST   /comments(.:format)                    comments#create
#         comment DELETE /comments/:id(.:format)                comments#destroy
# new_post_comment GET    /posts/:post_id/comments/new(.:format) comments#new
#            posts GET    /posts(.:format)                       posts#index
#                  POST   /posts(.:format)                       posts#create
#         new_post GET    /posts/new(.:format)                   posts#new
#        edit_post GET    /posts/:id/edit(.:format)              posts#edit
#             post GET    /posts/:id(.:format)                   posts#show
#                  PATCH  /posts/:id(.:format)                   posts#update
#                  PUT    /posts/:id(.:format)                   posts#update
#                  DELETE /posts/:id(.:format)                   posts#destroy
#                  GET    /posts(.:format)                       posts#index
#                  GET    /posts/new(.:format)                   posts#new
#                  GET    /posts/:id/edit(.:format)              posts#edit
#                  GET    /posts/:id(.:format)                   posts#show
#                  PATCH  /posts/:id(.:format)                   posts#update
#                  PUT    /posts/:id(.:format)                   posts#update
#                  DELETE /posts/:id(.:format)                   posts#destroy
#        sub_posts POST   /subs/:sub_id/posts(.:format)          posts#create
#                  GET    /subs(.:format)                        subs#index
#                  POST   /subs(.:format)                        subs#create
#                  GET    /subs/new(.:format)                    subs#new
#                  GET    /subs/:id/edit(.:format)               subs#edit
#                  GET    /subs/:id(.:format)                    subs#show
#                  PATCH  /subs/:id(.:format)                    subs#update
#                  PUT    /subs/:id(.:format)                    subs#update
#                  DELETE /subs/:id(.:format)                    subs#destroy
#

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, except: [:edit, :update]
  resources :subs

  resources :comments, only: [:create, :destroy, :show]
  resources :posts do
    resources :comments, only: [:new]
  end

  resources :posts, except: [:create]
  resources :subs do
    resources :posts, only: [:create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
