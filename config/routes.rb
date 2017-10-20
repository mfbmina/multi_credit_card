Rails.application.routes.draw do
  devise_for :users, only: []

  resources :users, except: [:new, :edit] do
    resources :cards, except: [:index, :new, :edit, :update]
  end
end
