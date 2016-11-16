class TestWorker
	include Sidekiq::Worker

	def perform
		puts SourceTeam.all
		puts 'qwertyuiopswexdcvgbuji'
		TestBWorker.perform_async()
	end
end