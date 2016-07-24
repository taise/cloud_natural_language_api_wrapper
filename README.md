# CloudNaturalLanguageAPIWrapper

## Requirements

- Ruby 2.3

## How to use

Get your Cloud Natural Language API on Google Cloud Platform Console at first.  
Please, check [the offical document](https://cloud.google.com/natural-language/docs/getting-started).

```ruby
API_KEY = 'Set your Cloud Natural Language API key'
cloud_neural_language_api = CloudNaturalLanguageAPI.new(API_KEY)
puts cloud_neural_language_api.analyze_entity('Hello Google Cloud Neural Language API.')
```

## Next Features

- callable analyzeSentiment api
- callable annotateText api

## License

MIT License
