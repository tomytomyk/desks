Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "admins/top" => "admins#top"
  get "admins/index" => "admins#index"

  get "/" => "users#top", as:"top"
  post "admins/login" => "admins#login"
  get "admins/other" => "admins#other"

  # get "admin/items/genre/:id" => "admin/items#genre_edit", as:"edit_genre"
  # post "admin/items/genre" => "admin/items#genre_create", as:"genre"
  # delete "admin/items/genre/:id" => "admin/items#genre_destroy", as:"destroy_genre"
  # get "admin/items/maker/:id" => "admin/items#maker_edit", as:"edit_maker"
  # post "admin/items/maker" => "admin/items#maker_create", as:"maker"
  # delete "admin/items/maker/:id" => "admin/items#maker_destroy", as:"destroy_maker"

  get "admins/language/:id" => "admins#language_edit", as:"edit_language"
  patch "admins/language/:id" => "admins#language_update", as:"update_language"
  post "admins/language" => "admins#language_create", as:"language"
  delete "admins/language/:id" => "admins#language_destroy", as:"destroy_language"
  get "admins/occupation/:id" => "admins#occupation_edit", as:"edit_occupation"
  patch "admins/occupation/:id" => "admins#occupation_update", as:"update_occupation"
  post "admins/occupation" => "admins#occupation_create", as:"occupation"
  delete "admins/occupation/:id" => "admins#occupation_destroy", as:"destroy_occupation"
  namespace :admin do
  	resources :items
  	resources :users, only: [:index]
  end
  post "report/report_id/report_value" => "reports#value_create", as:"value"
  post "users/login" => "users#login"
  resources :items
  resources :reports
  get "reports/:id/sub_report" => "reports#new_sub_report", as:"new_sub_report"
  post "reports/:id/sub_report" => "reports#create_sub_report", as:"sub_report"
  delete "reports/:report_id/sub_reports/:sub_report_id" => "reports#destroy_sub_report", as:"destroy_sub_report"
  resources :users do
      get :followed, :follow_destroy
  end
  resources :relationships, only: [:create, :destroy]
  resources :language, only: [:show]

  get "admin/items/:id/show_image" => "admin/items#show_image", as:"show_image"
  get "user/:id/show_image" => "users#show_image", as:"show_user_image"
  post "admin/users/:id" => "admin/users#change_user", as:"user_change"


end
