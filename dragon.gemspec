# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragon/version'

Gem::Specification.new do |spec|
  spec.name          = "dragon"
  spec.version       = Dragon::VERSION
  spec.authors       = ["Ian Sheridan"]
  spec.email         = ["ian.sheridan@gmail.com"]
  spec.description   = %q{Dragon a deployment tools inspired by Rye.}
  spec.summary       = %q{Deployment tool.}
  spec.homepage      = "https://github.com/iansheridan/dragon"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.add_dependency "pry"
  spec.add_dependency "rye"
  spec.add_dependency "liquid"
end
