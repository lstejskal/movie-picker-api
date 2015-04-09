require 'logger'

$stdout.sync = true

module MoviePicker
  module Api
    module Logger

      def logger
        @logger ||= ::Logger.new(ENV["LOGGER"] || STDOUT)
      end

      def log_level
        @log_level ||= (ENV['LOGGER_LOG_LEVEL'] || 1).to_i
      end

    end
  end
end

include MoviePicker::Api::Logger

logger.level = log_level
