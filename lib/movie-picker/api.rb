require 'bundler'
Bundler.setup

require 'redis'
require 'multi_json'
require 'active_support/inflector'

require 'movie-picker/api/logger'
require 'movie-picker/api/version'

require 'movie-picker/api/models/base'
require 'movie-picker/api/models/movie'

require 'movie-picker/api/server/endpoints/movies'
require 'movie-picker/api/server/application'

module MoviePicker
  module Api

  end
end
