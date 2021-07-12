Rails.application.routes.draw do
  root to: "links#index"

  devise_for :users
  
  # resources :links, except: :show
  resources :links
  resources :visitors

  
  #Parse the real shortened URL
  get '/s/:ending', to: 'links#redirecting_screen', as: :redirex

  post '/links', to: 'links#add_visitor'

end
