Rails.application.routes.draw do
  get 'user/show'
  put 'user/update'
  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:omniauth_callbacks]

  namespace :api do
    resources :foodbags, only: %i[index show create]
    resources :user, only: %i[show update index]
  end
end
