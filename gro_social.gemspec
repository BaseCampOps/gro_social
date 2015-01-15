# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gro_social/version'

Gem::Specification.new do |spec|
  spec.name          = 'gro_social'
  spec.version       = GroSocial::VERSION
  spec.authors       = ['James Thompson']
  spec.email         = %w{james@buypd.com}
  spec.summary       = %q{Ruby client for GroSocial's REST API}
  spec.description   = %q{A simple Ruby client for GroSocial's REST API}
  spec.homepage      = 'https://github.com/BaseCampOps/gro_social'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
