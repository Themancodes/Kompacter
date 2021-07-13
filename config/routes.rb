Rails.application.routes.draw do
  devise_for :users
  resources :links

  #Parse the real shortened URL
  get '/s/:ending', to: 'links#show', as: :short
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "links#index"

end
