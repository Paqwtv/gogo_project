Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users
  resources :profiles
  resources :events
  resources :categories
  resources :chat_rooms
  resources :qr_teches
  resources :snoopers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
