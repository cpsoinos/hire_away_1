Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events
  resources :events, only: [:new] do
    resources :locations, only: [:new, :create, :index]
  end
end
