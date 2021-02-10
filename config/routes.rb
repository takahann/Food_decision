Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get "ranking" => "recipes#ranking"
  resources :users, only: [:index, :show, :edit, :update, :create, :destroy] do
    get 'post_list/:id', to:'users#post_list', as: 'post_list'
  end
  resources :recipes do
    get :search, on: :collection
    resources :reviews, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
