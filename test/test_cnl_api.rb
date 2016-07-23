# frozen_string_literal: true
require 'test/unit'
require 'test/unit/notify'

require_relative '../cnl_api'

class TestCnlAPI < Test::Unit::TestCase
  API_KEY = 'api_key'

  def test_new
    cnl_api = CnlAPI.new(API_KEY)
    assert(API_KEY, cnl_api.api_key)
  end
end
