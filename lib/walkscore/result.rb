require 'uri'
module Walkscore
	class Result
		attr_reader(
			:score,
			:description,
			:updated_at,
			:score_url,
			:walkscore_logo_url,
			:more_info_icon_url,
			:more_info_url)
		def initialize attributes
			@score = attributes['walkscore']
			@description = attributes['description']

			@updated_at = Time.parse attributes['updated']

			@score_url = URI(attributes['ws_link'])
			@walkscore_logo_url = URI(attributes['logo_url'])
			@more_info_icon_url = URI(attributes['more_info_icon'])
			@more_info_url = URI(attributes['more_info_link'])
		end
	end
end