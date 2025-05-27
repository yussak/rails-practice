Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello', to: 'sample#index'

  get "erb_only", to: "sample#erb_only"
  get "erb_to_react", to: "sample#erb_to_react"

  post "users", to: "sample#create"
end
