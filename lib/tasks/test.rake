task :test => :environment do

	puts 'qwertyuiop'
	puts SourceTeam.all[0].name
	puts 'The team is called ' + SourceTeam.all[0].name

end