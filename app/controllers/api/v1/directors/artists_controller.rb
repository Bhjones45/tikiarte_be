class Api::V1::Directors::ArtistsController < ApplicationController
  def index
    director = Director.find(params[:director_id])
    render json: DirectorArtistSerializer.new(director)
  end

  def create
    artist = Artist.create(artist_params)
    render json: ArtistSerializer.new(artist)
  end

  def show
    artist = Artist.find(params[:id])
    render json: ArtistSerializer.new(artist)
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    render json: ArtistSerializer.new(artist)
  end

  def delete
    artist = Artist.find(params[:id])
    artist.delete
  end

  private

  def artist_params
    params.require(:artist).permit(:username, :password).merge(director_id: params[:director_id])
  end
end
