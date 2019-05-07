Rails.application.routes.draw do
  get 'users/show'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'event/show'
  get 'event/new'
  get 'event/edit'
  get 'event/update'
  get 'event/destroy'
  get 'events/index'
  get 'events_controller/index'
  resources :events
  root 'events#index'
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
