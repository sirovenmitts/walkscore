# Walkscore
This is a gem for interacting with the Walkscore Api.  You can easily request the walkscore of any given city by just passing in the lat and long of a given city.  You will need an API key from walkscore first.

## Installation

Add this line to your application's Gemfile:

    gem 'walkscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install walkscore

## Usage

### There is only one external method you will be using to interact with the api.

### WalkscoreApi::Walkscore.find({lat: 40.7143528 , long: -74.00597309999999 }, API_KEY)
That's it!  You're response will be a Walkscore object where you have access to the following methods
### score
### description
### updated
### logo_url
### ws_link
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
