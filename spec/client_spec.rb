require 'spec_helper'

# You may notice a lot of what looks like boring boilerplate code.
# Don't be fooled; boilerplate is never boring.
describe Walkscore::Client do
	it 'should return a result object when a walk score is available' do
		client = Walkscore::Client.new 'valid key'
		VCR.use_cassette 'valid request' do
			# Coordinates for the White House
			result = client.score_at 38.898748, -77.037684
			result.should be_an_instance_of Walkscore::Result
		end
	end
	it 'should raise an error if a walk score is unavailable' do
		client = Walkscore::Client.new 'walkscore dropped the ball'
		expect do
			VCR.use_cassette 'score not ready' do
				# Coordinates for who knows where
				client.score_at 1, 1
			end
		end.to raise_error Walkscore::ScoreNotReady
	end
	it 'should raise an error if given invalid coordinates' do
		client = Walkscore::Client.new 'those coordinates are wrong'
		expect do
			VCR.use_cassette 'invalid coordinates' do
				# Coordinates for who knows where
				client.score_at 100_000_000, -100_000_000
			end
		end.to raise_error Walkscore::InvalidCoordinates
	end
	it 'should raise an error if an api key is invalid' do
		client = Walkscore::Client.new 'this is not a valid key'
		expect do
			VCR.use_cassette 'invalid key' do
				# Coordinates for the White House
				client.score_at 38.898748, -77.037684
			end
		end.to raise_error Walkscore::InvalidKey
	end
	it 'should raise an error if the daily quota has been exceeded' do
		client = Walkscore::Client.new 'too many requests today'
		expect do
			VCR.use_cassette 'daily limit reached' do
				# Coordinates for the White House
				client.score_at 38.898748, -77.037684
			end
		end.to raise_error Walkscore::DailyLimitExceeded
	end
	it 'should raise an error if your IP address has been banned' do
		client = Walkscore::Client.new 'I got banned, and all I got was this lousy t-shirt'
		expect do
			VCR.use_cassette 'IP banned' do
				# Coordinates for the White House
				client.score_at 38.898748, -77.037684
			end
		end.to raise_error Walkscore::BannedFromWalkscore
	end
	it 'should raise an error if Walkscore had some sort of internal error' do
		client = Walkscore::Client.new 'deadbeef'
		expect do
			VCR.use_cassette 'internal server error' do
				# Coordinates for the White House
				client.score_at 38.898748, -77.037684
			end
		end.to raise_error Walkscore::ServerError
	end
end