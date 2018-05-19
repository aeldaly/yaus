Rails.application.routes.draw do
  resources :shorten, only: [:create]
  resources :links, only: [:index, :show]
  resource :redirect, only: [:create]
end
