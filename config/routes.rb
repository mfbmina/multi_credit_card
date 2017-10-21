Rails.application.routes.draw do
  devise_for :users, only: []

  resources :users, except: [:new, :edit]

  resources :cards, except: [:new, :edit, :update] do
    resource :pay, only: :create
  end
end
