Rails.application.routes.draw do
  root to: "links#index"

  devise_for :users
  
  # resources :links, except: :show
  resources :links

  
  #Parse the real shortened URL
  get '/s/:ending', to: 'links#redirecting_screen', as: :redirex


end
