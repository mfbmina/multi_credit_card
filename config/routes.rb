Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :edit] do
    resources :cards, except: [:index, :new, :edit, :update]
  end
end
