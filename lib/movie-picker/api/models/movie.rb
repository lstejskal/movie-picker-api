module MoviePicker
  module Api
    module Models
      class Movie < Base
        attr_accessor :name

        def initialize(params = {})
          @name = params[:name]
        end

        def self.add(params = {})
          params = { name: params } unless params.is_a?(Hash) # for convenience
          movie = self.new(params)

          return false unless movie.valid?

          redis.sadd(self.redis_key, movie.name)
        end

        def self.pick_random()
          movie = redis.srandmember(self.redis_key) 
          redis.srem(self.redis_key, movie)
          movie
        end

        def self.all()
          redis.smembers(self.redis_key)
        end

        def self.redis_key
          [ REDIS_NAMESPACE, 'movies' ].join(':')
        end

      end
    end
  end
end
