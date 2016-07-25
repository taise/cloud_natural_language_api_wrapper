# cloud_natural_language_api_wrapper

This is a Google Cloud Natural Language API wrapper gem (unofficial).

## Installation

Add this line to your application's Gemfile:

```
gem 'cloud_natural_language'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install cloud_natural_language
```

## Usage

Get your access key for Cloud Natural Language API on Google Cloud Platform Console at first.  
Please, check [the offical document](https://cloud.google.com/natural-language/docs/getting-started).

```ruby

require 'cloud_natural_language'

API_KEY = 'Set your Cloud Natural Language API key'
api = CloudNaturalLanguage::API.new(API_KEY)

puts api.analyze_entities('Hello Google Cloud Neural Language API.')
puts api.analyze_sentiment('Hello Google Cloud Neural Language API.')
puts api.annotate_text('Hello Google Cloud Neural Language API.')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taise/cloud_natural_language_api_wrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
