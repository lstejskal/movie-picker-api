ENV["LOGGER"] = "/dev/null"
ENV["REDIS_URL"] = "redis://localhost:6379/10"

require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
  add_group "Models",      "models"
  add_group "Controllers", "server"
end

require 'bundler/setup'

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'rack/test'
require 'shoulda/context'
require 'mocha/setup'
require 'pry'

require 'movie-picker/api'

require 'faker'
require 'factory_girl'
Dir[File.dirname(__FILE__)+"/factories/*.rb"].each { |file| require file }

class IntegrationTestCase < Minitest::Test
  include Rack::Test::Methods

  alias response last_response

  def teardown
    super
    MoviePicker::Api::Models::Base.redis.flushdb
  end

  def app
    MoviePicker::Api::Server::Application
  end

  def json(json)
    MultiJson.load(json, symbolize_keys: true)
  end
end
