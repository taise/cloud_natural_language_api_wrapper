# frozen_string_literal: true
require 'test/unit'
require 'test/unit/notify'

require_relative '../cloud_natural_language_api'

class TestCloudNaturalLanguageAPI < Test::Unit::TestCase
  API_KEY = 'api_key'

  def test_new
    cnl_api = CloudNaturalLanguageAPI.new(API_KEY)
    assert(API_KEY, cnl_api.api_key)
  end
end
