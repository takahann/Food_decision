Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes do
  	get :search, on: :collection
  	resources :reviews, only: [:new, :create, :destroy]
  end
  root 'recipes#top'
end
