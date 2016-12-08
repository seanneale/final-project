class TestBWorker
	include Sidekiq::Worker

	def perform
		puts 'asdfghjkl'
	end
end