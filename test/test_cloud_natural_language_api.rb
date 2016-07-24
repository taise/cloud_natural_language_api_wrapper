# frozen_string_literal: true
require 'json'
require 'test/unit'
require_relative '../cloud_natural_language_api'

class TestCloudNaturalLanguageAPI < Test::Unit::TestCase
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
    @cnl_api = CloudNaturalLanguageAPI.new(API_KEY)
  end

  def test_new
    assert_equal(API_KEY, @cnl_api.api_key)
  end

  def test_HOST
    assert_equal('language.googleapis.com', CloudNaturalLanguageAPI::HOST)
  end

  def test_PORT
    assert_equal(443, CloudNaturalLanguageAPI::PORT)
  end

  def test_post
    uri = URI.parse('https://httpbin.org/post')
    body = { content: 'test'}.to_json
    assert_equal('200', @cnl_api.post(uri, body).code)
  end

  def test_analyze_entities
    res = @cnl_api.analyze_entities(CONTENT_EN)
    actual = JSON.parse(res)
    assert(actual.has_key?('entities'))
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  def test_analyze_sentiment
    res = @cnl_api.analyze_sentiment(CONTENT_EN)
    actual = JSON.parse(res)
    assert(actual.has_key?('documentSentiment'))
    assert(actual.has_key?('language'))
    assert_equal('en', actual['language'])
  end

  def test_build_uri
    expect = 'https://language.googleapis.com/awesome_path?key='+ API_KEY
    actual = @cnl_api.send(:build_uri, '/awesome_path')
    assert(actual.instance_of?(URI::HTTPS))
    assert(expect, actual.to_s)
  end

  def test_query
    assert_equal("key=#{API_KEY}", @cnl_api.send(:query))
  end

  def test_document_en
    actual = @cnl_api.send(:document, CONTENT_EN, 'EN')
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
    actual = @cnl_api.send(:document, CONTENT_JA, 'ja')
    expect = {
      document: {
        type: 'PLAIN_TEXT',
        language: 'ja',
        content: CONTENT_JA
      }
    }
    assert_equal(expect, actual)
  end
end
