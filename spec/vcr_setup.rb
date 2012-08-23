require 'rubygems'
require 'bundler/setup'

require 'vcr'

VCR.configure do |vcr|
	vcr.cassette_library_dir = 'cassettes'
	vcr.hook_into :fakeweb
end