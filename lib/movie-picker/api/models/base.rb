
module MoviePicker
  module Api
    module Models
      class Base

        REDIS_NAMESPACE = 'movie-picker'

        # TODO activemodel compatible and validations

        # TODO name present and unique
        def valid?
          true 
        end

        def self.redis
          @redis ||= Redis.new(:url => (ENV['REDIS_URL'] || 'redis://localhost:6379/9'))
        end

      end
    end
  end
end
