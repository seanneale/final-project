class TestWorker
	include Sidekiq::Worker

	def perform
		puts 'qwertyuiopswexdcvgbuji'
		TestBWorker.perform_async()
	end
end