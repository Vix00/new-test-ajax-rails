Rails.application.routes.draw do
  
  devise_for :users
  #get 'email/index'
  #root "email#index"
  #resources :books, only: [:create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "emails#index"

  resources :emails, only: [:create, :show, :destroy, :update]

  resources :tasks, except: [:show]

end
