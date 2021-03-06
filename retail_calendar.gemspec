# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'retail_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = "retail_calendar"
  spec.version       = RetailCalendar::VERSION
  spec.authors       = ["Aditya Raghuwanshi"]
  spec.email         = ["adi.version1@gmail.com"]
  spec.summary       = %q{Find Dates in the Retails Calendar}
  spec.description   = %q{Gem for finding ranges in Retail or the 4-5-4 Calendar format}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "dish"

end
