Rails.application.routes.draw do
  devise_for :users, only: []

  resources :users, except: [:new, :edit]

  resources :cards, except: [:new, :edit, :update]
end
