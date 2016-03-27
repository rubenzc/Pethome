Rails.application.routes.draw do
  root 'site#index'

  post 'site/search' => 'site#search', as: "search"
  get 'site/map' => 'site#map', as: "map"

  resources :homes
# get '/filter_homes/:city' => 'homes#filter_by_city'

# index  =>    GET /homes
# new    =>    GET /home/new
# create =>   POST /homes/new
# show   =>    GET /homes/:id
# edit   =>    GET /homes/:id/edit
# update =>    PUT /homes/:id
# delete => DELETE /homes/:id
end
