Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  get '/profile', to: 'pages#profile'
  get '/search', to: 'pages#search'
  get '/featured', to: 'pages#featured'
  get '/lifetime', to: 'pages#lifetime'
end
