Rails.application.routes.draw do

  namespace :admin do
    resources :authors
  end

  root 'welcome#index'
  get '/about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
