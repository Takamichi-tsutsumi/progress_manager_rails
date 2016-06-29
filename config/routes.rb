Rails.application.routes.draw do

  resource :sign_up, only: [:create], controller: "users/registrations"
  resource :log_in, only: [:create, :destroy], controller: "users/sessions"

  root 'resources#index'
  resources :resources
  resources :progresses
end
