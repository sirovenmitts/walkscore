module Walkscore
	class ServerError < RuntimeError
		def initialize error_number
			super 'Walkscore encountered an internal error and returned this code (%s).' % error_number
		end
	end
end