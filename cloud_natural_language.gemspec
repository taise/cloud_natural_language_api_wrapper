# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_natural_language/version'

Gem::Specification.new do |spec|
  spec.name          = "cloud_natural_language"
  spec.version       = CloudNaturalLanguage::VERSION
  spec.authors       = ["taise"]
  spec.email         = ["taise515@gmail.com"]

  spec.summary       = %q{Google Cloud Natural Language API wrapper}
  spec.description   = %q{Google Cloud Natural Language API wrapper}
  spec.homepage      = "https://github.com/taise/cloud_natural_language_api_wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.2.1"
end
