Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :posts
  get 'format_post', to: 'posts#format_post'
end
