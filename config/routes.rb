Rails.application.routes.draw do
  resources :entries, only: [:index, :create]
end
