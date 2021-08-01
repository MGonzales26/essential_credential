Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  resources :clinicians, only: [:index, :show]
  resources :locations, only: [:index, :show]
  resources :documents, only: [:show]
end
