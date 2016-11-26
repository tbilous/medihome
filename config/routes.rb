Rails.application.routes.draw do

  match '/users', to: 'users#new', via: 'get'

  devise_for :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
