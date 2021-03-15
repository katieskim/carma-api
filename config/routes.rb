Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/signin', to: 'auth#sign_in'
  post 'auth/signup', to: 'auth#sign_up'
  resources :terms
  resources :profiles
end
