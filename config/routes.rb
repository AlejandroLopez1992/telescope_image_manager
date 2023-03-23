Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/telescopes', to: 'telescopes#index'
  get '/telescopes/:id', to: 'telescopes#show'
  get '/images', to: 'images#index'
end
