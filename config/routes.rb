Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :cars,only: [:index, :show] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :reviews, only: [:index, :create]
end
end