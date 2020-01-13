Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  resources :hardwares
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hardwares#index'
end
