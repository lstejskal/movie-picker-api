module MoviePicker
  module Api
    module Server
      module Endpoints
        module Movies
          include Models

          def self.registered(app)

            app.get "/movies" do
              movies = Movie.all

              status 200
              json(data: { movies: movies })
            end

            # add movie

            # pick random movie

          end
        end
      end
    end
  end
end
