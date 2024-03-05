Rails.application.routes.draw do
  get 'songs/new'
  get 'songs/create'
  get 'songs/destroy'
  get 'songs/index'
  get 'songs/show'
  resources :users
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
