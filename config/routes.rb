Rails.application.routes.draw do
  # root 'home#index'
  #resources :desires
  devise_for :users
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
