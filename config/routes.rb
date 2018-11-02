Rails.application.routes.draw do
  resources :events
  resources :petitions
  root to: "events#show", id: 1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
