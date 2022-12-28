Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'

  resources :users, only: %i[new create]
end
