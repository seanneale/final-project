Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  
  root 'static_pages#index'

end