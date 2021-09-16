class Api::V1::SessionsController < ApplicationController
  def create
    director = Director.find_or_create_by(email: params[:director][:email])
    director.update(director_params)
    render json: DirectorSerializer.new(director)
  end

  private

  def director_params
    params.require(:director).permit(:email, :token, :google_id)
  end
end
