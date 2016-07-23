# frozen_string_literal: true
require 'json'
require 'uri'
require 'net/http'

class CloudNaturalLanguageAPI
  HOST = 'language.googleapis.com'
  PORT = 443

  attr_accessor :api_key
  def initialize(api_key)
    self.api_key = api_key
  end

  def analyze_entity(content, lang = 'ja')
    path = '/v1beta1/documents:analyzeEntities'
    query = 'key=' + api_key
    uri = URI::HTTPS.build(host: HOST, path: path, port: PORT, query: query)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = 'application/json'
    req.body = body(content, lang)
    https.request(req)
  end

  private

  def body(content, lang)
    {
      document: {
        type: 'PLAIN_TEXT',
        language: lang,
        content: content
      },
      encodingType: 'UTF8'
    }.to_json
  end
end
