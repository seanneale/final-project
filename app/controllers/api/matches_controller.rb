class Api::MatchesController < ApplicationController

	def show
		MatchWorker.perform_async()
		response = {}
		home_team = {}
		away_team = {}
		response[:players] = []
		
		response[:match] = Match.find(params[:id])
		response[:match_events] = Match.find(params[:id]).match_events.order('id')
		response[:league_id] = Match.find(params[:id]).round.league[:id]
		user_id = Match.find(params[:id]).round.league.users[0][:id]
		response[:game_team_id] = Match.find(params[:id]).round.league.game_teams.find_by(user_id: user_id)[:id]
		
		home_team_id = Match.find(params[:id]).home_team_id
		home_team[:name] = GameTeam.find(home_team_id).source_team[:name]
		home_team[:home_colour_1] = GameTeam.find(home_team_id).source_team[:home_colour_1]
		home_team[:home_colour_2] = GameTeam.find(home_team_id).source_team[:home_colour_2]
		home_team[:away_colour_1] = GameTeam.find(home_team_id).source_team[:away_colour_1]
		home_team[:away_colour_2] = GameTeam.find(home_team_id).source_team[:away_colour_2]
		home_team[:badge_url] = GameTeam.find(home_team_id).source_team[:badge_url]
				
		away_team_id = Match.find(params[:id]).away_team_id
		away_team[:name] = GameTeam.find(away_team_id).source_team[:name]
		away_team[:home_colour_1] = GameTeam.find(away_team_id).source_team[:home_colour_1]
		away_team[:home_colour_2] = GameTeam.find(away_team_id).source_team[:home_colour_2]
		away_team[:away_colour_1] = GameTeam.find(away_team_id).source_team[:away_colour_1]
		away_team[:away_colour_2] = GameTeam.find(away_team_id).source_team[:away_colour_2]
		away_team[:badge_url] = GameTeam.find(away_team_id).source_team[:badge_url]

		players = Match.find(params[:id]).match_stats
		players.each do |player|
			new_player = {}
			new_player[:name] = player.game_players[0].source_player[:name]
			new_player[:position] = player.game_players[0].source_player[:position]
			new_player[:squad_number] = player.game_players[0].source_player[:squad_number]
			new_player[:team_id] = player.game_players[0].game_team[:id]
			response[:players].push new_player
		end

		response[:home_team] = home_team
		response[:away_team] = away_team
		render json: response
	end

end




# response[:home_team]