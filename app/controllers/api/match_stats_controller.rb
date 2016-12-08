class Api::MatchStatsController < ApplicationController

	def create
		puts params.to_s
		params.each do |key,value|
			game_team_id = params[:game_team_id]
			if key < "99"
				puts value
				puts GamePlayer.find(value.to_i).source_player[:name]
				if GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team_id)
					@match_id = GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team_id)[:id]
					Match.find(@match_id).update(home_team_picked: true)
				else 
					@match_id = GamePlayer.find(value.to_i).game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team_id)[:id]
					Match.find(@match_id).update(away_team_picked: true)
				end
				GamePlayer.find(value.to_i).match_stats.create(match_id: @match_id)
			end
		end
		# MatchWorker.perform_async()
		Match.find(@match_id).round.matches.each do |match|
			MatchWorker.perform_async(match[:id])
			sleep(2)
		end
	end

end
