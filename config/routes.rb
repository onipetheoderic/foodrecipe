Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes #to generate the crud routes for our recipes app
  root "recipes#index" #to creATE the index file
end
