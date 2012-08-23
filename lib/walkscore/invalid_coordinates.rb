module Walkscore
	class InvalidCoordinates < RuntimeError
		def initialize latitude, longitude
			super 'The coordinates (%d, %d) are not valid.' % [latitude, longitude]
		end
	end
end