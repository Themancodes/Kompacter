Rails.application.routes.draw do
  devise_for :users
  # resources :links, except: :show
  resources :links

  #Parse the real shortened URL
  get '/s/:ending', to: 'links#redirect_to_link', as: :redirex

  root to: "links#index"

end
