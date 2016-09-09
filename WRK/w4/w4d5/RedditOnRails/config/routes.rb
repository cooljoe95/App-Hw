Rails.application.routes.draw do

  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] do
    resources :posts, only: [:new]
  end
  resources :posts, except: [:new, :index]
end
