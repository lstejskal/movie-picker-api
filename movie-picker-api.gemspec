# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movie-picker/api/version'

Gem::Specification.new do |spec|
  spec.name          = "movie-picker-api"
  spec.version       = MoviePicker::Api::VERSION
  spec.authors       = ["Lukas Stejskal"]
  spec.email         = ["lucastej.cz@gmail.com"]

  spec.summary       = %q{Provides API for Movie Picker related data (movies, users...)}
  spec.description   = %q{Provides API for Movie Picker related data (movies, users...)}
  spec.homepage      = "https://github.com/lstejskal/movie-picker-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_dependency "rack"
  spec.add_dependency "rack-parser"
  spec.add_dependency "sinatra"
  spec.add_dependency "redis"

#  for virtual models
#  spec.add_dependency "hashie"
#  spec.add_dependency "virtus"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "shoulda-context"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "mocha"
end
