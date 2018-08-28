Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'
  resources :recipes
  # get 'recipes', to: 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
