Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/telescopes', to: 'telescopes#index'
  get '/telescopes/new', to: 'telescopes#new'
  post '/telescopes', to: 'telescopes#create'
  get '/telescopes/:id', to: 'telescopes#show'
  get '/telescopes/:id/edit', to: 'telescopes#edit'
  patch '/telescopes/:id', to: 'telescopes#update'
  get '/images', to: 'images#index'
  get '/images/:id', to: 'images#show'
  get '/telescopes/:telescope_id/images', to: 'telescope_images#index'
  get '/telescopes/:telescope_id/images/new', to: 'telescope_images#new'
  post '/telescopes/:telescope_id/images', to: 'telescope_images#create'
  get '/telescopes/:telescope_id/images/:image_id/edit', to: 'images#edit'
  get '/images/:image_id/edit', to: 'images#edit'
  patch '/images/:image_id', to: 'images#update'
  delete '/telescopes/:telescope_id', to: 'telescopes#destroy'
  delete '/images/:image_id', to: 'images#destroy'
end
