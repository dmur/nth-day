# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nth_day/version'

Gem::Specification.new do |spec|
  spec.name          = "nth_day"
  spec.version       = NthDay::VERSION
  spec.authors       = ["Dolan Murphy"]
  spec.email         = ["admin@dmur.me"]
  spec.summary       = %q{Query for the next nth weekday of the month.}
  spec.description   = %q{Nth day allows you to specify dates in the format "1st Tuesday", and have returned a date for the next occurrence of that day.}
  spec.homepage      = "http://github.com/dmur/nth-day"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "coveralls", "~> 0.8.0"
end
