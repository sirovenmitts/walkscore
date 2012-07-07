require 'faraday'

module WalkscoreApi
  class Client
    BASE_URL = 'http://api.walkscore.com'

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def make_connection(location, api_key)
      response = @connection.get do |req|
        req.url '/score'
        req.headers['Accepts'] = 'application/json'
        req.params['format'] = 'json'
        req.params['lat'] = location[:lat]
        req.params['lon'] = location[:long]
        req.params['wsapikey'] = api_key
      end
      response.body
    end
  end
end