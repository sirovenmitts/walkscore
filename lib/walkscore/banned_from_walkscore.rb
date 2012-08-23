require 'socket'

module Walkscore
	class BannedFromWalkscore < RuntimeError
		def initialize
			# TODO: Get the local IP address here and report it. To the feds. Or
			# to the user of the library.
			super 'Your IP address has been banned from using the Walkscore API.'
		end
	end
end