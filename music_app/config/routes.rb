Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :bands, only: [:new ,:create ,:update ,:edit ,:destroy ,:index ,:show] do
    resources :albums, only: [:index] do
      resources :tracks, only: [:index]
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :albums, only: [:new ,:create ,:update ,:edit ,:destroy ,:show, :index]
  resources :tracks, only: [:new ,:create ,:update ,:edit ,:destroy ,:show, :index]

end
