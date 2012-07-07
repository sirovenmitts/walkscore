require 'spec_helper'

describe WalkscoreApi::Client do
  describe '#make_connection' do
    context 'when making a get request to the walkscore api' do
      it 'returns a status of 1 for successful connection' do
        client = WalkscoreApi::Client.new
        result = client.make_connection({lat: 40.7143528 , long: -74.00597309999999 }, API_KEY)
        JSON.parse(result)['status'].should == 1
      end

      it 'returns a status of 40 for unsuccessful connection' do
        client = WalkscoreApi::Client.new
        result = client.make_connection({lat: 40.7143528 , long: -74.00597309999999 }, 'some_random_text')
        JSON.parse(result)['status'].should == 40
      end

      it 'returns a status of 30 for invalid location connection' do
        client = WalkscoreApi::Client.new
        result = client.make_connection({lat: -0.7143528 , long: 345.0059 }, API_KEY)
        JSON.parse(result)['status'].should == 30
      end
    end
  end
end