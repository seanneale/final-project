# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'json'
require 'open-uri'

dataSource = "http://jokecamp.github.io/epl-fantasy-geek/js/static-data.json"

source = JSON.load(open(dataSource))

test = User.create(email: 'test@test.com', password: '12345678', name: 'Sean')
test.leagues.create(league_name: 'test_league')

SourceTeam.create(fpl_id: source["teams"][0]["code"], name: source["teams"][0]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][0]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "gold", away_colour_2: "black")
SourceTeam.create(fpl_id: source["teams"][1]["code"], name: source["teams"][1]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][1]["code"]}.svg", home_colour_1: "red", home_colour_2: "black", away_colour_1: "steelblue", away_colour_2: "white")
SourceTeam.create(fpl_id: source["teams"][2]["code"], name: source["teams"][2]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][2]["code"]}.svg", home_colour_1: "darkred", home_colour_2: "lightskyblue", away_colour_1: "lightskyblue", away_colour_2: "maroon")
SourceTeam.create(fpl_id: source["teams"][3]["code"], name: source["teams"][3]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][3]["code"]}.svg", home_colour_1: "blue", home_colour_2: "white", away_colour_1: "black", away_colour_2: "dimgray")
SourceTeam.create(fpl_id: source["teams"][4]["code"], name: source["teams"][4]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][4]["code"]}.svg", home_colour_1: "blue", home_colour_2: "red", away_colour_1: "gold", away_colour_2: "red")
SourceTeam.create(fpl_id: source["teams"][5]["code"], name: source["teams"][5]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][5]["code"]}.svg", home_colour_1: "royalblue", home_colour_2: "white", away_colour_1: "black", away_colour_2: "indianred")
SourceTeam.create(fpl_id: source["teams"][6]["code"], name: source["teams"][6]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][6]["code"]}.svg", home_colour_1: "goldenrod", home_colour_2: "black", away_colour_1: "black", away_colour_2: "goldenrod")
SourceTeam.create(fpl_id: source["teams"][7]["code"], name: source["teams"][7]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][7]["code"]}.svg", home_colour_1: "mediumblue", home_colour_2: "goldenrod", away_colour_1: "red", away_colour_2: "white")
SourceTeam.create(fpl_id: source["teams"][8]["code"], name: source["teams"][8]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][8]["code"]}.svg", home_colour_1: "crimson", home_colour_2: "darkorange", away_colour_1: "black", away_colour_2: "indianred")
SourceTeam.create(fpl_id: source["teams"][9]["code"], name: source["teams"][9]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][9]["code"]}.svg", home_colour_1: "cornfolwerblue", home_colour_2: "slategray", away_colour_1: "black", away_colour_2: "maroon")
SourceTeam.create(fpl_id: source["teams"][10]["code"], name: source["teams"][10]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][10]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "mediumblue", away_colour_2: "midnightblue")
SourceTeam.create(fpl_id: source["teams"][11]["code"], name: source["teams"][11]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][11]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "black", away_colour_2: "skyblue")
SourceTeam.create(fpl_id: source["teams"][12]["code"], name: source["teams"][12]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][12]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "black", away_colour_2: "darkgray")
SourceTeam.create(fpl_id: source["teams"][13]["code"], name: source["teams"][13]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][13]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "dodgerblue", away_colour_2: "white")
SourceTeam.create(fpl_id: source["teams"][14]["code"], name: source["teams"][14]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][14]["code"]}.svg", home_colour_1: "red", home_colour_2: "white", away_colour_1: "white", away_colour_2: "blue")
SourceTeam.create(fpl_id: source["teams"][15]["code"], name: source["teams"][15]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][15]["code"]}.svg", home_colour_1: "white", home_colour_2: "black", away_colour_1: "dodgerblue", away_colour_2: "midnightblue")
SourceTeam.create(fpl_id: source["teams"][16]["code"], name: source["teams"][16]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][16]["code"]}.svg", home_colour_1: "white", home_colour_2: "midnightblue", away_colour_1: "midnightblue", away_colour_2: "goldenrod")
SourceTeam.create(fpl_id: source["teams"][17]["code"], name: source["teams"][17]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][17]["code"]}.svg", home_colour_1: "yellow", home_colour_2: "black", away_colour_1: "white", away_colour_2: "black")
SourceTeam.create(fpl_id: source["teams"][18]["code"], name: source["teams"][18]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][18]["code"]}.svg", home_colour_1: "white", home_colour_2: "midnightblue", away_colour_1: "black", away_colour_2: "lightskyblue")
SourceTeam.create(fpl_id: source["teams"][19]["code"], name: source["teams"][19]["name"], badge_url: "https://platform-static-files.s3.amazonaws.com/premierleague/badges/t#{source["teams"][19]["code"]}.svg", home_colour_1: "maroon", home_colour_2: "skyblue", away_colour_1: "white", away_colour_2: "skyblue")

SourceTeam.all.each do |team|
	team.game_teams.create(league_id: League.pluck(:id).sample)
end

GameTeam.all.each do |team|
	team.update(win: rand(0..10), draw: rand(0..10), loss: rand(0..10),goals_for: rand(10..50),goals_against: rand(10..50))
end

GameTeam.find_by(league_id: 1, source_team_id: 8).update(user_id: 1)


source["elements"].each do |player|
	team_id = SourceTeam.find_by(fpl_id: player["team_code"])['id']
	if player["element_type"] == 1 && player["minutes"] >= 89
		attacking_ability = 0
		defending_ability = 0
		goalkeeping_ability = 4.5 + (player["now_cost"].to_f-40)/3 + (player["saves"].to_f/player["minutes"]-0.02)*12.5 - (player["goals_conceded"].to_f/player["minutes"])*10
	elsif player["element_type"] == 1 && player["minutes"] < 89
		attacking_ability = 0
		defending_ability = 0
		goalkeeping_ability = 4 + (player["now_cost"].to_f-40)/3
	elsif player["element_type"] == 2 && player["minutes"] >= 89
		attacking_ability = 2 + rand()*4
		defending_ability = defending_ability = 5 + ((player["now_cost"].to_f-39)/5 + 25 * player["goals_conceded"].to_f/player["minutes"] + player["points_per_game"].to_f/7 + 100 * player["clean_sheets"].to_f/player["minutes"])/1.4
		if attacking_ability > defending_ability -2
			attacking_ability = defending_ability - 2
		end
		goalkeeping_ability = 0
	elsif player["element_type"] == 2 && player["minutes"] < 89
		attacking_ability = 2 + rand()*4
		defending_ability = 5 + ((player["now_cost"].to_f-39)/5)/1.4
		if attacking_ability > defending_ability -2
			attacking_ability = defending_ability - 2
		end
		goalkeeping_ability = 0
	elsif player["element_type"] == 3 && player["minutes"] >= 89
		attacking_ability = 3.2 + ((player["now_cost"].to_f-44)/17.4 + player["goals"].to_f/9 + player["points_per_game"].to_f/7 + player["clean_sheets"].to_f/6)/1.2
		defending_ability = 3 + ((player["now_cost"].to_f-39)/5 + 25 * player["goals_conceded"].to_f/player["minutes"] + player["points_per_game"].to_f/7 + 100 * player["clean_sheets"].to_f/player["minutes"])/3.4
		goalkeeping_ability = 0
	elsif player["element_type"] == 3 && player["minutes"] < 89
		attacking_ability = 3.2 + ((player["now_cost"].to_f-44)/17.4 + player["goals"].to_f/9 + player["points_per_game"].to_f/7 + player["clean_sheets"].to_f/6)/1.2
		defending_ability = 3 + ((player["now_cost"].to_f-39)/5)/3.4
		goalkeeping_ability = 0
	else player["element_type"] == 4
		attacking_ability = attacking_ability = 5 + ((player["now_cost"].to_f-44)/17.4 + player["goals"].to_f/9 + player["points_per_game"].to_f/7 + player["clean_sheets"].to_f/6)/1.3
		defending_ability = 2 + rand()*4
		if defending_ability > attacking_ability - 2
			defending_ability = attacking_ability - 2
		end
		goalkeeping_ability = 0
	end
	SourcePlayer.create(first_name: player["first_name"], last_name: player["second_name"], name: player["web_name"], position: player["element_type"], attacking_ability: attacking_ability, defending_ability: defending_ability, goalkeeping_ability: goalkeeping_ability, source_team_id: team_id, squad_number: player["squad_number"], form_adjustment: 0, image_url: "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/p#{player["code"]}.png", available: true, injury_remain: 0, injury_id: 1)
end

SourcePlayer.all.each do |player|
	player.game_players.create(game_team_id: player.source_team[:id])
end

(0..37).each do |week|
	date = Date.new(2016,8,13) + week * 7
	test.leagues.first.rounds.create(date: date, active: false)
end

@rounds = Round.all

def fixture_generate

	half_schedule = make_fixture_array
	@rounds = User.first.leagues.first.rounds
	team_base_id = User.first.leagues.first.game_teams.order('id')[0][:id]
	team_ids = User.first.leagues.first.game_teams.order('id').pluck('id').shuffle!
	# team_ids
	(0..18).each do |round|
		half_schedule[round].each do |match|
			# puts match.to_s
			if match[0] == match[1]
				if round % 2 == 0
					@rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[19])
				else
					@rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[19], away_team_id: team_ids[match[0]])
				end	
			else
				@rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[match[1]])
			end
		end
	end
	(0..18).each do |round|
		half_schedule[round].each do |match|
			if match[0] == match[1]
				if round % 2 == 0
					@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[19], away_team_id: team_ids[match[0]])
				else
					@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[19])
				end	
			else
				@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[1]], away_team_id: team_ids[match[0]])
			end
		end
	end

end

def make_fixture_array
	@test_array = [
		[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] ,
		[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1] ,
		[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2] ,
		[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3] ,
		[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4] ,
		[6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5] ,
		[7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6] ,
		[8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7] ,
		[9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8] ,
		[10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9] ,
		[11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10] ,
		[12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11] ,
		[13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12] ,
		[14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13] ,
		[15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14] ,
		[16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ,
		[17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16] ,
		[18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17] ,
		[19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18] ,
	]
	fixture_array = []
	# find all i,j where they are equal banana
	(1..19).each do |banana|
		i = 0
		j = 0
		round_array = []
		@test_array.each do |element|
			# puts element.to_s
			j = 0
			element.each do |element|
				if element == banana
					round_array.push [i,j]
				end
				j += 1
			end
			i += 1
		end
		round_array.each do |dupe|
			if dupe[0] == dupe[1]
			elsif round_array.index [dupe[1],dupe[0]]
				round_array.slice!(round_array.index([dupe[1],dupe[0]]),1)
			end
			if banana % 2 == 0
				temp = dupe[0]
				dupe[0] = dupe[1]
				dupe[1] = temp
			end
		end
		fixture_array.push round_array
	end
	fixture_array
end

fixture_generate 
 
# def match_testing id

# 	home_team_id = Match.find(id)[:home_team_id]
# 	away_team_id = Match.find(id)[:away_team_id]

# 	# # GK
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 73, match_stat_id: new_match[:id])
# 	# # D
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 75, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 76, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 77, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 78, match_stat_id: new_match[:id])
# 	# # M
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 82, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 83, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 84, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 85, match_stat_id: new_match[:id])
# 	# # F
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 96, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 97, match_stat_id: new_match[:id])

# 	# # GK
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 450, match_stat_id: new_match[:id])
# 	# # D
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 452, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 453, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 454, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 455, match_stat_id: new_match[:id])
# 	# # M
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 464, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 465, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 466, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 467, match_stat_id: new_match[:id])
# 	# # F
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 468, match_stat_id: new_match[:id])
# 	# new_match = Match.find(id).match_stats.create(shots: 0, goals_scored: 0, assists: 0, attempted_passes: 0, succesful_passes: 0, interceptions: 0)
# 	# GamePlayersMatchStat.create(game_player_id: 470, match_stat_id: new_match[:id])

# 	# getting the teams and defining the squad
# 	home_team_squad = build_match_squad id,home_team_id
# 	away_team_squad = build_match_squad id,away_team_id
	
# 	Match.find(id).update(home_team_score: 0)
# 	Match.find(id).update(away_team_score: 0)

# 	clock = 0
# 	Match.find(id).update(control: true)
# 	Match.find(id).update(possesion_zone: 4)
# 	while clock < 91 do
# 		# puts clock
# 		# puts Match.find(id)[:possesion_zone]
# 		# puts Match.find(id)[:control]
# 		if clock == 45
# 			# puts 'half time'
# 			if Match.find(id)[:control]
# 				Match.find(id).match_events.create(event_type: 2, event_text: 'Half time, time for a break', team_id: Match.find(id)[:home_team_id])
# 			else
# 				Match.find(id).match_events.create(event_type: 2, event_text: 'Half time, time for a break', team_id: Match.find(id)[:away_team_id])
# 			end
# 			Match.find(id).update(control: false)
# 			Match.find(id).update(possesion_zone: 4)
# 		elsif clock == 90
# 			# puts 'full time'
# 			if Match.find(id)[:home_team_score] > Match.find(id)[:away_team_score]
# 				Match.find(id).match_events.create(event_type: 3, event_text: 'Full time, The home team have won', team_id: Match.find(id)[:home_team_id])
# 			elsif Match.find(id)[:home_team_score] < Match.find(id)[:away_team_score]
# 				Match.find(id).match_events.create(event_type: 3, event_text: 'Full time, the away team have won', team_id: Match.find(id)[:away_team_id])
# 			else
# 				Match.find(id).match_events.create(event_type: 3, event_text: "Full time, they'll have to settle for a draw", team_id: Match.find(id)[:away_team_id])
# 			end
# 		else
# 			pass home_team_squad,away_team_squad,id
# 		end
# 		clock += 1
# 	end
# end

# def build_match_squad match_id,team_id

# 	@squad_arr = [[],[],[],[]]

# 	Match.find(match_id).match_stats.each do |player|
# 		if player.game_players[0][:game_team_id] == team_id
# 			name = player.game_players[0].source_player[:name]
# 			game_player_id = player.game_players[0][:id]
# 			source_player_id = player.game_players[0].source_player[:id]
# 			position = player.game_players[0].source_player[:position]
# 			goalkeeping_ability = player.game_players[0].source_player[:goalkeeping_ability]
# 			defending_ability = player.game_players[0].source_player[:defending_ability]
# 			attacking_ability = player.game_players[0].source_player[:attacking_ability]
# 			# create a hash out of the above info
# 			player_hash = {
# 				name: name,
# 				game_player_id: game_player_id,
# 				source_player_id: source_player_id,
# 				position: position,
# 				goalkeeping_ability: goalkeeping_ability,
# 				defending_ability: defending_ability,
# 				attacking_ability: attacking_ability
# 			}
# 			if player_hash[:position] == "1"
# 				@squad_arr[0].push player_hash
# 			elsif player_hash[:position] == "2"
# 				@squad_arr[1].push player_hash
# 			elsif player_hash[:position] == "3"
# 				@squad_arr[2].push player_hash
# 			elsif player_hash[:position] == "4"
# 				@squad_arr[3].push player_hash
# 			end
# 		end
# 	end

# 	squad_hash = {
# 		goalkeeper:		@squad_arr[0],
# 		defenders:		@squad_arr[1],
# 		midfielders:	@squad_arr[2],
# 		attackers:		@squad_arr[3],
# 		score:			0, 
# 		name: 			GameTeam.find(team_id).source_team[:name]
# 	}
# end

# # function to pass the ball
# def pass home_team_squad,away_team_squad,id
# 	control = Match.find(id)[:control]
# 	zone = Match.find(id)[:possesion_zone]
# 	midpoint = pass_midpoint_calc home_team_squad,away_team_squad,id
# 	pass = rand()
# 	if pass <= midpoint
# 		# puts 'passed'
# 		if control && zone < 7
# 			Match.find(id).update(possesion_zone: zone + 1)
# 		elsif !control && zone > 1
# 			Match.find(id).update(possesion_zone: zone - 1)
# 		else 
# 			shoot home_team_squad,away_team_squad,id
# 		end
# 	else
# 		# puts 'intercepted'
# 		Match.find(id).update(control: !control)
# 	end
# end

# def shoot home_team_squad,away_team_squad,id
# 	control = Match.find(id)[:control]
# 	midpoint = shot_midpoint_calc home_team_squad,away_team_squad,id
# 	# puts 'shooting...'
# 	shot = rand()
# 	if shot <= midpoint
# 		# puts '...scored!'
# 		if control
# 			# home team scores
# 			Match.find(id).update(home_team_score: Match.find(id)[:home_team_score] + 1)
# 			# set poss zone to 4
# 			Match.find(id).update(possesion_zone: 4)
# 			# switch control
# 			Match.find(id).update(control: !control)
# 		else
# 			# away team scores
# 			Match.find(id).update(away_team_score: Match.find(id)[:away_team_score] + 1)
# 			# set poss zone to 4
# 			Match.find(id).update(possesion_zone: 4)
# 			# switch control
# 			Match.find(id).update(control: !control)
# 		end
# 	else
# 		# puts '...missed!'
# 		Match.find(id).update(control: !control)
# 	end	
# end

# def pass_midpoint_calc home_team_squad,away_team_squad,id
# 	zone = Match.find(id)[:possesion_zone]
# 	control = Match.find(id)[:control]
# 	if control
# 		if zone >= 6
# 			attacking = home_team_squad[:attackers]
# 			defending = away_team_squad[:defenders]
# 		elsif zone >= 3
# 			attacking = home_team_squad[:midfielders]
# 			defending = away_team_squad[:midfielders]
# 		else
# 			attacking = home_team_squad[:defenders]
# 			defending = away_team_squad[:attackers]
# 		end	
# 	else
# 		if zone <= 2 
# 			attacking = away_team_squad[:attackers]
# 			defending = home_team_squad[:defenders]
# 		elsif zone <= 5
# 			attacking = away_team_squad[:midfielders]
# 			defending = home_team_squad[:midfielders]
# 		else
# 			attacking = away_team_squad[:defenders]
# 			defending = home_team_squad[:attackers]
# 		end	
# 	end
# 	att_player = attacking.sample
# 	# puts att_player[:attacking_ability]
# 	att_pos_ave = pos_ave attacking,true
# 	def_player = defending.sample
# 	# puts def_player[:defending_ability]
# 	def_pos_ave = pos_ave defending,false
# 	(att_player[:attacking_ability] + att_pos_ave)/(att_player[:attacking_ability] + att_pos_ave + def_player[:defending_ability] + def_pos_ave)
# end

# def pos_ave position_array,attacking
# 	if attacking
# 		key = :attacking_ability
# 	else
# 		key = :defending_ability
# 	end
# 	total = 0
# 	position_array.each do |player|
# 		total = total + player[key]
# 	end
# 	total/position_array.length
# end

# def shot_midpoint_calc home_team_squad,away_team_squad,id
# 	control = Match.find(id)[:control]
# 	if control
# 		forward = home_team_squad[:attackers].sample
# 		forward[:attacking_ability]/(forward[:attacking_ability] + away_team_squad[:goalkeeper][0][:goalkeeping_ability])
# 	else
# 		forward = away_team_squad[:attackers].sample
# 		forward[:attacking_ability]/(forward[:attacking_ability] + home_team_squad[:goalkeeper][0][:goalkeeping_ability])
# 	end
# end

# match_testing 51