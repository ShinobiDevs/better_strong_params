# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_strong_params/version'

Gem::Specification.new do |spec|
  spec.name          = "better_strong_params"
  spec.version       = BetterStrongParams::VERSION
  spec.authors       = ["Elad Meidar"]
  spec.email         = ["elad@eizesus.com"]
  spec.summary       = "Adds a DSL to ActionController that allows to add strong params filtering without adding a specific, dirty controller method."
  spec.description   = ""
  spec.homepage      = "https://github.com/ShinobiDevs/better_strong_params/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rails'
end
