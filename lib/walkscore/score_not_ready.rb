module Walkscore
	class ScoreNotReady < RuntimeError
		def initialize latitude, longitude
			super 'The walk score for coordinates (%d, %d) are not ready yet. \
			Please try back later.' % [latitude, longitude]
		end
	end
end