Rails.application.routes.draw do
  devise_for :users
  resources :links, except: :show

  #Parse the real shortened URL
  Rails.application.routes.draw do
    get '/s/:ending', to: 'links#show', as: :short
  end

  root to: "links#index"

end
