# frozen_string_literal: true
require 'test/unit'
require_relative '../cloud_natural_language_api'

class TestCloudNaturalLanguageAPI < Test::Unit::TestCase
  API_KEY = 'api_key'

  def setup
    @cnl_api = CloudNaturalLanguageAPI.new(API_KEY)
  end

  def test_new
    assert(API_KEY, @cnl_api.api_key)
  end

  def test_HOST
    assert('language.googleapis.com', CloudNaturalLanguageAPI::HOST)
  end
end
