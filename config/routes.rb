Rails.application.routes.draw do
  root 'events#index'

  get 'events_controller/index'
  get 'static_pages/index'
  get 'static_pages/secret'
  
  resources :events
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




# Envie de t'amuser ? 
#
# Tente avec ce fichier de routes, et tente de te connecter :
#
#
# root 'events#index'
#
# get 'static_pages/secret' 
# resources :events_controller, only: [:index]          #kécécé ?
# resources :static_pages, only: [:index, :secret]
# resources :events
# resources :users, only: [:show]
# devise_for :users