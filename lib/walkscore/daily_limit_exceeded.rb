module Walkscore
	class DailyLimitExceeded < RuntimeError
		def initialize
			super 'Your daily Walkscore request quota has been exceeded. \
			Please wait until the next calendar day to continue requesting \
			scores, or ask Walkscore to increase your daily allotted requests'
		end
	end
end