Rails.application.routes.draw do

  get "users/login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get 'users/index' =>  "users#index"
  post "users/create" => "users#create"
  get "users/welcome" => "users#welcome"
  get "users/list" => "users#list"
  
  get "posts/often" => "posts#often"
  get "posts/later"  => "posts#later"
  get "posts/useful" => "posts#useful"
  get "posts/save" =>  "posts#save"
  get "posts/bedit" => "posts#bedit"
  get "posts/oftenbedit" => "posts#oftenbedit"
  get "posts/laterbedit" => "posts#laterbedit"
  get "posts/usefulbedit" => "posts#usefulbedit"
  get "posts/savebedit" => "posts#savebedit"
  get "posts/index" => "posts#index"
  get "/" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
