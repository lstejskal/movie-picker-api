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

        should "add movie" do
          Movie.add('Jurrasic Park')
          movies = Movie.all
          assert_equal 6, movies.size
          assert movies.include?('Jurrasic Park')
        end

        should "pick random movie from list" do
          movie = Movie.all.first

          Movie.redis.expects(:srandmember).returns(movie)

          Movie.pick_random

          movies = Movie.all
          assert_equal 4, movies.size
          assert ! movies.include?(movie)
        end

      end

    end

  end

end
