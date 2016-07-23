# frozen_string_literal: true
require 'test/unit'
require_relative '../cloud_natural_language_api'

class TestCloudNaturalLanguageAPI < Test::Unit::TestCase
  API_KEY = ENV['API_KEY']

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
end
