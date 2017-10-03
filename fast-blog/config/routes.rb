Rails.application.routes.draw do
  root :to => "home#index"
  get 'about', to: 'about#index'
  get 'blogs', to: 'blogs#index'
  resources :albums do
    resources :photos
  end
  resources :blogs do
    resources :comments
  end
  devise_for :users , controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
