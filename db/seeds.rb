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
test.leagues.create(league_name: 'Champions!!!')

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

# GameTeam.all.each do |team|
# 	team.update(win: rand(0..10), draw: rand(0..10), loss: rand(0..10),goals_for: rand(10..50),goals_against: rand(10..50))
# end

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
	SourcePlayer.create(first_name: player["first_name"], last_name: player["second_name"], name: player["web_name"], position: player["element_type"], attacking_ability: attacking_ability, defending_ability: defending_ability, goalkeeping_ability: goalkeeping_ability, source_team_id: team_id, squad_number: player["squad_number"], form_adjustment: 0, image_url: "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/110x140/p#{player["code"]}.png", available: true, injury_remain: 0, injury_id: 1)
end

SourcePlayer.all.each do |player|
	player.game_players.create(game_team_id: player.source_team[:id])
end

(0..37).each do |week|
	date = Date.new(2016,8,13) + week * 7
	test.leagues.first.rounds.create(date: date, active: false)
end

test.leagues.first.rounds.first.update(active: true)

	def fixture_generate league_id

		# User.first.leagues.first.rounds[0].update(active: true)
		League.find(league_id).rounds.order('id')[0].update(active: true)
		half_schedule = make_fixture_array
		# @rounds = User.first.leagues.first.rounds
		@rounds = League.find(league_id).rounds
		# team_base_id = User.first.leagues.first.game_teams.order('id')[0][:id]
		team_base_id = League.find(league_id).game_teams.order('id')[0][:id]
		# team_ids = User.first.leagues.first.game_teams.order('id').pluck('id').shuffle!
		team_ids = League.find(league_id).game_teams.order('id').pluck('id').shuffle!
		# team_ids
		(0..18).each do |round|
			half_schedule[round].each do |match|
				# puts match.to_s
				if match[0] == match[1]
					if round % 2 == 0
						@rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[19])
					else
						newMatch = @rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[19], away_team_id: team_ids[match[0]])
					end	
				else
					newMatch = @rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[match[1]])
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

	fixture_generate 1