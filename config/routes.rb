Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      put 'publish', 'review', 'cancel'
    end
  end

  get "/dashboard", to: "home#special_dashboard"
  root to: "home#welcome"
end
