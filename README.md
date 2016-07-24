# CloudNaturalLanguageAPIWrapper

## Requirements

- Ruby 2.3

## How to use

Get your Cloud Natural Language API on Google Cloud Platform Console at first.  
Please, check [the offical document](https://cloud.google.com/natural-language/docs/getting-started).

```ruby
API_KEY = 'Set your Cloud Natural Language API key'
api = CloudNaturalLanguage::API.new(API_KEY)
puts api.analyze_entity('Hello Google Cloud Neural Language API.')
```

## Next Features

- callable analyzeSentiment api
- callable annotateText api

## License

MIT License
