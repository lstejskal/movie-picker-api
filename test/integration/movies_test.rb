require 'test_helper'

module MoviePicker
  module Api
    module Server
      class MoviesTest < IntegrationTestCase
        include MoviePicker::Api::Models

        context "Movies" do

          setup do
            Movie.redis.del(Movie.redis_key)
            5.times { Movie.add(FactoryGirl.build(:movie).name) }
          end

          teardown do
            Movie.redis.del(Movie.redis_key)
          end

          should "be returned" do
            get "/movies"

            assert_equal 200, response.status
            movies = json(response.body)[:data][:movies]

            assert_equal 5, movies.size
          end

          should "be added" do
            params = { name: "Jurrasic Park" }

            post "/movies", MultiJson.dump(params)

            assert_equal 201, response.status

            movies = Movie.all
            assert_equal 6, movies.size
            assert movies.include?("Jurrasic Park")
          end

          should "not be added if invalid" do

            post "/movies", MultiJson.dump({})

            assert_equal 422, response.status

            movies = Movie.all
            assert_equal 5, movies.size
          end



        end

      end
    end
  end
end
