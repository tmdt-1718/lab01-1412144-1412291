Rails.application.routes.draw do
  get 'about', to: 'about#index'
  get 'blogs', to: 'blogs#index'
  resources :blogs do
    resources :comments
  end
  devise_for :users , controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
