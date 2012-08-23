require 'uri'
require 'spec_helper'

# The result object is mostly just a value object, but there
# are some actual data transformations, so I'll only test those
# methods.
describe Walkscore::Result do
	let(:result) do
		client = Walkscore::Client.new 'valid key'
		VCR.use_cassette 'valid request' do
			# Coordinates for the White House
			client.score_at 38.898748, -77.037684
		end
	end
	it 'should return a time object indicating when Walkscore last updated this score' do
		result.updated_at.should be_an_instance_of Time
	end
	it 'should return a URI pointing to a Walkscore page for this location' do
		result.score_url.should be_an_instance_of URI::HTTP
	end
	it 'should return a URI pointing to the Walkscore logo' do
		result.walkscore_logo_url.should be_an_instance_of URI::HTTP
	end
	it 'should return a URI pointing to the Walkscore more info icon' do
		result.more_info_icon_url.should be_an_instance_of URI::HTTP
	end
	it 'should return a URI pointing to more information about Walkscore' do
		result.more_info_url.should be_an_instance_of URI::HTTP
	end
end