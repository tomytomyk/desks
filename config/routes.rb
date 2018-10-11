Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "admins/top" => "admins#top"
  get "admins/index" => "admins#index"

  get "/" => "users#top", as:"top"
  post "admins/login" => "admins#login"
  get "admins/other" => "admins#other"

  get "admin/items/genre/:id" => "admin/items#genre_edit", as:"edit_genre"
  post "admin/items/genre" => "admin/items#genre_create", as:"genre"
  delete "admin/items/genre/:id" => "admin/items#genre_destroy", as:"destroy_genre"
  get "admin/items/maker/:id" => "admin/items#maker_edit", as:"edit_maker"
  post "admin/items/maker" => "admin/items#maker_create", as:"maker"
  delete "admin/items/maker/:id" => "admin/items#maker_destroy", as:"destroy_maker"
  get "admin/items/occupation/:id" => "admin/items#occupation_edit", as:"edit_occupation"
  post "admin/items/occupation" => "admin/items#occupation_create", as:"occupation"
  delete "admin/items/occupation/:id" => "admin/items#occupation_destroy", as:"destroy_occupation"
  namespace :admin do
  	resources :items
  	resources :users
  end
  post "report/report_id/report_value" => "reports#value_create", as:"value"
  post "users/login" => "users#login"
  resources :items
  resources :reports
  resources :users do
      get :follow, :follower
  end
  resources :relationships, only: [:create, :destroy]


end
