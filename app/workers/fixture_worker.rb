class FixtureWorker
	include Sidekiq::Worker

	def perform
		fixture_generate
	end

	# needs to be changed to general from seed
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
end