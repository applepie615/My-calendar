Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :destroy, :update,] 

  resources :tweets do
    resources :comments, only: [:create, :edit, :update, :destroy, ]
  end

  root 'tweets#index'

  get 'tweets/new/:category' => 'tweets#new'

  get 'tweets/week' => 'tweets#week'
end
