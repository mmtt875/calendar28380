Rails.application.routes.draw do
  resources :calendars
  root 'calendars#index'
  get 'calendars/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
