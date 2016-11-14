task :change_active_round => :environment do
	active_rounds = Round.where(active: true)
	active_rounds.each do |round|
		counter = 0
		round.matches.each do |match|
			match[:played] ? counter += 1 : counter
		end
		if counter == 10
			# change active round
			round.update(active: false)
			Round.find(round[:id] + 1).update(active: true)
		end
	end
end