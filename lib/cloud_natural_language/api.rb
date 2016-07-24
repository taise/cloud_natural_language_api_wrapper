# frozen_string_literal: true
require 'json'
require 'uri'
require 'net/http'

module CloudNaturalLanguage
  class API
    HOST = 'language.googleapis.com'
    PORT = 443
    API_BASE_PATH = '/v1beta1/documents:'
    ANALYZE_ENTITIES_PATH  = API_BASE_PATH + 'analyzeEntities'
    ANALYZE_SENTIMENT_PATH = API_BASE_PATH + 'analyzeSentiment'
    ANNOTATE_TEXT_PATH     = API_BASE_PATH + 'annotateText'

    attr_accessor :api_key
    def initialize(api_key)
      self.api_key = api_key
    end

    def post(uri, body)
      req = Net::HTTP::Post.new(uri.request_uri)
      req['Content-Type'] = 'application/json'
      req.body = body

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.request(req)
    end

    def analyze_entities(content, lang = 'EN')
      uri = build_uri(ANALYZE_ENTITIES_PATH)
      body = document(content, lang).merge(encodingType: 'UTF8').to_json
      post(uri, body).body
    end

    def analyze_sentiment(content, lang = 'EN')
      uri = build_uri(ANALYZE_SENTIMENT_PATH)
      post(uri, document(content, lang).to_json).body
    end

    def annotate_text(content, lang = 'EN', opts = {})
      uri = build_uri(ANNOTATE_TEXT_PATH)
      body = document(content, lang)
        .merge(features(opts))
        .merge(encodingType: 'UTF8')
        .to_json
      post(uri, body).body
    end

    private

    def build_uri(path)
      URI::HTTPS.build(
        host: HOST,
        path: path,
        port: PORT,
        query: query
      )
    end

    def query
      "key=#{api_key}"
    end

    def document(content, lang)
      {
        document: {
          type: 'PLAIN_TEXT',
          language: lang,
          content: content
        }
      }
    end

    def features(syntax: true, entities: false, sentiment: false)
      {
        features: {
          extractSyntax: syntax,
          extractEntities: entities,
          extractDocumentSentiment: sentiment
        }
      }
    end
  end
end
