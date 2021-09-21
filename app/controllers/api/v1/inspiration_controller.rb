class Api::V1::InspirationController < ApplicationController
  def index
    image = LoremPicsumService.random_picture
    render json: InspirationSerializer.format_data(image)
  end
end
