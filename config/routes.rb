Rails.application.routes.draw do
  resources :tracks, only: :index

  root 'tracks#index'
end
