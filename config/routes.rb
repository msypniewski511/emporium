Rails.application.routes.draw do

  namespace :admin do
    resources :publishers
  end
  namespace :admin do
    resources :authors
  end

  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/index', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
