Rails.application.routes.draw do
  devise_for :users

   namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "sign_out", to: "sessions#destroy"
      end
    end
  end
  resources :tweeets
  root "tweeets#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships
end
