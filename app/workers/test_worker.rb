class TestWorker
	include Sidekiq::Worker

	def perform
		puts 'qwertyuiopswexdcvgbuji'
	end
end