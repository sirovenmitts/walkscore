require 'spec_helper'

class MockClient
  def make_connection(location, api_key)
    <<-eos
      {\n\"status\": 1  \n,
       \"walkscore\": 100\n,
       \"description\": \"Walker's Paradise\"\n,
       \"updated\": \"2012-06-27 23:22:43.598005\" \n,
       \"logo_url\": \"http://www2.walkscore.com/images/api-logo.gif\"\n,
       \"more_info_icon\": \"http://www2.walkscore.com/images/api-more-info.gif\"\n,
       \"more_info_link\": \"http://www.walkscore.com/how-it-works.shtml\"\n, \"ws_link\": \"http://www.walkscore.com/score/loc/lat=40.7143528/lng=-74.00597309999999/?utm_source=dynamiteurbanite.com&utm_medium=ws_api&utm_campaign=ws_api\"\n,
       \"snapped_lat\": 40.7145\n,
       \"snapped_lon\": -74.0055  \n\n\n\n}
    eos
  end
end

describe WalkscoreApi::Walkscore do
  before(:each) do
    WalkscoreApi::Walkscore.stub(:client).and_return(MockClient.new)
  end

  describe '.find(location, api_key)' do
    it 'returns an instance of WalkscoreApi::Walkscore' do
      WalkscoreApi::Walkscore.find({lat: 40.7143528 , long: -74.00597309999999}, API_KEY).should be_a(WalkscoreApi::Walkscore)
    end
  end
end