Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:create, :new, :show, :index]
  resource :session, only: [:create, :new, :destroy]
  # resources :bands
  # resources :albums, except: [:index, :new]
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:index, :new]
end
