class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
	has_many :user_leagues
	has_many :leagues, through: :user_leagues
	has_many :game_teams
end
