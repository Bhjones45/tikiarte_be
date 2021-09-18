class Api::V1::Directors::ArtistsController < ApplicationController

  def index
    director = Director.find(params[:director_id])
    # artists = director.artists.all
    render json: DirectorArtistSerializer.new(director)
  end

end
