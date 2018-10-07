Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "admins/top" => "admins#top"
  get "admins/index" => "admins#index"

  root to: 'admins#top'
  post "admins/login" => "admins#login"
  get "admins/other" => "admins#other"

  post "admin/items/genre" => "admin/items#genre_create", as:"genre"
  post "admin/items/maker" => "admin/items#maker_create", as:"maker"
  post "admin/items/occupation" => "admin/items#occupation_create", as:"occupation"
  namespace :admin do
  	resources :items
  	resources :users
  end
  resources :items
  resources :reports
  resources :users


end
