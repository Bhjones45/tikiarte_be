class Api::V1::DirectorsController < ApplicationController

  def show
    director = Director.find(params[:id])
    render json: DirectorSerializer.new(director)
  end
end
