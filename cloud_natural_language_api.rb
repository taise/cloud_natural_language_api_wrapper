# frozen_string_literal: true

class CloudNaturalLanguageAPI
  attr_accessor :api_key
  def initialize(api_key)
    self.api_key = api_key
  end
end
