task :autopick_test => :environment do

	# for every team without a user pick a squad for the next match


	# for each team in GameTeam, check to see if the active game has been been picked for that team
	all_game_teams = GameTeam.all
	# find the active round
	all_game_teams.each do |game_team|
		# puts game_team.league.rounds.find_by(active: true).matches.to_s
		# find the game_team's match
		# check to see if the team has been picked yet
		if game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])
			match_id = game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])[:id]
			picked = game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])[:home_team_picked]
		elsif game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])
			match_id = game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])[:id]
			picked = game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])[:away_team_picked]
		end
		# check to see if autopick is needed
		if game_team[:user_id]
			autopick = false
		else
			autopick = true
		end
		if !picked && autopick
	# if it hasn't been picked yet then pick the team and update the team as picked
			puts 'run autopicker'
			autopicker game_team
		else 
	# do nothing otherwise
			puts 'do nothing'
		end
	end

end

def autopicker team
	puts 'autopicker launched'
	# find the 1 GK with the highest gk attributes
	# find the 4 Defenders with the highest d attributes
	# find the 2 attackers with the highest a attributes
	# find the 2 midfielders with the highest d attributes
	# find the 2 midfielders with the highest a attributes
end