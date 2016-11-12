Rails.application.routes.draw do

	mount_devise_token_auth_for 'User', at: 'auth'
  
  	root 'login_pages#index'

	namespace :api do
		resources :source_teams, only: [:index]
		resources :user do
			resources :leagues, except: [:new, :edit] do
				resources :game_teams 
			end
		end
		resources :game_teams
	end

end