Rails.application.routes.draw do
  root "application#hello"
  get 'users/new'
  get  "/signup",  to: "users#new"
  resources :users
  resources :subjects, param: :name
end
