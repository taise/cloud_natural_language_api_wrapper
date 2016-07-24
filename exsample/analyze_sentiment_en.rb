require_relative '../lib/cloud_natural_language'


CONTENT = <<-'EOF'
Alice was beginning to get very tired of sitting by her sister on the bank,
and of having nothing to do: once or twice she had peeped into the book her
sister was reading, but it had no pictures or conversations in it,
'and what is the use of a book,' thought Alice 'without pictures or conversations?'
EOF
# from: Alice's Adventures in Wonderland / Lewis Carroll
# http://www.gutenberg.org/files/11/11-h/11-h.htm

cnl = CloudNaturalLanguage::API.new(ENV['API_KEY'])
puts cnl.analyze_sentiment(CONTENT)

=begin
{
  "documentSentiment": {
    "polarity": -1,
    "magnitude": 0.9
  },
  "language": "en"
}
=end
