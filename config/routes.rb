Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users
  resources :books
  # resources :profile_comments, only: [:create, :destroy]
  # resources :post_images, only: [:new, :create, :index, :show, :destroy]
# end
end
