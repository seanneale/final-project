task :mark_matches_as_background => :environment do
	matches = Match.all
	matches.each do |match|
		if !match[:background] && !match[:played]
			home_id = match[:home_team_id]
			away_id = match[:away_team_id]
			if !GameTeam.find(home_id)[:user_id] && !GameTeam.find(away_id)[:user_id]
				match.update(background: true)
			end
		end
	end
end
