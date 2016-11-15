class Api::MatchStatsController < ApplicationController

	def create
		puts params
		params.each do |key,value|
			game_team_id = params[:game_team_id]
			if key < "99"
				if GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: 8)
					match_id = GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team_id)[:id]
					Match.find(match_id).update(home_team_picked: true)
				else 
					match_id = GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team_id)[:id]
					Match.find(match_id).update(away_team_picked: true)
				end
				GamePlayer.find(value.to_i).match_stats.create(match_id: match_id)
			end
		end
		# # find the game team
		# game_team_id = GamePlayer.find(params[:game_player_id]).game_team[:id]
		# puts game_team_id
		# # //find the active game week
		# # //find the match_id that involves the team in the active game week
		# if GamePlayer.find(params[:game_player_id]).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: 8)
		# 	match_id = GamePlayer.find(params[:game_player_id]).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team_id)[:id]
		# 	Match.find(match_id).update(home_team_picked: true)
		# else 
		# 	match_id = GamePlayer.find(params[:game_player_id]).game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team_id)[:id]
		# 	Match.find(match_id).update(away_team_picked: true)
		# end
		# puts match_id
		# # //use this info to create the new match stats entry
		# picked = GamePlayer.find(params[:game_player_id]).match_stats.create(match_id: match_id)
		TestWorker.perform_async()
		MatchWorker.perform_async()
		# render json: picked
		render json: 'Complete'
	end

end
