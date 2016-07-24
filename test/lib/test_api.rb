# frozen_string_literal: true
require 'json'
require 'test/unit'
require_relative '../../lib/cloud_natural_language/api'

class TestAPI < Test::Unit::TestCase
  API_KEY = ENV['API_KEY']
  CONTENT_EN = 'Hello Google Cloud Natural Language API!'
  CONTENT_JA = 'こんにちは グーグル Cloud Natural Language API!'

  def self.startup
    if API_KEY.nil?
      puts <<-"EOF"
        \e[31mAny tests didn't run.
        Please set ENV['API_KEY'].
        $ export API_KEY=<Set your Cloud Natural Language API key>
        https://cloud.google.com/natural-language/docs/getting-started\e[0m
      EOF
      exit 1
    end
  end

  def setup
    @api = CloudNaturalLanguage::API.new(API_KEY)
  end

  def test_new
    assert_equal(API_KEY, @api.api_key)
  end

  def test_HOST
    assert_equal('language.googleapis.com', CloudNaturalLanguage::API::HOST)
  end

  def test_PORT
    assert_equal(443, CloudNaturalLanguage::API::PORT)
  end

  def test_post
    uri = URI.parse('https://httpbin.org/post')
    body = { content: 'test'}.to_json
    assert_equal('200', @api.post(uri, body).code)
  end

  def test_analyze_entities
    res = @api.analyze_entities(CONTENT_EN)
    actual = JSON.parse(res)
    assert(actual.has_key?('entities'))
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  def test_analyze_sentiment
    res = @api.analyze_sentiment(CONTENT_EN)
    actual = JSON.parse(res)
    assert(actual.has_key?('documentSentiment'))
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  def test_annotate_text_default
    res = @api.annotate_text(CONTENT_EN)
    actual = JSON.parse(res)

    assert(actual.has_key?('sentences'))
    assert(actual.has_key?('tokens'))
    assert(actual.has_key?('entities'))
    assert(actual['entities'].empty?)
    assert_equal(false, actual.has_key?('documentSentiment'))
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  def test_annotate_text_all
    opts = {
      syntax: true,
      entities: true,
      sentiment: true
    }
    res = @api.annotate_text(CONTENT_EN, 'en', opts)
    actual = JSON.parse(res)

    assert(actual.has_key?('sentences'))
    assert(actual.has_key?('tokens'))
    assert(actual.has_key?('entities'))
    assert_equal(false, actual['entities'].empty?)
    assert(actual.has_key?('documentSentiment'))
    assert_equal(false, actual['documentSentiment'].empty?)
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  # test private methods

  def test_build_uri
    expect = 'https://language.googleapis.com/awesome_path?key='+ API_KEY
    actual = @api.send(:build_uri, '/awesome_path')
    assert(actual.instance_of?(URI::HTTPS))
    assert(expect, actual.to_s)
  end

  def test_query
    assert_equal("key=#{API_KEY}", @api.send(:query))
  end

  def test_document_en
    actual = @api.send(:document, CONTENT_EN, 'EN')
    expect = {
      document: {
        type: 'PLAIN_TEXT',
        language: 'EN',
        content: CONTENT_EN
      }
    }
    assert_equal(expect, actual)
  end

  def test_document_ja
    actual = @api.send(:document, CONTENT_JA, 'ja')
    expect = {
      document: {
        type: 'PLAIN_TEXT',
        language: 'ja',
        content: CONTENT_JA
      }
    }
    assert_equal(expect, actual)
  end

  def test_features_default
    actual = @api.send(:features)
    expect = {
      features: {
        extractSyntax: true,
        extractEntities: false,
        extractDocumentSentiment: false
      }
    }
    assert_equal(expect, actual)
  end

  def test_features_all_true
    actual = @api.send(
      :features,
      syntax: true,
      entities: true,
      sentiment: true
    )
    expect = {
      features: {
        extractSyntax: true,
        extractEntities: true,
        extractDocumentSentiment: true
      }
    }
    assert_equal(expect, actual)
  end
end
