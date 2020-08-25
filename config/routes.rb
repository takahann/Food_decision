Rails.application.routes.draw do
  devise_for :users
  root 'recipes#top'
  get 'recipes/about' => 'recipes#about'
  resources :users, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :recipes do
    get :search, on: :collection
    resources :reviews, only: [:create, :destroy]
  end
end
