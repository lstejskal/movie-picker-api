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

            app.post "/movies" do
              halt 422, json(error: { message: "Missing movie name", payload: params, code: 422 }) unless params[:name]

              if Movie.add(params[:name])
                status 201
                json(data: { movie: { name: params[:name] } }, code: 201)
              else
                status 500
                json(error: { message: "Cannot save movie", payload: params, code: 500 })
              end
            end

            # pick random movie

          end
        end
      end
    end
  end
end
