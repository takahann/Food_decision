Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes
  root 'recipes#top'
end
