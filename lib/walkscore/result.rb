require 'uri'
require 'time'

module Walkscore
	class Result
		attr_reader(
			:score,
			:description,
			:updated_at,
			:score_uri,
			:walkscore_logo_uri,
			:more_info_icon_uri,
			:more_info_uri)
		def initialize attributes
			@score = attributes['walkscore']
			@description = attributes['description']

			@updated_at = Time.parse attributes['updated']

			@score_uri = URI(attributes['ws_link'])
			@walkscore_logo_uri = URI(attributes['logo_url'])
			@more_info_icon_uri = URI(attributes['more_info_icon'])
			@more_info_uri = URI(attributes['more_info_link'])
		end
	end
end