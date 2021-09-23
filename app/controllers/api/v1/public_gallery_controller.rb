class Api::V1::PublicGalleryController < ApplicationController
  def index
    public_images = Image.find_public_images
    public_images.sorted
    render json: PublicGallerySerializer.new(public_images)
  end
end
