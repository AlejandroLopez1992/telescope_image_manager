Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/telescopes', to: 'telescopes#index'
  get '/telescopes/new', to: 'telescopes#new'
  post '/telescopes', to: 'telescopes#create'
  get '/telescopes/:id', to: 'telescopes#show'
  get '/images', to: 'images#index'
  get '/images/:id', to: 'images#show'
  get '/telescopes/:telescope_id/images', to: 'telescope_images#index'
end
