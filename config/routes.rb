Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root to: "home#welcome"

  get "/dashboard",          to: "home#special_dashboard"
  put "/posts/:id/publish",  to: "posts#publish"
  put "/posts/:id/review",   to: "posts#review"
  put "/posts/:id/cancel",   to: "posts#cancel"
end
