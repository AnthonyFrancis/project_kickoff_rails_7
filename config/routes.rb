Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  # get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "agenda" => "pages#agenda"

  get "home" => "pages#home"
  # get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
