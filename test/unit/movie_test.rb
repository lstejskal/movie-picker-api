require 'test_helper'

module MoviePicker
  module Api

    class MovieTest < Minitest::Test

      include Models

      context "Movie" do

        setup do
          Movie.redis.del(Movie.redis_key)
          5.times { Movie.add(FactoryGirl.build(:movie).name) }
        end

        teardown do
          Movie.redis.del(Movie.redis_key)
        end

        should "return all movies" do
          movies = Movie.all
          assert_equal 5, movies.size
        end

      end

    end

  end

end
