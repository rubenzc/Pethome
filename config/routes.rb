Rails.application.routes.draw do
  root 'site#index'

  post 'site/search' => 'site#search', as: "search"
  get 'site/map' => 'site#map', as: "map"

  resources :homes
  
end
