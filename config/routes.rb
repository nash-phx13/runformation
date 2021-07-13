Rails.application.routes.draw do
get 'search/search'
devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'homes#top'
get '/home/about' => 'homes#about'
resources :runs, only: [:index, :show, :edit, :create, :destroy, :update]
resources :users, only: [:index, :show, :edit, :update]
get '/search', to: 'search#search'
end