# Walkscore

This here is a gem for judging people based on their gait. Actually, it's really for using the [Walkscore](http://www.walkscore.com/ "better than driving, I suppose") API to get a walk score for an arbitrary location. Simply pass in a latitude and longitude and walkscore will take care of the rest.

## Installation

Add this line to your application's Gemfile:

    gem 'walkscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install walkscore

## Usage

It's super easy to use Walkscore. To get the actual walk score for some arbitrary coordinates, just do this:

    client = Walkscore::Client.new YOUR_API_KEY_GOES_HERE

Then do this:

	result = client.score_at LATITUDE, LONGITUDE

When that's all done, you'll get a Walkscore::Result back. The result object has these things:

Thing				| Purpose
score				| The actual walk score of your Coordinates
description			| A colorful description of the walk score. This is written by Walkscore employees, so blame them if you don't like it.
updated				| When did Walkscore last update this location?
score_uri			| A URI pointing right to Walkscore's page for this location.
walkscore_logo_uri	| A URI pointing to the Walkscore Logo. Useful, I guess. For meeting the brading requirements.
more_info_icon_uri	| A URI pointing to a handy icon.
more_info_uri		| A URI pointing to info about how Walkscore works.

## Future plans

Walkscore also provides a transit and walkshed API. The transit API is up next, and will allow you to get all the stops near a location, and even find stops. The walkshed API is up as soon as I figure out what the hell good a "walkshed" is for. If you know, please email <kenneth dot pullen at gmail dot com>.

## Branding Requirements

I am totally not your boss, and I totally can't tell you what to do, so if you use this library and don't follow Walkscore's branding requirements there is nothing I can do but judge you from afar. But really, Walkscore does have some branding requirements. Check them [out](http://www.walkscore.com/professional/branding-requirements.php "Brrraaannnndddiiiiiinnnnggggg").

## API Key?

Yes. I know. Even to test the API. Get one [here](http://www.walkscore.com/professional/api-sign-up.php "At least there's no cost").

## Latitude? Longitude?

Looking for an easy way to get these? Check out [geocoder](https://github.com/alexreisner/geocoder). Geocoder is cool.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request