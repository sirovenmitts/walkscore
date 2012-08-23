require 'rubygems'
require 'bundler/setup'

require 'json'
require 'faraday'

require 'walkscore/result'
require 'walkscore/invalid_key'
require 'walkscore/daily_limit_exceeded'
require 'walkscore/invalid_coordinates'
require 'walkscore/banned_from_walkscore'
require 'walkscore/score_not_ready'
require 'walkscore/server_error'

module Walkscore
	class Client
		BASE_URL = 'http://api.walkscore.com'

		# Walkscore.com requires an API key to use their service.
		# You can obtain one by visiting http://www.walkscore.com/professional/api.php
		# and signing your life away.
		def initialize api_key
			@api_key = api_key
			@connection = Faraday.new(BASE_URL)
		end

		# Use Walkscore's API to look up a walkscore via a latitude
		# and longitude. This method returns a Walkscore::Result object.
		def score_at latitude, longitude
			response = @connection.get do |request|
				request.url '/score'
				request.headers['Accepts'] = 'application/json'
				request.params['format'] = 'json'
				request.params['lat'] = latitude
				request.params['lon'] = longitude
				request.params['wsapikey'] = @api_key
			end

			# Walkscore uses a combination of HTTP response and a special
			# JSON status code to help you determine the result of an API
			# call. Here are the combos (visit http://www.walkscore.com/professional/api.php
			# for more/updated information).

			# HTTP Response | status code	| meaning
			# 200			| 1				| Success!.
			# 200			| 2				| The walkscore is still being calculated.
			# 404			| 30			| The coordinates are no good.
			# 5xx			| 31			| Walkscore screwed up.
			# 200			| 40			| You have a case of bad API key.
			# 200			| 41			| Too many requests today.
			# 403			| 42			| You've be banned.

			# Walkscore's API documentation says that they return status 31
			# when an internal server error has occurred. There's no reason to trust
			# that is actually true when I can bail before even touching the response body.
			raise ServerError.new(response.status) if response.status.between?(500, 599)

			results = JSON.parse(response.body)
			case response.status
			when 200
				case results['status']
				when 1
					# Here is the only real positive response: A completely successful one.
					# Walkscore returns a JSON blob with a lot of good info that Walkscore::Request
					# will consume. All I have to do here is do nothing. The result will get
					# returned at the end of the method.
				when 2
					raise ScoreNotReady.new latitude, longitude
				when 40
					# This passes your API key to an exception, which means
					# it might be logged. Don't worry, though - your API key
					# is invalid if you ever get here.
					raise InvalidKey.new @api_key
				when 41
					raise DailyLimitExceeded.new
				end
			when 404
				raise InvalidCoordinates.new latitude, longitude
			when 403
				raise BannedFromWalkscore.new
			end
			Result.new results
		end
	end
end