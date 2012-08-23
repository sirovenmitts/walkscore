module Walkscore
	class InvalidKey < RuntimeError
		def initialize invalid_api_key
			super 'Your API key (%s) is invalid.' % invalid_api_key
		end
	end
end