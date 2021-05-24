Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  get 'homes/about'
  resources :users, only: [:new, :show, :edit, :index, :update]
  resources :books, only: [:new, :edit, :create, :index, :show, :destroy, :update] do
  resources :profile_comments, only: [:create, :destroy]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
 end
end
