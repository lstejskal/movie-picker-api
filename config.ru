$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'movie-picker/api'

map "/" do
  run MoviePicker::Api::Server::Application
end
