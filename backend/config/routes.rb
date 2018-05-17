Rails.application.routes.draw do
  resources :shorten, only: [:create]
end
