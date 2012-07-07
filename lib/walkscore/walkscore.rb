require 'json'

module WalkscoreApi
  class Walkscore
    attr_accessor :score, :description, :updated, :logo_url, :ws_link

    def initialize(attributes)
      self.score       = attributes['walkscore']
      self.description = attributes['description']
      self.updated     = attributes['updated']
      self.logo_url    = attributes['logo_url']
      self.ws_link     = attributes['ws_link']
    end

    def self.client
      WalkscoreApi::Client.new
    end

    def self.find(location, api_key)
      parsed_results = JSON.parse(client.make_connection(location, api_key))
      WalkscoreApi::Walkscore.new(parsed_results)
    end
  end
end