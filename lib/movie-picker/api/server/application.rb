require 'rack/parser'
require 'sinatra/base'

module MoviePicker
  module Api
    module Server
      class Application < Sinatra::Base
        include MoviePicker::Api::Models

        enable :logging
        set :logging, Logger::DEBUG if ENV["DEBUG"]

        configure :development, :test do
          disable :logging
          enable :dump_errors, :raise_errors, :show_exceptions
        end

        use Rack::Parser, :parsers => { 
          ".*" => proc { |body| MultiJson.load(body, symbolize_keys: true) } 
        }

        before do
          # params.symbolize_keys!
          content_type "application/json"
        end

        def json(value)
          MultiJson.dump value # , indent: 2 getting weird error
        end

        register Endpoints::Movies
      end
    end
  end
end